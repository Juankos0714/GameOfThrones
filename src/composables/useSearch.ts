import { ref, computed } from 'vue'
import { useHousesStore } from '@/stores/houses'
import { useTimelineStore } from '@/stores/timeline'
import { debounce } from '@/utils'

interface SearchResult {
  type: 'house' | 'character' | 'place' | 'event' | 'book'
  id: string
  title: string
  subtitle: string
}

export function useSearch() {
  const query = ref('')
  const results = ref<SearchResult[]>([])
  const isOpen = ref(false)

  const hasResults = computed(() => results.value.length > 0)

  const performSearch = debounce((q: string) => {
    if (!q.trim()) {
      results.value = []
      return
    }

    const lowerQ = q.toLowerCase()
    const items: SearchResult[] = []

    // Search houses
    useHousesStore.getState().houses.forEach((h) => {
      if (
        h.name.toLowerCase().includes(lowerQ) ||
        h.region.toLowerCase().includes(lowerQ)
      ) {
        items.push({
          type: 'house',
          id: h.id,
          title: `Casa ${h.name}`,
          subtitle: h.region,
        })
      }
      // Search house members
      h.members.forEach((m) => {
        if (m.name.toLowerCase().includes(lowerQ)) {
          items.push({
            type: 'character',
            id: m.name,
            title: m.name,
            subtitle: `Casa ${h.name}`,
          })
        }
      })
      // Search lands
      h.lands.forEach((land) => {
        if (land.toLowerCase().includes(lowerQ)) {
          items.push({
            type: 'place',
            id: land,
            title: land,
            subtitle: h.region,
          })
        }
      })
    })

    // Search timeline events
    useTimelineStore.getState().events.forEach((e) => {
      if (e.title.toLowerCase().includes(lowerQ)) {
        items.push({
          type: 'event',
          id: e.id,
          title: e.title,
          subtitle: `${e.date} d.C.`,
        })
      }
    })

    // Search books
    const books = [
      'Juego de tronos', 'Choque de reyes', 'Tormenta de espadas',
      'Festín de cuervos', 'Danza de dragones',
    ]
    books.forEach((b) => {
      if (b.toLowerCase().includes(lowerQ)) {
        items.push({
          type: 'book',
          id: b,
          title: b,
          subtitle: 'Crónica de hielo y fuego',
        })
      }
    })

    results.value = items
  }, 300)

  function search(q: string) {
    query.value = q
    performSearch(q)
  }

  function clearSearch() {
    query.value = ''
    results.value = []
    isOpen.value = false
  }

  return {
    query,
    results,
    isOpen,
    hasResults,
    search,
    clearSearch,
  }
}
