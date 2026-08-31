/**
 * Server-side Supabase client using the service_role key.
 * This key bypasses RLS — never expose it to the browser.
 */
import { createClient } from '@supabase/supabase-js'

const supabaseUrl = process.env.VITE_SUPABASE_URL
const serviceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY

if (!supabaseUrl || !serviceRoleKey) {
  console.warn('[server] Supabase service_role credentials not configured. Write endpoints will fail.')
}

export const supabaseAdmin = createClient(
  supabaseUrl ?? 'https://placeholder.supabase.co',
  serviceRoleKey ?? 'placeholder',
)
