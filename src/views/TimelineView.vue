<script setup lang="ts">
import { useTimeline } from '@/composables'
import { queryRef, stringCodec } from 'vue-qs'
import { computed, watch } from 'vue'
import { Motion, AnimatePresence } from 'motion-v'
import SectionReveal from '@/components/ui/SectionReveal.vue'
import Skeleton from '@/components/ui/Skeleton.vue'
const { events, years, filterByYear, loading } = useTimeline()

// Sync filter with URL — use string codec and convert
const urlYearRaw = queryRef('year', { defaultValue: '', codec: stringCodec })

const urlYear = computed<number | null>({
  get() {
    const v = urlYearRaw.value
    return v ? Number(v) : null
  },
  set(val: number | null) {
    urlYearRaw.value = val !== null ? String(val) : ''
  },
})

watch(urlYear, (v) => {
  filterByYear(v)
}, { immediate: true })

const filteredEvents = computed(() => {
  const year = urlYear.value
  if (year === null || year === undefined) return events.value
  return events.value.filter((e) => e.date === year)
})

// Group events by year for vertical timeline
const yearGroups = computed(() => {
  const groups = new Map<number, typeof filteredEvents.value>()
  for (const event of filteredEvents.value) {
    if (!groups.has(event.date)) groups.set(event.date, [])
    groups.get(event.date)!.push(event)
  }
  return Array.from(groups.entries()).sort((a, b) => a[0] - b[0])
})
</script>

<template>
  <div class="timeline-page">
    <section class="chronology" style="min-height: 60vh">
      <SectionReveal>
        <p class="label">Cronología comparada</p>
        <h2>
          Antes y después<br />
          de la corona
        </h2>
      </SectionReveal>

      <!-- Filters -->
      <div class="timeline-filters">
        <button
          :class="{ active: urlYear === null || urlYear === undefined }"
          @click="urlYear = null"
        >
          Todos
        </button>
        <button
          v-for="year in years"
          :key="year"
          :class="{ active: urlYear === year }"
          @click="urlYear = year"
        >
          {{ year }} d.C.
        </button>
      </div>

      <!-- Loading skeleton -->
      <div v-if="loading" class="timeline-scroll" role="status" aria-label="Cargando cronología">
        <article v-for="i in 6" :key="i">
          <Skeleton width="80px" height="12px" />
          <Skeleton width="7px" height="7px" rounded style="margin: 10px 0" />
          <Skeleton width="220px" height="20px" style="margin-bottom: 10px" />
          <Skeleton width="260px" height="12px" />
        </article>
      </div>

      <!-- Horizontal timeline -->
      <div v-else class="timeline-scroll">
        <AnimatePresence mode="popLayout">
          <Motion
            v-for="(event, i) in filteredEvents"
            :key="event.id"
            :initial="{ opacity: 0, y: 15 }"
            :animate="{ opacity: 1, y: 0 }"
            :exit="{ opacity: 0, y: -10 }"
            :transition="{ duration: 0.4, delay: i * 0.05, ease: [0.25, 0.1, 0.25, 1] }"
            as="article"
          >
            <time>{{ event.date }} d.C.</time>
            <i />
            <h3>{{ event.title }}</h3>
            <p>{{ event.description }}</p>
          </Motion>
        </AnimatePresence>
      </div>

      <!-- Year summary (when filtered) -->
      <div v-if="urlYear !== null && urlYear !== undefined" class="year-summary">
        <p>
          {{ filteredEvents.length }} evento{{ filteredEvents.length !== 1 ? 's' : '' }}
          en {{ urlYear }} d.C.
        </p>
      </div>
    </section>
  </div>
</template>

<style scoped>
.timeline-filters {
  display: flex;
  gap: 8px;
  margin-bottom: 50px;
  flex-wrap: wrap;
}

.timeline-filters button {
  border: 1px solid var(--border);
  background: transparent;
  color: var(--color-muted-foreground);
  padding: 8px 16px;
  font: 500 8px/1 var(--font-sans);
  text-transform: uppercase;
  letter-spacing: 0.12em;
  cursor: pointer;
  transition: all 0.25s ease;
}

.timeline-filters button.active,
.timeline-filters button:hover {
  border-color: var(--house);
  color: var(--house);
  background: var(--house-surface);
}

.timeline-scroll {
  display: flex;
  overflow-x: auto;
  gap: 2px;
  padding-bottom: 20px;
  -ms-overflow-style: none;
  scrollbar-width: none;
}

.timeline-scroll::-webkit-scrollbar {
  display: none;
}

.timeline-scroll article {
  min-width: 300px;
  border-top: 1px solid var(--border);
  padding: 25px 30px 0 0;
  flex-shrink: 0;
  transition: transform 0.25s ease;
}

.timeline-scroll article:hover {
  transform: translateY(-3px);
}

.timeline-scroll time {
  color: var(--house);
  font: 600 9px/1 var(--font-sans);
}

.timeline-scroll i {
  display: block;
  width: 7px;
  height: 7px;
  background: var(--house);
  border-radius: 50%;
  margin: -29px 0 32px;
  transition: transform 0.25s ease, box-shadow 0.25s ease;
}

.timeline-scroll article:hover i {
  transform: scale(1.5);
  box-shadow: 0 0 8px var(--house-glow);
}

.timeline-scroll h3 {
  font: 25px/1.2 var(--font-serif);
  margin: 0 0 10px;
}

.timeline-scroll p {
  font-size: 12px;
  line-height: 1.7;
  color: var(--color-muted-foreground);
}

.year-summary {
  margin-top: 30px;
}

.year-summary p {
  font: 500 9px/1 var(--font-sans);
  text-transform: uppercase;
  letter-spacing: 0.12em;
  color: var(--color-muted-foreground);
}
</style>
