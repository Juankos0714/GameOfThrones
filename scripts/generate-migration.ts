import * as fs from 'fs'
import * as path from 'path'
import { fileURLToPath } from 'url'

const __filename = fileURLToPath(import.meta.url)
const __dirname = path.dirname(__filename)

const DATA_DIR = path.join(__dirname, '..', 'data', 'extracted')
const OUTPUT = path.join(__dirname, '..', 'supabase', 'migrations', '001_load_all_data.sql')

function kebabCase(str: string): string {
  return str
    .normalize('NFD').replace(/[\u0300-\u036f]/g, '')
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-|-$/g, '')
}

function esc(val: string | null | undefined): string {
  if (val === null || val === undefined) return 'NULL'
  return `'${String(val).replace(/'/g, "''")}'`
}

function escArr(arr: string[] | undefined): string {
  if (!arr || arr.length === 0) return 'ARRAY[]::text[]'
  return `ARRAY[${arr.map(v => esc(v)).join(', ')}]`
}

// Load data
const houses: any[] = JSON.parse(fs.readFileSync(path.join(DATA_DIR, 'houses.json'), 'utf8'))
const characters: any[] = JSON.parse(fs.readFileSync(path.join(DATA_DIR, 'characters.json'), 'utf8'))
const locations: any[] = JSON.parse(fs.readFileSync(path.join(DATA_DIR, 'locations.json'), 'utf8'))
const events: any[] = JSON.parse(fs.readFileSync(path.join(DATA_DIR, 'events.json'), 'utf8'))

// Build house slug map
const houseSlugMap = new Map<string, string>()
for (const h of houses) {
  const slug = kebabCase(h.nombre)
  houseSlugMap.set(h.nombre, slug)
}

// Build character slug map (handle duplicates)
const charSlugMap = new Map<string, string>()
const slugCount = new Map<string, number>()
for (const c of characters) {
  let slug = kebabCase(c.nombre)
  if (slugCount.has(slug)) {
    const count = slugCount.get(slug)! + 1
    slugCount.set(slug, count)
    slug = `${slug}-${count}`
  } else {
    slugCount.set(slug, 1)
  }
  charSlugMap.set(c.nombre, slug)
}

// Build location slug map
const locSlugMap = new Map<string, string>()
for (const l of locations) {
  const slug = kebabCase(l.nombre)
  locSlugMap.set(l.nombre, slug)
}

// Build event slug map
const eventSlugMap = new Map<string, string>()
for (const e of events) {
  const slug = kebabCase(e.titulo)
  eventSlugMap.set(e.titulo, slug)
}

let sql = `-- ============================================================
-- Migration 001: Load all ASOIAF data
-- Generated from data/extracted/*.json
-- ============================================================

-- Disable triggers for faster inserts
SET session_replication_role = 'replica';

`

// --- Houses ---
sql += `-- ============================================================\n`
sql += `-- HOUSES (${houses.length})\n`
sql += `-- ============================================================\n\n`

for (const h of houses) {
  const slug = houseSlugMap.get(h.nombre)!
  sql += `INSERT INTO houses (name, slug, region, motto, seat, colors, description)\n`
  sql += `VALUES (${esc(h.nombre)}, ${esc(slug)}, ${esc(h.region)}, ${esc(h.lema)}, ${esc(h.asiento)}, ${esc(h.colores)}, ${esc(h.descripcion)})\n`
  sql += `ON CONFLICT (slug) DO UPDATE SET\n`
  sql += `  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,\n`
  sql += `  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;\n\n`
}

// --- Characters ---
sql += `-- ============================================================\n`
sql += `-- CHARACTERS (${characters.length})\n`
sql += `-- ============================================================\n\n`

const unresolvedRefs: string[] = []

for (const c of characters) {
  const slug = charSlugMap.get(c.nombre)!
  const houseSlug = c.casa ? (houseSlugMap.get(c.casa) || null) : null
  const houseRef = houseSlug ? `(SELECT id FROM houses WHERE slug = ${esc(houseSlug)})` : 'NULL'
  
  sql += `INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)\n`
  sql += `VALUES (\n`
  sql += `  ${esc(c.nombre)},\n`
  sql += `  ${esc(slug)},\n`
  sql += `  ${escArr(c.alias)},\n`
  sql += `  ${houseRef},\n`
  sql += `  ${esc(c.cultura)},\n`
  sql += `  ${esc(c.estado)},\n`
  sql += `  ${esc(c.nacimiento)},\n`
  sql += `  ${esc(c.muerte)},\n`
  sql += `  ${esc(c.descripcion)}\n`
  sql += `)\n`
  sql += `ON CONFLICT (slug) DO UPDATE SET\n`
  sql += `  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,\n`
  sql += `  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,\n`
  sql += `  description = EXCLUDED.description;\n\n`
}

// --- Character Relations ---
sql += `-- ============================================================\n`
sql += `-- CHARACTER RELATIONS\n`
sql += `-- ============================================================\n\n`

const relationTypes: Array<{ field: string; type: string }> = [
  { field: 'padre', type: 'padre' },
  { field: 'madre', type: 'madre' },
  { field: 'conyuges', type: 'conyuge' },
  { field: 'hijos', type: 'hijo' },
  { field: 'hermanos', type: 'hermano' },
]

sql += `DO $$\nDECLARE\n  ch RECORD;\n  rel TEXT;\n  related_slug TEXT;\nBEGIN\n`

for (const c of characters) {
  const charSlug = charSlugMap.get(c.nombre)!
  
  for (const { field, type } of relationTypes) {
    const values: string[] = Array.isArray(c[field]) ? c[field] : (c[field] ? [c[field]] : [])
    
    for (const relName of values) {
      if (!relName) continue
      const relSlug = charSlugMap.get(relName)
      if (relSlug) {
        sql += `  -- ${c.nombre} -> ${relName} (${type})\n`
        sql += `  SELECT slug INTO related_slug FROM characters WHERE slug = ${esc(relSlug)};\n`
        sql += `  IF FOUND THEN\n`
        sql += `    INSERT INTO character_relations (character_id, related_character_id, relation_type)\n`
        sql += `    SELECT c1.id, c2.id, ${esc(type)}\n`
        sql += `    FROM characters c1, characters c2\n`
        sql += `    WHERE c1.slug = ${esc(charSlug)} AND c2.slug = ${esc(relSlug)}\n`
        sql += `    ON CONFLICT DO NOTHING;\n`
        sql += `  ELSE\n`
        sql += `    RAISE NOTICE 'Unresolved: % mentions % (% = %)', ${esc(c.nombre)}, ${esc(relName)}, ${esc(field)}, ${esc(relSlug)};\n`
        sql += `  END IF;\n\n`
      } else {
        unresolvedRefs.push(`${c.nombre} mentions ${field} '${relName}' but no character found`)
      }
    }
  }
}

sql += `END $$;\n\n`

// --- Locations ---
sql += `-- ============================================================\n`
sql += `-- LOCATIONS (${locations.length})\n`
sql += `-- ============================================================\n\n`

for (const l of locations) {
  const slug = locSlugMap.get(l.nombre)!
  sql += `INSERT INTO locations (name, slug, region, description)\n`
  sql += `VALUES (${esc(l.nombre)}, ${esc(slug)}, ${esc(l.region)}, ${esc(l.descripcion)})\n`
  sql += `ON CONFLICT (slug) DO UPDATE SET\n`
  sql += `  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;\n\n`
}

// --- Events ---
sql += `-- ============================================================\n`
sql += `-- EVENTS (${events.length})\n`
sql += `-- ============================================================\n\n`

for (const e of events) {
  const slug = eventSlugMap.get(e.titulo)!
  const locSlug = e.lugar ? (locSlugMap.get(e.lugar) || null) : null
  const locRef = locSlug ? `(SELECT id FROM locations WHERE slug = ${esc(locSlug)})` : 'NULL'
  
  sql += `INSERT INTO events (name, slug, year, location_id, description)\n`
  sql += `VALUES (\n`
  sql += `  ${esc(e.titulo)},\n`
  sql += `  ${esc(slug)},\n`
  sql += `  ${esc(e.anio)},\n`
  sql += `  ${locRef},\n`
  sql += `  ${esc(e.descripcion)}\n`
  sql += `)\n`
  sql += `ON CONFLICT (slug) DO UPDATE SET\n`
  sql += `  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;\n\n`
}

// --- Event Characters ---
sql += `-- ============================================================\n`
sql += `-- EVENT CHARACTERS\n`
sql += `-- ============================================================\n\n`

sql += `DO $$\nDECLARE\n  ev RECORD;\n  ch_name TEXT;\n  char_slug TEXT;\nBEGIN\n`

for (const e of events) {
  const eventSlug = eventSlugMap.get(e.titulo)!
  const chars: string[] = Array.isArray(e.personajes_involucrados) ? e.personajes_involucrados : []
  
  for (const chName of chars) {
    const chSlug = charSlugMap.get(chName)
    if (chSlug) {
      sql += `  -- ${e.titulo} -> ${chName}\n`
      sql += `  SELECT slug INTO char_slug FROM characters WHERE slug = ${esc(chSlug)};\n`
      sql += `  IF FOUND THEN\n`
      sql += `    INSERT INTO event_characters (event_id, character_id)\n`
      sql += `    SELECT e1.id, c1.id\n`
      sql += `    FROM events e1, characters c1\n`
      sql += `    WHERE e1.slug = ${esc(eventSlug)} AND c1.slug = ${esc(chSlug)}\n`
      sql += `    ON CONFLICT DO NOTHING;\n`
      sql += `  ELSE\n`
      sql += `    RAISE NOTICE 'Event %: unresolved character %', ${esc(e.titulo)}, ${esc(chName)};\n`
      sql += `  END IF;\n\n`
    } else {
      unresolvedRefs.push(`Event '${e.titulo}' mentions character '${chName}' but not found`)
    }
  }
}

sql += `END $$;\n\n`

// --- Re-enable triggers ---
sql += `SET session_replication_role = 'origin';\n\n`

// --- Summary ---
sql += `-- ============================================================\n`
sql += `-- MIGRATION SUMMARY\n`
sql += `-- ============================================================\n`
sql += `-- Houses:     ${houses.length}\n`
sql += `-- Characters: ${characters.length}\n`
sql += `-- Locations:  ${locations.length}\n`
sql += `-- Events:     ${events.length}\n`
sql += `-- Total:      ${houses.length + characters.length + locations.length + events.length}\n`

if (unresolvedRefs.length > 0) {
  sql += `--\n-- UNRESOLVED REFERENCES (${unresolvedRefs.length}):\n`
  for (const ref of unresolvedRefs) {
    sql += `--   ${ref}\n`
  }
}

sql += `\n-- Done!\n`

fs.writeFileSync(OUTPUT, sql, 'utf8')

console.log(`Migration written to ${OUTPUT}`)
console.log(`\nSummary:`)
console.log(`  Houses:     ${houses.length}`)
console.log(`  Characters: ${characters.length}`)
console.log(`  Locations:  ${locations.length}`)
console.log(`  Events:     ${events.length}`)
console.log(`  Total:      ${houses.length + characters.length + locations.length + events.length}`)
console.log(`\nUnresolved references: ${unresolvedRefs.length}`)
for (const ref of unresolvedRefs) {
  console.log(`  - ${ref}`)
}
