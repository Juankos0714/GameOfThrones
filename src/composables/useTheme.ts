import { computed, watch, onMounted } from 'vue'
import { useUiStore } from '@/stores/ui'
import { useHousesStore } from '@/stores/houses'
import type { House, HouseSlug } from '@/types'

export function useTheme() {
  const activeHouse = computed(() => useUiStore.getState().activeHouse)
  const activeHouseClass = computed(() => useUiStore.getState().activeHouseClass)

  const housePalette = computed(() => {
    const house = useHousesStore.getState().houses.find((h: House) => h.id === activeHouse.value)
    return house?.palette ?? { primary: '#9eb5c0', deep: '#111b20' }
  })

  function setHouse(house: HouseSlug) {
    useUiStore.getState().setActiveHouse(house)
  }

  function updateCssVariables(palette: { primary: string; deep: string; secondary?: string; accent?: string; glow?: string }) {
    const root = document.documentElement
    root.style.setProperty('--house', palette.primary)
    root.style.setProperty('--house-deep', palette.deep)
    if (palette.glow) {
      root.style.setProperty('--house-glow', palette.glow)
    }
    if (palette.secondary) {
      root.style.setProperty('--house-text', palette.secondary)
    }
  }

  watch(
    housePalette,
    (newPalette) => {
      updateCssVariables(newPalette)
    },
    { immediate: true }
  )

  onMounted(() => {
    useUiStore.getState().initTheme()
    updateCssVariables(housePalette.value)
  })

  return {
    activeHouse,
    activeHouseClass,
    housePalette,
    setHouse,
  }
}
