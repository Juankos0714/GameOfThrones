import { Hono } from 'hono'
import { cors } from 'hono/cors'
import { auth } from './auth'
import { supabaseAdmin } from './supabase'
import type { AuthUser } from '../src/types'

const app = new Hono()

const corsOrigin = process.env.BETTER_AUTH_URL || 'http://localhost:5173'

// CORS for all API routes
app.use(
  '/api/*',
  cors({
    origin: corsOrigin,
    credentials: true,
  }),
)

// ── Better Auth handler ──
app.on(['POST', 'GET'], '/api/auth/**', async (c) => {
  return auth.handler(c.req.raw)
})

// ── Helper: validate session and return user with role ──
async function requireAuth(c: any, minRole?: 'editor' | 'admin') {
  const session = await auth.api.getSession({
    headers: c.req.raw.headers,
  })

  if (!session) {
    return { error: c.json({ error: 'Unauthorized' }, 401) }
  }

  const user = session.user as unknown as AuthUser

  if (minRole === 'admin' && user.role !== 'admin') {
    return { error: c.json({ error: 'Forbidden: requires admin role' }, 403) }
  }

  if (minRole === 'editor' && user.role !== 'editor' && user.role !== 'admin') {
    return { error: c.json({ error: 'Forbidden: requires editor or admin role' }, 403) }
  }

  return { user }
}

// ── GET /api/auth/session — expose session to the frontend ──
app.get('/api/auth/session', async (c) => {
  const session = await auth.api.getSession({
    headers: c.req.raw.headers,
  })

  if (!session) {
    return c.json({ user: null })
  }

  const user = session.user as unknown as AuthUser

  // Fetch role from profiles table
  const { data: profile } = await supabaseAdmin
    .from('profiles')
    .select('role')
    .eq('id', user.id)
    .single()

  return c.json({
    user: {
      id: user.id,
      email: user.email,
      name: user.name,
      role: profile?.role ?? 'viewer',
    },
  })
})

// ── Houses ──

app.get('/api/houses', async (c) => {
  const { data, error } = await supabaseAdmin
    .from('houses')
    .select('*')
    .order('name')

  if (error) return c.json({ error: error.message }, 500)
  return c.json({ houses: data })
})

app.get('/api/houses/:slug', async (c) => {
  const slug = c.req.param('slug')
  const { data, error } = await supabaseAdmin
    .from('houses')
    .select('*')
    .eq('slug', slug)
    .single()

  if (error || !data) return c.json({ error: 'House not found' }, 404)
  return c.json({ house: data })
})

app.post('/api/houses/:slug', async (c) => {
  const authResult = await requireAuth(c, 'editor')
  if ('error' in authResult) return authResult.error

  const slug = c.req.param('slug')
  const body = await c.req.json()

  // Create a revision for the edit
  const { data: existing } = await supabaseAdmin
    .from('houses')
    .select('id')
    .eq('slug', slug)
    .single()

  if (!existing) return c.json({ error: 'House not found' }, 404)

  // Record the revision
  await supabaseAdmin.from('revisions').insert({
    table_name: 'houses',
    record_id: existing.id,
    changed_by: authResult.user.id,
    diff: body,
  })

  // Perform the update
  const { data, error } = await supabaseAdmin
    .from('houses')
    .update(body)
    .eq('slug', slug)
    .select()
    .single()

  if (error) return c.json({ error: error.message }, 500)
  return c.json({ success: true, house: data })
})

// ── Characters ──

app.get('/api/characters', async (c) => {
  const { data, error } = await supabaseAdmin
    .from('characters')
    .select('*, houses(name, slug, region)')
    .order('name')

  if (error) return c.json({ error: error.message }, 500)
  return c.json({ characters: data })
})

app.get('/api/characters/:slug', async (c) => {
  const slug = c.req.param('slug')
  const { data, error } = await supabaseAdmin
    .from('characters')
    .select('*, houses(name, slug, region)')
    .eq('slug', slug)
    .single()

  if (error || !data) return c.json({ error: 'Character not found' }, 404)
  return c.json({ character: data })
})

app.post('/api/characters/:slug', async (c) => {
  const authResult = await requireAuth(c, 'editor')
  if ('error' in authResult) return authResult.error

  const slug = c.req.param('slug')
  const body = await c.req.json()

  const { data: existing } = await supabaseAdmin
    .from('characters')
    .select('id')
    .eq('slug', slug)
    .single()

  if (!existing) return c.json({ error: 'Character not found' }, 404)

  await supabaseAdmin.from('revisions').insert({
    table_name: 'characters',
    record_id: existing.id,
    changed_by: authResult.user.id,
    diff: body,
  })

  const { data, error } = await supabaseAdmin
    .from('characters')
    .update(body)
    .eq('slug', slug)
    .select()
    .single()

  if (error) return c.json({ error: error.message }, 500)
  return c.json({ success: true, character: data })
})

// ── Locations ──

app.get('/api/locations', async (c) => {
  const { data, error } = await supabaseAdmin
    .from('locations')
    .select('*')
    .order('name')

  if (error) return c.json({ error: error.message }, 500)
  return c.json({ locations: data })
})

// ── Events ──

app.get('/api/events', async (c) => {
  const { data, error } = await supabaseAdmin
    .from('events')
    .select('*, locations(name, slug)')
    .order('year_in_universe')

  if (error) return c.json({ error: error.message }, 500)
  return c.json({ events: data })
})

// ── Full-text search ──

app.get('/api/search', async (c) => {
  const query = c.req.query('q')
  if (!query || query.trim().length === 0) {
    return c.json({ results: [] })
  }

  const { data, error } = await supabaseAdmin
    .rpc('search_all', { query: query.trim() })

  if (error) return c.json({ error: error.message }, 500)
  return c.json({ results: data ?? [] })
})

// ── Moderation ──

app.get('/api/moderation/queue', async (c) => {
  const authResult = await requireAuth(c, 'admin')
  if ('error' in authResult) return authResult.error

  const { data, error } = await supabaseAdmin
    .from('revisions')
    .select('*')
    .order('created_at', { ascending: false })
    .limit(50)

  if (error) return c.json({ error: error.message }, 500)
  return c.json({ revisions: data ?? [] })
})

app.post('/api/moderation/queue/:id/approve', async (c) => {
  const authResult = await requireAuth(c, 'admin')
  if ('error' in authResult) return authResult.error

  const id = c.req.param('id')

  // Fetch the revision
  const { data: revision, error: fetchError } = await supabaseAdmin
    .from('revisions')
    .select('*')
    .eq('id', id)
    .single()

  if (fetchError || !revision) return c.json({ error: 'Revision not found' }, 404)

  // Apply the diff to the target table
  const { error: updateError } = await supabaseAdmin
    .from(revision.table_name)
    .update(revision.diff)
    .eq('id', revision.record_id)

  if (updateError) return c.json({ error: updateError.message }, 500)

  // Delete the revision (it's been applied)
  await supabaseAdmin.from('revisions').delete().eq('id', id)

  return c.json({ success: true })
})

app.post('/api/moderation/queue/:id/reject', async (c) => {
  const authResult = await requireAuth(c, 'admin')
  if ('error' in authResult) return authResult.error

  const id = c.req.param('id')

  // Simply delete the revision
  const { error } = await supabaseAdmin
    .from('revisions')
    .delete()
    .eq('id', id)

  if (error) return c.json({ error: error.message }, 500)
  return c.json({ success: true })
})

// ── Start server ──
const port = Number(process.env.PORT) || 3000

export default {
  port,
  fetch: app.fetch,
}
