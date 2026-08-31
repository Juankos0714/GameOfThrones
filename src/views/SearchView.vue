<script setup lang="ts">
import { computed, ref, watch } from 'vue'
import { RouterLink, useRoute, useRouter } from 'vue-router'
import { queryRef, stringCodec } from 'vue-qs'
import { useSearch } from '@/composables'
import { Motion, AnimatePresence } from 'motion-v'
import { Search, Shield, Users, MapPin, Calendar, BookOpen } from 'lucide-vue-next'

const router = useRouter()
const { query, results, search, clearSearch, hasResults } = useSearch()

// Sync search query with URL
const urlQuery = queryRef('q', { defaultValue: '', codec: stringCodec })

watch(urlQuery, (v) => {
  if (v) search(v)
}, { immediate: true })

const typeLabels: Record<string, { label: string; icon: any; color: string }> = {
  house: { label: 'Casa', icon: Shield, color: 'var(--house)' },
  character: { label: 'Personaje', icon: Users, color: 'var(--color-success)' },
  place: { label: 'Lugar', icon: MapPin, color: 'var(--color-info)' },
  event: { label: 'Evento', icon: Calendar, color: 'var(--color-danger)' },
  book: { label: 'Libro', icon: BookOpen, color: '#8a5a8a' },
}

function getLink(result: typeof results.value[0]) {
  switch (result.type) {
    case 'house': return `/houses/${result.id}`
    case 'character': return `/characters/${result.id.toLowerCase().replace(/\s+/g, '-')}`
    case 'place': return `/places`
    case 'event': return `/timeline`
    case 'book': return `/books`
    default: return '/'
  }
}

function handleSearch(e: Event) {
  const value = (e.target as HTMLInputElement).value
  urlQuery.value = value
  search(value)
}
</script>

<template>
  <div class="search-page">
    <section class="catalogue" style="min-height: 60vh">
      <header class="editorial-head">
        <span>Búsqueda</span>
        <h2>Buscar en<br />el archivo</h2>
        <p>
          Encuentra casas, personajes, lugares y eventos por nombre o descripción.
        </p>
      </header>

      <!-- Search input -->
      <div class="search-input-wrapper">
        <Search :size="20" />
        <input
          :value="urlQuery"
          type="search"
          placeholder="Escriba su búsqueda..."
          aria-label="Búsqueda global"
          autofocus
          @input="handleSearch"
        />
        <button v-if="urlQuery" class="clear-btn" @click="urlQuery = ''; clearSearch()">
          Limpiar
        </button>
      </div>

      <!-- Results count -->
      <p v-if="urlQuery && hasResults" class="results-count">
        {{ results.length }} resultado{{ results.length !== 1 ? 's' : '' }} para "{{ urlQuery }}"
      </p>

      <!-- Results list -->
      <AnimatePresence v-if="hasResults" mode="popLayout">
        <div class="results-list">
          <Motion
            v-for="result in results"
            :key="`${result.type}-${result.id}`"
            layout
            :initial="{ opacity: 0, y: 10 }"
            :animate="{ opacity: 1, y: 0 }"
            :exit="{ opacity: 0, y: -10, scale: 0.95 }"
            :transition="{ layout: { type: 'spring', stiffness: 400, damping: 30 }, opacity: { duration: 0.25 }, y: { duration: 0.3 } }"
          >
            <RouterLink
              :to="getLink(result)"
              class="result-card"
            >
              <div class="result-type" :style="{ color: typeLabels[result.type]?.color }">
                <component :is="typeLabels[result.type]?.icon ?? Search" :size="18" />
                <span>{{ typeLabels[result.type]?.label }}</span>
              </div>
              <h3 class="result-title">{{ result.title }}</h3>
              <p class="result-subtitle">{{ result.subtitle }}</p>
            </RouterLink>
          </Motion>
        </div>
      </AnimatePresence>

      <!-- No results -->
      <div v-else-if="urlQuery && !hasResults" class="no-results">
        <Search :size="40" />
        <p>No se encontraron resultados para "{{ urlQuery }}"</p>
        <span>Intente con otros términos como "Stark", "dragón" o "Desembarco"</span>
      </div>

      <!-- Empty state -->
      <div v-else class="empty-state">
        <p>Comience escribiendo para buscar en el archivo.</p>
      </div>
    </section>
  </div>
</template>

<style scoped>
.search-input-wrapper {
  display: flex;
  align-items: center;
  gap: 14px;
  padding: 18px 24px;
  border: 2px solid #918876;
  margin-bottom: 40px;
  background: rgba(255,255,255,0.04);
  transition: border-color 0.25s ease;
}

.search-input-wrapper:focus-within {
  border-color: var(--house);
}

.search-input-wrapper svg {
  color: #625d52;
  flex-shrink: 0;
}

.search-input-wrapper input {
  flex: 1;
  border: none;
  background: none;
  font: 500 18px var(--font-serif);
  color: var(--color-ink);
  outline: none;
}

.search-input-wrapper input::placeholder {
  color: #918876;
  font-size: 14px;
}

.clear-btn {
  border: 1px solid #918876;
  background: none;
  color: #625d52;
  padding: 6px 12px;
  font: 500 8px/1 var(--font-sans);
  text-transform: uppercase;
  letter-spacing: 0.12em;
  cursor: pointer;
  transition: all 0.2s ease;
}

.clear-btn:hover {
  border-color: var(--house);
  color: var(--house);
}

.results-count {
  font: 500 9px/1 var(--font-sans);
  color: #625d52;
  margin-bottom: 24px;
  text-transform: uppercase;
  letter-spacing: 0.1em;
}

.results-list {
  display: grid;
  gap: 8px;
}

.result-card {
  display: block;
  padding: 24px;
  border: 1px solid var(--border);
  text-decoration: none;
  color: inherit;
  transition: background 0.25s ease, border-color 0.25s ease;
}

.result-card:hover {
  background: var(--house-surface);
  border-color: var(--house-border);
}

.result-type {
  display: flex;
  align-items: center;
  gap: 8px;
  margin-bottom: 8px;
}

.result-type span {
  font: 500 8px/1 var(--font-sans);
  text-transform: uppercase;
  letter-spacing: 0.12em;
}

.result-title {
  font: 500 24px/1 var(--font-serif);
  margin: 0 0 6px;
}

.result-subtitle {
  font: italic 14px var(--font-serif);
  color: var(--color-muted-foreground);
  margin: 0;
}

.no-results {
  text-align: center;
  padding: 80px 20px;
}

.no-results svg {
  color: var(--border);
  margin-bottom: 20px;
}

.no-results p {
  font: 500 20px var(--font-serif);
  margin: 0 0 8px;
}

.no-results span {
  font-size: 12px;
  color: var(--color-muted-foreground);
}

.empty-state {
  text-align: center;
  padding: 80px 20px;
  color: var(--color-muted-foreground);
  font-size: 12px;
}
</style>
