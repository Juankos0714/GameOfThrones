import { describe, it, expect, beforeEach } from 'vitest'
import { useUiStore } from '@/stores/ui'
import { useHousesStore } from '@/stores/houses'
import { useTimelineStore } from '@/stores/timeline'
import { useAuthStore } from '@/stores/auth'

describe('useUiStore', () => {
  beforeEach(() => {
    useUiStore.setState({
      activeHouse: 'stark',
      menuOpen: false,
      theme: 'dark',
      globalSearch: '',
      loading: false,
      activeHouseClass: 'house-stark',
    })
  })

  it('has default state', () => {
    const state = useUiStore.getState()
    expect(state.activeHouse).toBe('stark')
    expect(state.menuOpen).toBe(false)
    expect(state.activeHouseClass).toBe('house-stark')
  })

  it('setActiveHouse updates house and class', () => {
    useUiStore.getState().setActiveHouse('lannister')
    const state = useUiStore.getState()
    expect(state.activeHouse).toBe('lannister')
    expect(state.activeHouseClass).toBe('house-lannister')
  })

  it('toggleMenu toggles menuOpen', () => {
    expect(useUiStore.getState().menuOpen).toBe(false)
    useUiStore.getState().toggleMenu()
    expect(useUiStore.getState().menuOpen).toBe(true)
    useUiStore.getState().toggleMenu()
    expect(useUiStore.getState().menuOpen).toBe(false)
  })

  it('closeMenu sets menuOpen to false', () => {
    useUiStore.getState().toggleMenu()
    useUiStore.getState().closeMenu()
    expect(useUiStore.getState().menuOpen).toBe(false)
  })
})

describe('useHousesStore', () => {
  beforeEach(() => {
    useHousesStore.setState({
      selectedId: 'stark',
      loading: false,
      error: null,
    })
  })

  it('has 9 houses', () => {
    expect(useHousesStore.getState().houses).toHaveLength(9)
  })

  it('each house has required fields', () => {
    const houses = useHousesStore.getState().houses
    houses.forEach((house) => {
      expect(house.id).toBeTruthy()
      expect(house.name).toBeTruthy()
      expect(house.slug).toBeTruthy()
      expect(house.motto).toBeTruthy()
      expect(house.region).toBeTruthy()
      expect(house.seat).toBeTruthy()
      expect(Array.isArray(house.members)).toBe(true)
      expect(house.members.length).toBeGreaterThan(0)
    })
  })

  it('all 9 houses are present', () => {
    const ids = useHousesStore.getState().houses.map((h) => h.id)
    expect(ids).toContain('stark')
    expect(ids).toContain('lannister')
    expect(ids).toContain('targaryen')
    expect(ids).toContain('baratheon')
    expect(ids).toContain('tyrell')
    expect(ids).toContain('martell')
    expect(ids).toContain('greyjoy')
    expect(ids).toContain('arryn')
    expect(ids).toContain('tully')
  })

  it('setSelectedHouse changes selectedId', () => {
    useHousesStore.getState().setSelectedHouse('lannister')
    expect(useHousesStore.getState().selectedId).toBe('lannister')
  })

  it('each member has name, title, status', () => {
    const houses = useHousesStore.getState().houses
    houses.forEach((house) => {
      house.members.forEach((member) => {
        expect(member.name).toBeTruthy()
        expect(member.title).toBeTruthy()
        expect(['alive', 'deceased', 'unknown']).toContain(member.status)
      })
    })
  })
})

describe('useTimelineStore', () => {
  it('has events', () => {
    expect(useTimelineStore.getState().events.length).toBeGreaterThan(0)
  })

  it('setFilterYear filters events', () => {
    useTimelineStore.getState().setFilterYear(299)
    const state = useTimelineStore.getState()
    const filtered = state.events.filter((e) => e.date === state.filterYear)
    filtered.forEach((e) => {
      expect(e.date).toBe(299)
    })
  })

  it('setFilterYear(null) shows all events', () => {
    const all = useTimelineStore.getState().events
    useTimelineStore.getState().setFilterYear(null)
    const state = useTimelineStore.getState()
    const filtered = state.filterYear === null ? state.events : state.events.filter((e) => e.date === state.filterYear)
    expect(filtered).toHaveLength(all.length)
  })
})

describe('useAuthStore', () => {
  beforeEach(() => {
    useAuthStore.setState({
      user: null,
      loading: false,
      error: null,
    })
  })

  it('defaults to unauthenticated', () => {
    const state = useAuthStore.getState()
    expect(state.user).toBeNull()
    expect(state.isAuthenticated).toBe(false)
  })

  it('setUser sets user data', () => {
    useAuthStore.getState().setUser({
      id: '1',
      email: 'test@example.com',
      role: 'editor',
    })
    expect(useAuthStore.getState().user).not.toBeNull()
    expect(useAuthStore.getState().user?.role).toBe('editor')
    expect(useAuthStore.getState().user?.email).toBe('test@example.com')
  })

  it('clearAuth resets user', () => {
    useAuthStore.getState().setUser({
      id: '1',
      email: 'test@example.com',
      role: 'admin',
    })
    useAuthStore.getState().clearAuth()
    expect(useAuthStore.getState().user).toBeNull()
  })
})
