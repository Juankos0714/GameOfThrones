<script setup lang="ts">
import { useTimeline } from '@/composables'
import { queryRef, stringCodec } from 'vue-qs'
import { computed, watch } from 'vue'

const { events, years, filterByYear } = useTimeline()

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
</script>

<template>
  <div class="timeline-page">
    <section class="chronology" style="min-height: 60vh">
      <p class="label">Cronología comparada</p>
      <h2>
        Antes y después<br />
        de la corona
      </h2>

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

      <!-- Timeline -->
      <div class="timeline-scroll">
        <article v-for="event in filteredEvents" :key="event.id">
          <time>{{ event.date }} d.C.</time>
          <i />
          <h3>{{ event.title }}</h3>
          <p>{{ event.description }}</p>
        </article>
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
  font-size: 8px;
  text-transform: uppercase;
  letter-spacing: 0.12em;
  cursor: pointer;
  transition: all 0.2s;
}

.timeline-filters button.active,
.timeline-filters button:hover {
  border-color: var(--house);
  color: var(--house);
  background: color-mix(in srgb, var(--house) 10%, transparent);
}

.timeline-scroll {
  display: flex;
  overflow-x: auto;
  gap: 2px;
  padding-bottom: 20px;
}

.timeline-scroll article {
  min-width: 300px;
  border-top: 1px solid var(--border);
  padding: 25px 30px 0 0;
  flex-shrink: 0;
}

.timeline-scroll time {
  color: var(--house);
  font-size: 9px;
}

.timeline-scroll i {
  display: block;
  width: 7px;
  height: 7px;
  background: var(--house);
  border-radius: 50%;
  margin: -29px 0 32px;
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
</style>
