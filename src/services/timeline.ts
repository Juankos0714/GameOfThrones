import { supabase } from './supabase'
import type { TimelineEvent, Battle } from '@/types'

export async function getTimelineEvents(): Promise<TimelineEvent[]> {
  const { data, error } = await supabase
    .from('events')
    .select('*')
    .order('date')

  if (error) throw error
  return data as TimelineEvent[]
}

export async function getEventsByBook(bookId: string): Promise<TimelineEvent[]> {
  const { data, error } = await supabase
    .from('events')
    .select('*')
    .eq('book_id', bookId)
    .order('date')

  if (error) throw error
  return data as TimelineEvent[]
}

export async function getBattles(): Promise<Battle[]> {
  const { data, error } = await supabase
    .from('battles')
    .select('*')
    .order('date')

  if (error) throw error
  return data as Battle[]
}

export async function getBattlesByHouse(houseId: string): Promise<Battle[]> {
  const { data, error } = await supabase
    .from('battles')
    .select('*')
    .contains('house_ids', [houseId])
    .order('date')

  if (error) throw error
  return data as Battle[]
}
