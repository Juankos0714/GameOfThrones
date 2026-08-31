import { create } from 'vue-zustand'
import type { HouseSlug } from '@/types'

interface UiState {
  activeHouse: HouseSlug
  menuOpen: boolean
  theme: 'dark' | 'light'
  globalSearch: string
  loading: boolean
  activeHouseClass: string
  setActiveHouse: (house: HouseSlug) => void
  toggleMenu: () => void
  closeMenu: () => void
  setLoading: (value: boolean) => void
  setGlobalSearch: (query: string) => void
  initTheme: () => void
}

export const useUiStore = create<UiState>((set, get) => ({
  activeHouse: 'stark',
  menuOpen: false,
  theme: 'dark',
  globalSearch: '',
  loading: false,
  activeHouseClass: 'house-stark',

  setActiveHouse: (house: HouseSlug) => {
    document.documentElement.setAttribute('data-house', house)
    set({ activeHouse: house, activeHouseClass: `house-${house}` })
  },

  toggleMenu: () => set((state) => ({ menuOpen: !state.menuOpen })),

  closeMenu: () => set({ menuOpen: false }),

  setLoading: (value: boolean) => set({ loading: value }),

  setGlobalSearch: (query: string) => set({ globalSearch: query }),

  initTheme: () => {
    const { activeHouse } = get()
    document.documentElement.setAttribute('data-house', activeHouse)
  },
}))
