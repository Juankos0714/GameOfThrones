import { computed } from 'vue'
import { useTimelineStore } from '@/stores/timeline'
import type { TimelineEvent } from '@/types'

export function useTimeline() {
  const events = computed(() => useTimelineStore.getState().events)
  const loading = computed(() => useTimelineStore.getState().loading)

  const filteredEvents = computed(() => {
    const state = useTimelineStore.getState()
    if (state.filterYear === null) return state.events
    return state.events.filter((e: TimelineEvent) => e.date === state.filterYear)
  })

  const yearGroups = computed(() => {
    const state = useTimelineStore.getState()
    const groups = new Map<number, TimelineEvent[]>()
    state.events.forEach((e: TimelineEvent) => {
      if (!groups.has(e.date)) groups.set(e.date, [])
      groups.get(e.date)!.push(e)
    })
    return groups
  })

  const years = computed(() =>
    [...new Set(events.value.map((e: TimelineEvent) => e.date))].sort((a: number, b: number) => a - b)
  )

  const filterYear = computed(() => useTimelineStore.getState().filterYear)

  function filterByYear(year: number | null) {
    useTimelineStore.getState().setFilterYear(year)
  }

  return {
    events,
    filteredEvents,
    yearGroups,
    years,
    loading,
    filterYear,
    filterByYear,
  }
}
