import { supabase } from './supabase'
import type { House } from '@/types'

/**
 * Get all houses
 */
export async function getHouses(): Promise<House[]> {
  const { data, error } = await supabase
    .from('houses')
    .select('*')
    .order('name')

  if (error) throw error
  return data as House[]
}

/**
 * Get a single house by slug
 */
export async function getHouseBySlug(slug: string): Promise<House | null> {
  const { data, error } = await supabase
    .from('houses')
    .select('*')
    .eq('slug', slug)
    .single()

  if (error) throw error
  return data as House | null
}

/**
 * Get a single house by ID
 */
export async function getHouseById(id: string): Promise<House | null> {
  const { data, error } = await supabase
    .from('houses')
    .select('*')
    .eq('id', id)
    .single()

  if (error) throw error
  return data as House | null
}

/**
 * Search houses by name or region
 */
export async function searchHouses(query: string): Promise<House[]> {
  const { data, error } = await supabase
    .from('houses')
    .select('*')
    .or(`name.ilike.%${query}%,region.ilike.%${query}%`)
    .order('name')

  if (error) throw error
  return data as House[]
}

/**
 * Get characters belonging to a house
 */
export async function getHouseCharacters(houseId: string) {
  const { data, error } = await supabase
    .from('characters')
    .select('*')
    .eq('house_id', houseId)
    .order('name')

  if (error) throw error
  return data
}
