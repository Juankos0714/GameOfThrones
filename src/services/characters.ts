import { supabase } from './supabase'
import type { Character } from '@/types'

/**
 * Get all characters
 */
export async function getCharacters(): Promise<Character[]> {
  const { data, error } = await supabase
    .from('characters')
    .select('*')
    .order('name')

  if (error) throw error
  return data as Character[]
}

/**
 * Get a character by slug
 */
export async function getCharacterBySlug(slug: string): Promise<Character | null> {
  const { data, error } = await supabase
    .from('characters')
    .select('*')
    .eq('slug', slug)
    .single()

  if (error) throw error
  return data as Character | null
}

/**
 * Get characters by house
 */
export async function getCharactersByHouse(houseId: string): Promise<Character[]> {
  const { data, error } = await supabase
    .from('characters')
    .select('*')
    .eq('house_id', houseId)
    .order('name')

  if (error) throw error
  return data as Character[]
}

/**
 * Search characters by name, alias, or title
 */
export async function searchCharacters(query: string): Promise<Character[]> {
  const { data, error } = await supabase
    .from('characters')
    .select('*')
    .or(`name.ilike.%${query}%,aliases.cs.{${query}},titles.cs.{${query}}`)
    .order('name')

  if (error) throw error
  return data as Character[]
}

/**
 * Get character relations
 */
export async function getCharacterRelations(characterId: string) {
  const { data, error } = await supabase
    .from('character_relations')
    .select('*')
    .or(`character_a_id.eq.${characterId},character_b_id.eq.${characterId}`)

  if (error) throw error
  return data
}
