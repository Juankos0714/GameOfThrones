import { describe, it, expect, vi, beforeEach } from 'vitest'

const mockFromFn = vi.fn()
const mockRpcFn = vi.fn()

vi.mock('@supabase/supabase-js', () => ({
  createClient: vi.fn(() => ({
    from: mockFromFn,
    rpc: mockRpcFn,
  })),
}))

type TableData = Record<string, { data: any[]; error: any }>

function mockTables(tables: TableData) {
  mockFromFn.mockImplementation((table: string) => {
    const response = tables[table] ?? { data: [], error: null }
    return {
      select: vi.fn().mockReturnValue({
        order: vi.fn().mockResolvedValue(response),
      }),
    }
  })
}

describe('data service', () => {
  beforeEach(async () => {
    vi.stubEnv('VITE_SUPABASE_URL', 'https://test.supabase.co')
    vi.stubEnv('VITE_SUPABASE_ANON_KEY', 'test-key')
    vi.resetModules()
    mockFromFn.mockReset()
    mockRpcFn.mockReset()
    mockRpcFn.mockResolvedValue({ data: [], error: null })
  })

  describe('fetchHousesFromSupabase', () => {
    it('returns null when Supabase is not configured', async () => {
      vi.stubEnv('VITE_SUPABASE_URL', '')
      vi.stubEnv('VITE_SUPABASE_ANON_KEY', '')
      vi.resetModules()
      const { fetchHousesFromSupabase } = await import('@/services/data')
      const result = await fetchHousesFromSupabase()
      expect(result).toBeNull()
    })

    it('returns mapped houses on success', async () => {
      mockTables({
        houses: { data: [
          { id: 'uuid-1', slug: 'stark', name: 'Stark', words: 'Se acerca el invierno', region: 'El Norte', seat: 'Invernalia', colors: 'gris', description: 'Una estirpe antigua.' },
        ], error: null },
        characters: { data: [
          { id: 'char-1', name: 'Eddard Stark', house_id: 'uuid-1', aliases: ['Ned'], culture: 'Norteño', status: 'muerto' },
        ], error: null },
      })

      const { fetchHousesFromSupabase } = await import('@/services/data')
      const result = await fetchHousesFromSupabase()

      expect(result).not.toBeNull()
      expect(result).toHaveLength(1)
      expect(result![0].slug).toBe('stark')
      expect(result![0].name).toBe('Stark')
      expect(result![0].members).toHaveLength(1)
      expect(result![0].members[0].name).toBe('Eddard Stark')
    })

    it('maps member status correctly', async () => {
      mockTables({
        houses: { data: [
          { id: 'u1', slug: 'stark', name: 'Stark', words: '', region: '', seat: '', colors: '', description: '' },
        ], error: null },
        characters: { data: [
          { id: 'c1', name: 'Alive', house_id: 'u1', aliases: [], culture: '', status: 'vivo' },
          { id: 'c2', name: 'Dead', house_id: 'u1', aliases: [], culture: '', status: 'muerto' },
          { id: 'c3', name: 'Unknown', house_id: 'u1', aliases: [], culture: '', status: 'desconocido' },
        ], error: null },
      })

      const { fetchHousesFromSupabase } = await import('@/services/data')
      const result = await fetchHousesFromSupabase()

      expect(result![0].members).toHaveLength(3)
      expect(result![0].members[0].status).toBe('alive')
      expect(result![0].members[1].status).toBe('deceased')
      expect(result![0].members[2].status).toBe('unknown')
    })

    it('returns null on database error', async () => {
      mockTables({
        houses: { data: null as any, error: { message: 'Connection failed' } },
      })

      const { fetchHousesFromSupabase } = await import('@/services/data')
      const result = await fetchHousesFromSupabase()
      expect(result).toBeNull()
    })
  })

  describe('fetchEventsFromSupabase', () => {
    it('returns mapped events with parsed dates', async () => {
      mockTables({
        events: { data: [
          { id: '1', title: 'La Boda Roja', description: 'Una traición.', year_in_universe: '299 AC' },
          { id: '2', title: 'La Conquista', description: 'Unificó reinos.', year_in_universe: '0 AC' },
        ], error: null },
      })

      const { fetchEventsFromSupabase } = await import('@/services/data')
      const result = await fetchEventsFromSupabase()

      expect(result).toHaveLength(2)
      expect(result![0].title).toBe('La Boda Roja')
      expect(result![0].date).toBe(299)
      expect(result![1].date).toBe(0)
    })

    it('parses negative years', async () => {
      mockTables({
        events: { data: [
          { id: '1', title: 'Perdición', description: 'Destrucción.', year_in_universe: '-100 AC' },
        ], error: null },
      })

      const { fetchEventsFromSupabase } = await import('@/services/data')
      const result = await fetchEventsFromSupabase()
      expect(result![0].date).toBe(-100)
    })
  })

  describe('fetchLocationsFromSupabase', () => {
    it('returns mapped locations with coordinates', async () => {
      mockTables({
        locations: { data: [
          { id: 'loc-1', slug: 'invernalia', name: 'Invernalia', region: 'El Norte', description: 'Fortaleza.', map_x: 400, map_y: 80 },
        ], error: null },
      })

      const { fetchLocationsFromSupabase } = await import('@/services/data')
      const result = await fetchLocationsFromSupabase()

      expect(result).toHaveLength(1)
      expect(result![0].name).toBe('Invernalia')
      expect(result![0].slug).toBe('invernalia')
      expect(result![0].coordinates).toEqual({ x: 400, y: 80 })
    })

    it('defaults coordinates to 0 when null', async () => {
      mockTables({
        locations: { data: [
          { id: 'loc-1', slug: 'test', name: 'Test', region: '', description: '', map_x: null, map_y: null },
        ], error: null },
      })

      const { fetchLocationsFromSupabase } = await import('@/services/data')
      const result = await fetchLocationsFromSupabase()
      expect(result![0].coordinates).toEqual({ x: 0, y: 0 })
    })
  })

  describe('fetchCharactersFromSupabase', () => {
    it('returns mapped characters with house info', async () => {
      mockTables({
        characters: { data: [
          { id: 'c1', slug: 'jon-nieve', name: 'Jon Nieve', aliases: ['Aegon'], culture: 'Norteño', status: 'vivo', houses: { name: 'Stark', slug: 'stark' } },
        ], error: null },
      })

      const { fetchCharactersFromSupabase } = await import('@/services/data')
      const result = await fetchCharactersFromSupabase()

      expect(result).toHaveLength(1)
      expect(result![0].name).toBe('Jon Nieve')
      expect(result![0].houseName).toBe('Stark')
      expect(result![0].houseSlug).toBe('stark')
    })
  })

  describe('searchSupabase', () => {
    it('returns mapped search results', async () => {
      mockRpcFn.mockResolvedValue({
        data: [
          { entity_type: 'house', entity_id: 'uuid-1', title: 'Stark', subtitle: 'El Norte', rank: 0.8 },
          { entity_type: 'character', entity_id: 'uuid-2', title: 'Ned Stark', subtitle: 'Stark', rank: 0.6 },
        ],
        error: null,
      })

      const { searchSupabase } = await import('@/services/data')
      const result = await searchSupabase('Stark')

      expect(result).toHaveLength(2)
      expect(result![0].type).toBe('house')
      expect(result![0].title).toBe('Stark')
      expect(result![1].type).toBe('character')
    })

    it('returns null for empty query', async () => {
      const { searchSupabase } = await import('@/services/data')
      const result = await searchSupabase('')
      expect(result).toBeNull()
    })

    it('returns null for whitespace-only query', async () => {
      const { searchSupabase } = await import('@/services/data')
      const result = await searchSupabase('   ')
      expect(result).toBeNull()
    })

    it('returns null on RPC error', async () => {
      mockRpcFn.mockResolvedValue({ data: null, error: { message: 'RPC failed' } })

      const { searchSupabase } = await import('@/services/data')
      const result = await searchSupabase('test')
      expect(result).toBeNull()
    })
  })
})
