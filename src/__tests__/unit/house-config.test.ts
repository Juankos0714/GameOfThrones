import { describe, it, expect } from 'vitest'
import { useHousesStore } from '@/stores/houses'

describe('House configuration', () => {
  const houses = useHousesStore.getState().houses
  const houseIds = ['stark', 'lannister', 'targaryen', 'baratheon', 'tyrell', 'martell', 'greyjoy', 'arryn', 'tully']

  it('has all 9 houses', () => {
    expect(houses).toHaveLength(9)
  })

  houseIds.forEach((id) => {
    describe(`House ${id}`, () => {
      const house = houses.find((h) => h.id === id)

      it('exists', () => {
        expect(house).toBeDefined()
      })

      it('has name', () => {
        expect(house!.name).toBeTruthy()
        expect(typeof house!.name).toBe('string')
      })

      it('has slug matching id', () => {
        expect(house!.slug).toBe(id)
      })

      it('has motto', () => {
        expect(house!.motto).toBeTruthy()
      })

      it('has region', () => {
        expect(house!.region).toBeTruthy()
      })

      it('has seat', () => {
        expect(house!.seat).toBeTruthy()
      })

      it('has sigil icon name', () => {
        expect(house!.sigil).toBeTruthy()
        expect(typeof house!.sigil).toBe('string')
      })

      it('has palette with primary and deep', () => {
        expect(house!.palette.primary).toBeTruthy()
        expect(house!.palette.deep).toBeTruthy()
        expect(house!.palette.primary).toMatch(/^#[0-9a-f]{6}$/i)
        expect(house!.palette.deep).toMatch(/^#[0-9a-f]{6}$/i)
      })

      it('has members', () => {
        expect(house!.members.length).toBeGreaterThan(0)
      })

      it('each member has valid status', () => {
        house!.members.forEach((m) => {
          expect(['alive', 'deceased', 'unknown']).toContain(m.status)
        })
      })

      it('has allies and rivals', () => {
        expect(Array.isArray(house!.allies)).toBe(true)
        expect(Array.isArray(house!.rivals)).toBe(true)
      })

      it('has lands', () => {
        expect(Array.isArray(house!.lands)).toBe(true)
        expect(house!.lands.length).toBeGreaterThan(0)
      })

      it('has events', () => {
        expect(Array.isArray(house!.events)).toBe(true)
        expect(house!.events.length).toBeGreaterThan(0)
      })
    })
  })
})
