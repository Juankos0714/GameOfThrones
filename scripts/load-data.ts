/**
 * scripts/load-data.ts
 *
 * Lee los JSON de data/extracted/ y los carga en Supabase.
 * Uso: npx tsx scripts/load-data.ts
 *
 * Requiere:
 *   - SUPABASE_URL (o VITE_SUPABASE_URL)
 *   - SUPABASE_SERVICE_ROLE_KEY (service_role, NUNCA anon)
 */

import { createClient } from '@supabase/supabase-js'
import { readFileSync, writeFileSync, mkdirSync, existsSync } from 'node:fs'
import { resolve } from 'node:path'
import { z } from 'zod'

// ─── Config ──────────────────────────────────────────────────────────────────

const supabaseUrl = process.env.SUPABASE_URL || process.env.VITE_SUPABASE_URL
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY

if (!supabaseUrl || !supabaseKey) {
  console.error('❌ Faltan SUPABASE_URL y/o SUPABASE_SERVICE_ROLE_KEY')
  process.exit(1)
}

const supabase = createClient(supabaseUrl, supabaseKey)
const PROJECT_ROOT = resolve(import.meta.dirname ?? '.', '..')
const EXTRACTED_DIR = resolve(PROJECT_ROOT, 'data', 'extracted')

// ─── Helpers ─────────────────────────────────────────────────────────────────

function toSlug(name: string): string {
  return name
    .toLowerCase()
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-|-$/g, '')
}

function slugWithSuffix(slug: string, suffix: string): string {
  return `${slug}-${toSlug(suffix)}`
}

function ensureUniqueSlug(
  base: string,
  existingSlugs: Set<string>,
  suffix?: string
): string {
  let slug = suffix ? slugWithSuffix(base, suffix) : base
  let i = 1
  while (existingSlugs.has(slug)) {
    slug = suffix ? `${slugWithSuffix(base, suffix)}-${i}` : `${base}-${i}`
    i++
  }
  existingSlugs.add(slug)
  return slug
}

function readJson<T>(filename: string): T[] {
  const path = resolve(EXTRACTED_DIR, filename)
  if (!existsSync(path)) {
    console.warn(`⚠️  Archivo no encontrado: ${filename}`)
    return []
  }
  const raw = readFileSync(path, 'utf-8')
  return JSON.parse(raw) as T[]
}

function splitMulti(value: string | undefined): string[] {
  if (!value || value === 'Desconocido' || value === 'Ninguno') return []
  return value
    .split(';')
    .map((s) => s.trim())
    .filter(Boolean)
}

type UnresolvedRef = { entity: string; field: string; value: string }
const unresolved: UnresolvedRef[] = []

// ─── Zod Schemas ─────────────────────────────────────────────────────────────

const CasasSchema = z.object({
  nombre: z.string().min(1),
  region: z.string().optional(),
  lema: z.string().optional(),
  asiento: z.string().optional(),
  colores: z.string().optional(),
  descripcion: z.string().optional(),
})

const PersonajesSchema = z.object({
  nombre: z.string().min(1),
  alias: z.array(z.string()).default([]),
  casa: z.string().nullable().optional(),
  cultura: z.string().nullable().optional(),
  estado: z.enum(['vivo', 'muerto', 'desconocido']).default('desconocido'),
  nacimiento: z.string().nullable().optional(),
  muerte: z.string().nullable().optional(),
  padre: z.string().nullable().optional(),
  madre: z.string().nullable().optional(),
  conyuges: z.array(z.string()).default([]),
  hijos: z.array(z.string()).default([]),
  hermanos: z.array(z.string()).default([]),
  descripcion: z.string().optional(),
})

const LugaresSchema = z.object({
  nombre: z.string().min(1),
  region: z.string().optional(),
  descripcion: z.string().optional(),
})

const EventosSchema = z.object({
  titulo: z.string().min(1),
  anio: z.string().nullable().optional(),
  lugar: z.string().nullable().optional(),
  personajes_involucrados: z.array(z.string()).default([]),
  descripcion: z.string().optional(),
})

// ─── Summary ─────────────────────────────────────────────────────────────────

const summary: Record<string, number> = {
  houses: 0,
  characters: 0,
  character_relations: 0,
  locations: 0,
  events: 0,
  event_characters: 0,
}

// ─── Main ────────────────────────────────────────────────────────────────────

async function loadHouses(): Promise<Map<string, string>> {
  console.log('\n🏠 Cargando casas...')
  const records = readJson<any>('houses.json')
  const slugSet = new Set<string>()
  const nameToId = new Map<string, string>()

  const { data: existing } = await supabase.from('houses').select('id, name')
  existing?.forEach((h) => nameToId.set(h.name, h.id))

  for (const raw of records) {
    const parsed = CasasSchema.safeParse(raw)
    if (!parsed.success) {
      console.warn(
        `  ⚠️  Saltando fila (casas): ${parsed.error.issues.map((i) => i.message).join(', ')}`
      )
      continue
    }

    const d = parsed.data
    const slug = nameToId.has(d.nombre)
      ? toSlug(d.nombre)
      : ensureUniqueSlug(toSlug(d.nombre), slugSet)

    const row = {
      name: d.nombre,
      region: d.region ?? null,
      words: d.lema ?? null,
      seat: d.asiento ?? null,
      colors: d.colores ?? null,
      description: d.descripcion ?? null,
    }

    if (nameToId.has(d.nombre)) {
      const { error } = await supabase
        .from('houses')
        .update(row)
        .eq('name', d.nombre)
      if (error) {
        console.error(`  ❌ Error actualizando "${d.nombre}":`, error.message)
        continue
      }
    } else {
      const { data, error } = await supabase
        .from('houses')
        .insert(row)
        .select('id')
        .single()
      if (error) {
        console.error(`  ❌ Error insertando "${d.nombre}":`, error.message)
        continue
      }
      nameToId.set(d.nombre, data.id)
    }

    summary.houses++
    console.log(`  ✅ ${d.nombre}`)
  }

  return nameToId
}

async function loadCharacters(
  houseNameToId: Map<string, string>
): Promise<Map<string, string>> {
  console.log('\n👤 Cargando personajes...')
  const records = readJson<any>('characters.json')
  const nameToId = new Map<string, string>()

  const { data: existing } = await supabase
    .from('characters')
    .select('id, name')
  existing?.forEach((c) => nameToId.set(c.name, c.id))

  for (const raw of records) {
    const parsed = PersonajesSchema.safeParse(raw)
    if (!parsed.success) {
      console.warn(
        `  ⚠️  Saltando fila (personajes): ${parsed.error.issues.map((i) => i.message).join(', ')}`
      )
      continue
    }

    const d = parsed.data
    const houseId = d.casa ? houseNameToId.get(d.casa) ?? null : null

    if (d.casa && !houseNameToId.has(d.casa)) {
      unresolved.push({
        entity: `Personaje "${d.nombre}"`,
        field: 'casa',
        value: d.casa,
      })
    }

    const row = {
      name: d.nombre,
      aliases: d.alias,
      house_id: houseId,
      culture: d.cultura ?? null,
      status: d.estado,
      born: d.nacimiento ?? null,
      died: d.muerte ?? null,
      description: d.descripcion ?? null,
    }

    if (nameToId.has(d.nombre)) {
      const { error } = await supabase
        .from('characters')
        .update(row)
        .eq('name', d.nombre)
      if (error) {
        console.error(`  ❌ Error actualizando "${d.nombre}":`, error.message)
        continue
      }
    } else {
      const { data, error } = await supabase
        .from('characters')
        .insert(row)
        .select('id')
        .single()
      if (error) {
        console.error(`  ❌ Error insertando "${d.nombre}":`, error.message)
        continue
      }
      nameToId.set(d.nombre, data.id)
    }

    summary.characters++
    console.log(`  ✅ ${d.nombre}`)
  }

  return nameToId
}

async function loadCharacterRelations(
  charNameToId: Map<string, string>
): Promise<void> {
  console.log('\n🔗 Cargando relaciones familiares...')
  const records = readJson<any>('characters.json')

  const { data: existingRelations } = await supabase
    .from('character_relations')
    .select('character_id, related_character_id, relation_type')
  const existingSet = new Set(
    existingRelations?.map(
      (r) => `${r.character_id}|${r.related_character_id}|${r.relation_type}`
    ) ?? []
  )

  type RelationField = {
    field: string
    relationType: string
  }
  const relationFields: RelationField[] = [
    { field: 'padre', relationType: 'padre' },
    { field: 'madre', relationType: 'madre' },
    { field: 'hijos', relationType: 'hijo' },
    { field: 'conyuges', relationType: 'cónyuge' },
    { field: 'hermanos', relationType: 'hermano' },
  ]

  for (const raw of records) {
    const parsed = PersonajesSchema.safeParse(raw)
    if (!parsed.success) continue

    const d = parsed.data
    const charId = charNameToId.get(d.nombre)
    if (!charId) continue

    for (const { field, relationType } of relationFields) {
      let names: string[] = []

      if (field === 'padre' && d.padre) names = [d.padre]
      else if (field === 'madre' && d.madre) names = [d.madre]
      else if (field === 'hijos') names = d.hijos
      else if (field === 'conyuges') names = d.conyuges
      else if (field === 'hermanos') names = d.hermanos

      for (const relatedName of names) {
        const relatedId = charNameToId.get(relatedName)
        if (!relatedId) {
          unresolved.push({
            entity: `Personaje "${d.nombre}"`,
            field,
            value: relatedName,
          })
          continue
        }

        const key = `${charId}|${relatedId}|${relationType}`
        if (existingSet.has(key)) continue

        const { error } = await supabase.from('character_relations').insert({
          character_id: charId,
          related_character_id: relatedId,
          relation_type: relationType,
        })

        if (error) {
          if (!error.message.includes('duplicate')) {
            console.error(
              `  ❌ Relación ${d.nombre} → ${relatedName} (${relationType}):`,
              error.message
            )
          }
          continue
        }

        summary.character_relations++
      }
    }

    console.log(`  ✅ ${d.nombre}`)
  }
}

async function loadLocations(): Promise<Map<string, string>> {
  console.log('\n📍 Cargando lugares...')
  const records = readJson<any>('locations.json')
  const nameToId = new Map<string, string>()

  const { data: existing } = await supabase
    .from('locations')
    .select('id, name')
  existing?.forEach((l) => nameToId.set(l.name, l.id))

  for (const raw of records) {
    const parsed = LugaresSchema.safeParse(raw)
    if (!parsed.success) {
      console.warn(
        `  ⚠️  Saltando fila (lugares): ${parsed.error.issues.map((i) => i.message).join(', ')}`
      )
      continue
    }

    const d = parsed.data
    const row = {
      name: d.nombre,
      region: d.region ?? null,
      description: d.descripcion ?? null,
    }

    if (nameToId.has(d.nombre)) {
      const { error } = await supabase
        .from('locations')
        .update(row)
        .eq('name', d.nombre)
      if (error) {
        console.error(`  ❌ Error actualizando "${d.nombre}":`, error.message)
        continue
      }
    } else {
      const { data, error } = await supabase
        .from('locations')
        .insert(row)
        .select('id')
        .single()
      if (error) {
        console.error(`  ❌ Error insertando "${d.nombre}":`, error.message)
        continue
      }
      nameToId.set(d.nombre, data.id)
    }

    summary.locations++
    console.log(`  ✅ ${d.nombre}`)
  }

  return nameToId
}

async function loadEvents(
  locNameToId: Map<string, string>,
  charNameToId: Map<string, string>
): Promise<void> {
  console.log('\n📅 Cargando eventos...')
  const records = readJson<any>('events.json')
  const titleToId = new Map<string, string>()

  const { data: existing } = await supabase
    .from('events')
    .select('id, title')
  existing?.forEach((e) => titleToId.set(e.title, e.id))

  for (const raw of records) {
    const parsed = EventosSchema.safeParse(raw)
    if (!parsed.success) {
      console.warn(
        `  ⚠️  Saltando fila (eventos): ${parsed.error.issues.map((i) => i.message).join(', ')}`
      )
      continue
    }

    const d = parsed.data
    const locationId = d.lugar ? locNameToId.get(d.lugar) ?? null : null

    if (d.lugar && !locNameToId.has(d.lugar)) {
      unresolved.push({
        entity: `Evento "${d.titulo}"`,
        field: 'lugar',
        value: d.lugar,
      })
    }

    const row = {
      title: d.titulo,
      year_in_universe: d.anio ?? null,
      description: d.descripcion ?? null,
      location_id: locationId,
    }

    let eventId: string | undefined

    if (titleToId.has(d.titulo)) {
      const { error } = await supabase
        .from('events')
        .update(row)
        .eq('title', d.titulo)
      if (error) {
        console.error(`  ❌ Error actualizando "${d.titulo}":`, error.message)
        continue
      }
      eventId = titleToId.get(d.titulo)
    } else {
      const { data, error } = await supabase
        .from('events')
        .insert(row)
        .select('id')
        .single()
      if (error) {
        console.error(`  ❌ Error insertando "${d.titulo}":`, error.message)
        continue
      }
      eventId = data.id
      titleToId.set(d.titulo, data.id)
    }

    // event_characters
    for (const charName of d.personajes_involucrados) {
      const charId = charNameToId.get(charName)
      if (!charId) {
        unresolved.push({
          entity: `Evento "${d.titulo}"`,
          field: 'personajes_involucrados',
          value: charName,
        })
        continue
      }

      const { error } = await supabase.from('event_characters').upsert(
        { event_id: eventId!, character_id: charId },
        { onConflict: 'event_id,character_id' }
      )

      if (error && !error.message.includes('duplicate')) {
        console.error(
          `  ❌ Event-char ${d.titulo} → ${charName}:`,
          error.message
        )
        continue
      }

      summary.event_characters++
    }

    summary.events++
    console.log(`  ✅ ${d.titulo}`)
  }
}

// ─── Entry ───────────────────────────────────────────────────────────────────

async function main() {
  console.log('═══════════════════════════════════════════════')
  console.log('  📦 ARCHIVO DE PONIENTE — Loader de datos')
  console.log('═══════════════════════════════════════════════')
  console.log(`  📂 Directorio: ${EXTRACTED_DIR}`)
  console.log(`  🔗 Supabase: ${supabaseUrl}`)

  try {
    // 1. Casas
    const houseNameToId = await loadHouses()

    // 2. Personajes
    const charNameToId = await loadCharacters(houseNameToId)

    // 3. Relaciones familiares
    await loadCharacterRelations(charNameToId)

    // 4. Lugares
    const locNameToId = await loadLocations()

    // 5. Eventos + event_characters
    await loadEvents(locNameToId, charNameToId)

    // Resumen
    console.log('\n═══════════════════════════════════════════════')
    console.log('  📊 RESUMEN')
    console.log('═══════════════════════════════════════════════')
    console.log(`  🏠 Casas:                    ${summary.houses}`)
    console.log(`  👤 Personajes:               ${summary.characters}`)
    console.log(`  🔗 Relaciones familiares:    ${summary.character_relations}`)
    console.log(`  📍 Lugares:                  ${summary.locations}`)
    console.log(`  📅 Eventos:                  ${summary.events}`)
    console.log(`  🎭 Evento-personajes:        ${summary.event_characters}`)

    if (unresolved.length > 0) {
      console.log(
        `\n  ⚠️  ${unresolved.length} referencia(s) no resuelta(s):`
      )
      for (const ref of unresolved) {
        console.log(
          `      • ${ref.entity} → ${ref.field} = "${ref.value}"`
        )
      }
    } else {
      console.log('\n  ✅ Todas las referencias resueltas correctamente.')
    }

    console.log('\n═══════════════════════════════════════════════')
    console.log('  ✨ ¡Carga completada!')
    console.log('═══════════════════════════════════════════════')
  } catch (err) {
    console.error('\n❌ Error fatal:', err)
    process.exit(1)
  }
}

main()
