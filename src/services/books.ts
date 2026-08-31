import { supabase } from './supabase'
import type { Book } from '@/types'

export async function getBooks(): Promise<Book[]> {
  const { data, error } = await supabase
    .from('books')
    .select('*')
    .order('order')

  if (error) throw error
  return data as Book[]
}

export async function getBookBySlug(slug: string): Promise<Book | null> {
  const { data, error } = await supabase
    .from('books')
    .select('*')
    .eq('slug', slug)
    .single()

  if (error) throw error
  return data as Book | null
}

export async function getBookChapters(bookId: string) {
  const { data, error } = await supabase
    .from('chapters')
    .select('*')
    .eq('book_id', bookId)
    .order('number')

  if (error) throw error
  return data
}
