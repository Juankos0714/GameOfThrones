/**
 * Data fetching service — reads content from Supabase.
 * Falls back gracefully if Supabase is not configured.
 *
 * Supabase client is lazy-loaded: only imported when env vars are present,
 * keeping the 220KB supabase-js bundle out of the initial page load.
 */
import type { House, HouseMember, TimelineEvent, Place } from '@/types'

// ── Lazy Supabase client ──

type SupabaseClient = ReturnType<typeof import('@supabase/supabase-js').createClient>

let _db: SupabaseClient | null = null
const _configured = !!(
  import.meta.env.VITE_SUPABASE_URL &&
  import.meta.env.VITE_SUPABASE_ANON_KEY &&
  !String(import.meta.env.VITE_SUPABASE_URL).includes('placeholder')
)

async function getDb(): Promise<SupabaseClient> {
  if (_db) return _db
  if (!_configured) throw new Error('Supabase not configured')
  const { createClient } = await import('@supabase/supabase-js')
  _db = createClient(
    import.meta.env.VITE_SUPABASE_URL!,
    import.meta.env.VITE_SUPABASE_ANON_KEY!,
  )
  return _db
}

function isConfigured(): boolean {
  return _configured
}

// ── Houses ──

const sigilMap: Record<string, string> = {
  stark: 'TreePine',
  lannister: 'Crown',
  targaryen: 'Flame',
  baratheon: 'Swords',
  tyrell: 'Flower2',
  martell: 'Flame',
  greyjoy: 'Anchor',
  arryn: 'Mountain',
  tully: 'Waves',
}

const paletteMap: Record<string, { primary: string; deep: string; secondary?: string; accent?: string; glow?: string }> = {
  stark:     { primary: '#9eb5c0', deep: '#111b20', secondary: '#7a96a8', accent: '#c5d4df', glow: 'rgba(158, 181, 192, 0.15)' },
  lannister: { primary: '#b79b5e', deep: '#24140d', secondary: '#8a7340', accent: '#d4c08a', glow: 'rgba(183, 155, 94, 0.15)' },
  targaryen: { primary: '#a84a40', deep: '#230d0b', secondary: '#7a3028', accent: '#d47060', glow: 'rgba(168, 74, 64, 0.15)' },
  baratheon: { primary: '#b29a55', deep: '#15191b', secondary: '#8a7a3a', accent: '#d4c080', glow: 'rgba(178, 154, 85, 0.15)' },
  tyrell:    { primary: '#859b6b', deep: '#11190f', secondary: '#5e7a4a', accent: '#a8c08a', glow: 'rgba(133, 155, 107, 0.15)' },
  martell:   { primary: '#b9794f', deep: '#25150d', secondary: '#8a5a35', accent: '#d4a070', glow: 'rgba(185, 121, 79, 0.15)' },
  greyjoy:   { primary: '#76959e', deep: '#0e191c', secondary: '#4a7078', accent: '#a0bec5', glow: 'rgba(118, 149, 158, 0.15)' },
  arryn:     { primary: '#a9bbc3', deep: '#121a1e', secondary: '#7a98a3', accent: '#d0e0e8', glow: 'rgba(169, 187, 195, 0.15)' },
  tully:     { primary: '#7794a5', deep: '#111a20', secondary: '#4a6a7a', accent: '#a0c0d0', glow: 'rgba(119, 148, 165, 0.15)' },
}

export async function fetchHousesFromSupabase(): Promise<House[] | null> {
  if (!isConfigured()) return null

  try {
    const db = await getDb()

    const { data: houses, error } = await db
      .from('houses')
      .select('*')
      .order('name')

    if (error || !houses) {
      console.warn('[data] Failed to fetch houses:', error?.message)
      return null
    }

    // Fetch all characters to group by house
    const { data: characters } = await db
      .from('characters')
      .select('*')
      .order('name')

    const membersByHouse = new Map<string, HouseMember[]>()
    for (const char of characters ?? []) {
      if (!(char as any).house_id) continue
      const hid = (char as any).house_id as string
      if (!membersByHouse.has(hid)) membersByHouse.set(hid, [])
      membersByHouse.get(hid)!.push({
        name: (char as any).name,
        title: (char as any).aliases?.[0] ?? (char as any).culture ?? 'Miembro',
        status: (char as any).status === 'vivo' ? 'alive' : (char as any).status === 'muerto' ? 'deceased' : 'unknown',
      })
    }

    return houses.map((h: any) => ({
      id: h.slug,
      slug: h.slug,
      name: h.name,
      motto: h.words ?? '',
      sigil: sigilMap[h.slug] ?? 'Shield',
      region: h.region ?? '',
      seat: h.seat ?? '',
      founded: 'Edad de los Héroes',
      material: h.colors ?? '',
      summary: h.description ?? '',
      history: h.description ?? '',
      palette: paletteMap[h.slug] ?? { primary: '#888', deep: '#222' },
      members: membersByHouse.get(h.id) ?? [],
      allies: [],
      rivals: [],
      lands: [h.seat, h.region].filter(Boolean),
      events: [],
    }))
  } catch (e) {
    console.warn('[data] Supabase not available:', e)
    return null
  }
}

// ── Characters ──

export async function fetchCharactersFromSupabase(): Promise<Array<{
  id: string
  name: string
  title: string
  status: string
  houseName: string
  houseSlug: string
}> | null> {
  if (!isConfigured()) return null

  try {
    const db = await getDb()

    const { data, error } = await db
      .from('characters')
      .select('*, houses(name, slug)')
      .order('name')

    if (error || !data) {
      console.warn('[data] Failed to fetch characters:', error?.message)
      return null
    }

    return data.map((c: any) => ({
      id: c.slug ?? c.id,
      name: c.name,
      title: c.aliases?.[0] ?? c.culture ?? '',
      status: c.status,
      houseName: c.houses?.name ?? '',
      houseSlug: c.houses?.slug ?? '',
    }))
  } catch {
    return null
  }
}

// ── Locations ──

export async function fetchLocationsFromSupabase(): Promise<Place[] | null> {
  if (!isConfigured()) return null

  try {
    const db = await getDb()

    const { data, error } = await db
      .from('locations')
      .select('*')
      .order('name')

    if (error || !data) {
      console.warn('[data] Failed to fetch locations:', error?.message)
      return null
    }

    return data.map((l: any) => ({
      id: l.id,
      slug: l.slug,
      name: l.name,
      region: l.region ?? '',
      description: l.description ?? '',
      coordinates: { x: l.map_x ?? 0, y: l.map_y ?? 0 },
    }))
  } catch {
    return null
  }
}

// ── Events ──

export async function fetchEventsFromSupabase(): Promise<TimelineEvent[] | null> {
  if (!isConfigured()) return null

  try {
    const db = await getDb()

    const { data, error } = await db
      .from('events')
      .select('*')
      .order('year_in_universe')

    if (error || !data) {
      console.warn('[data] Failed to fetch events:', error?.message)
      return null
    }

    return data.map((e: any) => ({
      id: e.id,
      title: e.title,
      description: e.description ?? '',
      date: parseInt(String(e.year_in_universe ?? '0').replace(/[^0-9-]/g, ''), 10) || 0,
    }))
  } catch {
    return null
  }
}

// ── Search (Supabase FTS) ──

export async function searchSupabase(query: string): Promise<Array<{
  type: string
  id: string
  title: string
  subtitle: string
}> | null> {
  if (!isConfigured() || !query || !query.trim()) return null

  try {
    const db = await getDb()

    const { data, error } = await (db as any).rpc('search_all', { query: query.trim() })

    if (error || !data) {
      console.warn('[data] FTS search failed:', error?.message)
      return null
    }

    return (data as any[]).map((r) => ({
      type: r.entity_type,
      id: r.entity_id,
      title: r.title,
      subtitle: r.subtitle ?? '',
    }))
  } catch {
    return null
  }
}
