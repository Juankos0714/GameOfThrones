import { supabase } from './supabase'
import type { Place } from '@/types'

export async function getPlaces(): Promise<Place[]> {
  const { data, error } = await supabase
    .from('places')
    .select('*')
    .order('name')

  if (error) throw error
  return data as Place[]
}

export async function getPlaceBySlug(slug: string): Promise<Place | null> {
  const { data, error } = await supabase
    .from('places')
    .select('*')
    .eq('slug', slug)
    .single()

  if (error) throw error
  return data as Place | null
}

export async function getPlacesByRegion(region: string): Promise<Place[]> {
  const { data, error } = await supabase
    .from('places')
    .select('*')
    .eq('region', region)
    .order('name')

  if (error) throw error
  return data as Place[]
}
