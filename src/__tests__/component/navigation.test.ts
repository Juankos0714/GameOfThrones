import { describe, it, expect, beforeEach } from 'vitest'
import { useHousesStore } from '@/stores/houses'
import { useUiStore } from '@/stores/ui'

describe('House switching (store level)', () => {
  beforeEach(() => {
    useHousesStore.setState({ selectedId: 'stark' })
    useUiStore.setState({ activeHouse: 'stark', activeHouseClass: 'house-stark' })
  })

  it('changes active house in ui store', () => {
    useUiStore.getState().setActiveHouse('lannister')
    expect(useUiStore.getState().activeHouse).toBe('lannister')
    expect(useUiStore.getState().activeHouseClass).toBe('house-lannister')
  })

  it('changes selected house in houses store', () => {
    useHousesStore.getState().setSelectedHouse('targaryen')
    expect(useHousesStore.getState().selectedId).toBe('targaryen')
  })

  it('can cycle through all 9 houses', () => {
    const ids = ['stark', 'lannister', 'targaryen', 'baratheon', 'tyrell', 'martell', 'greyjoy', 'arryn', 'tully']
    ids.forEach((id) => {
      useHousesStore.getState().setSelectedHouse(id)
      useUiStore.getState().setActiveHouse(id as any)
      expect(useHousesStore.getState().selectedId).toBe(id)
      expect(useUiStore.getState().activeHouse).toBe(id)
    })
  })

  it('getHouseBySlug finds correct house', () => {
    const house = useHousesStore.getState().houses.find((h) => h.slug === 'stark')
    expect(house).toBeDefined()
    expect(house!.name).toBe('Stark')
  })

  it('getHouseBySlug returns undefined for unknown', () => {
    const house = useHousesStore.getState().houses.find((h) => h.slug === 'nonexistent')
    expect(house).toBeUndefined()
  })
})

describe('Router configuration', () => {
  it('has all expected routes', async () => {
    const { default: router } = await import('@/router')
    const routeNames = router.getRoutes().map((r) => r.name)
    expect(routeNames).toContain('home')
    expect(routeNames).toContain('houses')
    expect(routeNames).toContain('house-detail')
    expect(routeNames).toContain('characters')
    expect(routeNames).toContain('character-detail')
    expect(routeNames).toContain('search')
    expect(routeNames).toContain('not-found')
  })
})
