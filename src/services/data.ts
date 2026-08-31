/**
 * Data fetching service — reads content from Supabase.
 * Falls back gracefully if Supabase is not configured.
 */
import { createClient } from '@supabase/supabase-js'
import type { House, HouseMember, TimelineEvent, Place } from '@/types'

// Untyped Supabase client for data reads (avoids Database type mismatch)
const supabaseUrl = import.meta.env.VITE_SUPABASE_URL
const supabaseKey = import.meta.env.VITE_SUPABASE_ANON_KEY
const db = (supabaseUrl && supabaseKey && !supabaseUrl.includes('placeholder'))
  ? createClient(supabaseUrl, supabaseKey)
  : null

function isConfigured(): boolean {
  return db !== null
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

const paletteMap: Record<string, { primary: string; deep: string }> = {
  stark: { primary: '#9eb5c0', deep: '#111b20' },
  lannister: { primary: '#b79b5e', deep: '#24140d' },
  targaryen: { primary: '#a84a40', deep: '#230d0b' },
  baratheon: { primary: '#b29a55', deep: '#15191b' },
  tyrell: { primary: '#859b6b', deep: '#11190f' },
  martell: { primary: '#b9794f', deep: '#25150d' },
  greyjoy: { primary: '#76959e', deep: '#0e191c' },
  arryn: { primary: '#a9bbc3', deep: '#121a1e' },
  tully: { primary: '#7794a5', deep: '#111a20' },
}

export async function fetchHousesFromSupabase(): Promise<House[] | null> {
  if (!isConfigured()) return null

  const { data: houses, error } = await db!
    .from('houses')
    .select('*')
    .order('name')

  if (error || !houses) {
    console.warn('[data] Failed to fetch houses:', error?.message)
    return null
  }

  // Fetch all characters to group by house
  const { data: characters } = await db!
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

  const { data, error } = await db!
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
}

// ── Locations ──

export async function fetchLocationsFromSupabase(): Promise<Place[] | null> {
  if (!isConfigured()) return null

  const { data, error } = await db!
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
}

// ── Events ──

export async function fetchEventsFromSupabase(): Promise<TimelineEvent[] | null> {
  if (!isConfigured()) return null

  const { data, error } = await db!
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
}

// ── Search (Supabase FTS) ──

export async function searchSupabase(query: string): Promise<Array<{
  type: string
  id: string
  title: string
  subtitle: string
}> | null> {
  if (!isConfigured() || !query || !query.trim()) return null

  const { data, error } = await db!.rpc('search_all', { query: query.trim() })

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
}
