import { computed } from 'vue'
import { useHousesStore } from '@/stores/houses'
import { useUiStore } from '@/stores/ui'
import type { House, HouseSlug } from '@/types'

export function useHouses() {
  const houses = computed(() => useHousesStore.getState().houses)
  const selectedId = computed(() => useHousesStore.getState().selectedId)
  const loading = computed(() => useHousesStore.getState().loading)
  const error = computed(() => useHousesStore.getState().error)
  const selectedHouse = computed(() => {
    const state = useHousesStore.getState()
    return state.houses.find((h: House) => h.id === state.selectedId) ?? state.houses[0]
  })

  function selectHouse(id: string) {
    useHousesStore.getState().setSelectedHouse(id)
    useUiStore.getState().setActiveHouse(id as HouseSlug)
  }

  async function fetchHouses() {
    await useHousesStore.getState().fetchHouses()
  }

  function getHouseById(id: string): House | undefined {
    return useHousesStore.getState().houses.find((h: House) => h.id === id)
  }

  function getHouseBySlug(slug: string): House | undefined {
    return useHousesStore.getState().houses.find((h: House) => h.slug === slug)
  }

  return {
    houses,
    selectedHouse,
    loading,
    error,
    selectHouse,
    fetchHouses,
    getHouseById,
    getHouseBySlug,
  }
}
