<script setup lang="ts">
import { ref, computed, watch } from 'vue'
import { RouterLink } from 'vue-router'
import { Motion, AnimatePresence } from 'motion-v'
import { useHouses } from '@/composables'
import CharacterCard from '@/components/wiki/CharacterCard.vue'
import SectionReveal from '@/components/ui/SectionReveal.vue'
import Skeleton from '@/components/ui/Skeleton.vue'
import { Search, LayoutGrid, List } from 'lucide-vue-next'

const { houses, loading } = useHouses()

const viewMode = ref<'cards' | 'table'>('cards')
const searchQuery = ref('')

const allCharacters = computed(() => {
  const characters: Array<{
    id: string
    name: string
    title: string
    status: 'alive' | 'deceased' | 'unknown'
    houseName: string
    houseSlug: string
    houseSigil?: string
  }> = []
  houses.value.forEach((house) => {
    house.members.forEach((member, i) => {
      characters.push({
        id: `${house.slug}-${i}`,
        name: member.name,
        title: member.title,
        status: member.status,
        houseName: house.name,
        houseSlug: house.slug,
        houseSigil: house.sigil,
      })
    })
  })
  return characters
})

const filteredCharacters = computed(() => {
  if (!searchQuery.value.trim()) return allCharacters.value
  const q = searchQuery.value.toLowerCase()
  return allCharacters.value.filter(
    (c) =>
      c.name.toLowerCase().includes(q) ||
      c.title.toLowerCase().includes(q) ||
      c.houseName.toLowerCase().includes(q)
  )
})

const statusLabels: Record<string, string> = {
  alive: 'Vivo',
  deceased: 'Fallecido',
  unknown: 'Desconocido',
}

const statusColors: Record<string, string> = {
  alive: 'var(--color-success)',
  deceased: 'var(--color-danger)',
  unknown: 'var(--color-warning)',
}

function getCharacterSlug(name: string) {
  return name.toLowerCase().replace(/\s+/g, '-')
}
</script>

<template>
  <div class="characters-page">
    <section class="catalogue" style="min-height: 60vh">
      <SectionReveal>
        <header class="editorial-head">
          <span>Personajes</span>
          <h2>Figuras de<br />Poniente</h2>
          <p>
            Expedientes de quienes moldearon la historia con juramentos, traiciones
            y glorias.
          </p>
        </header>
      </SectionReveal>

      <!-- Toolbar -->
      <div class="characters-toolbar">
        <div class="table-search">
          <Search :size="16" />
          <input
            v-model="searchQuery"
            type="search"
            placeholder="Buscar personaje por nombre, título o casa..."
            aria-label="Buscar personajes"
          />
        </div>

        <div class="view-toggle">
          <button
            :class="{ active: viewMode === 'cards' }"
            @click="viewMode = 'cards'"
            aria-label="Vista de tarjetas"
          >
            <LayoutGrid :size="16" />
          </button>
          <button
            :class="{ active: viewMode === 'table' }"
            @click="viewMode = 'table'"
            aria-label="Vista de tabla"
          >
            <List :size="16" />
          </button>
        </div>
      </div>

      <!-- Loading skeleton -->
      <div v-if="loading" role="status" aria-label="Cargando personajes">
        <div class="characters-grid">
          <div v-for="i in 8" :key="i" class="skeleton-card">
            <Skeleton width="72px" height="72px" rounded />
            <div>
              <Skeleton width="80px" height="10px" style="margin-bottom: 8px" />
              <Skeleton width="150px" height="20px" style="margin-bottom: 6px" />
              <Skeleton width="120px" height="12px" />
            </div>
          </div>
        </div>
      </div>

      <!-- Cards view -->
      <div v-else-if="viewMode === 'cards'" class="characters-grid">
        <AnimatePresence mode="popLayout">
          <CharacterCard
            v-for="char in filteredCharacters"
            :key="char.id"
            :name="char.name"
            :title="char.title"
            :status="char.status"
            :house-name="char.houseName"
            :house-slug="char.houseSlug"
            :house-sigil="char.houseSigil"
          />
        </AnimatePresence>
      </div>

      <!-- Table view -->
      <div v-else class="table-wrapper" role="region" aria-label="Tabla de personajes">
        <table class="wiki-table">
          <thead>
            <tr>
              <th style="width:220px">Nombre</th>
              <th style="width:200px">Título</th>
              <th style="width:140px">Casa</th>
              <th style="width:120px">Estado</th>
            </tr>
          </thead>
          <tbody>
            <Motion
              v-for="char in filteredCharacters"
              :key="char.id"
              as="tr"
              class="table-row"
              :initial="{ opacity: 0 }"
              :animate="{ opacity: 1 }"
              :exit="{ opacity: 0 }"
              :whileHover="{ backgroundColor: 'color-mix(in srgb, var(--house) 12%, var(--color-paper))' }"
              :transition="{ duration: 0.25 }"
            >
              <td>
                <RouterLink
                  :to="`/characters/${getCharacterSlug(char.name)}`"
                  class="cell-link"
                >
                  {{ char.name }}
                </RouterLink>
              </td>
              <td>{{ char.title }}</td>
              <td>
                <RouterLink
                  :to="`/houses/${char.houseSlug}`"
                  class="cell-link house-link"
                >
                  {{ char.houseName }}
                </RouterLink>
              </td>
              <td>
                <span
                  class="status-badge"
                  :style="{
                    color: statusColors[char.status],
                    borderColor: statusColors[char.status],
                  }"
                >
                  {{ statusLabels[char.status] }}
                </span>
              </td>
            </Motion>
          </tbody>
        </table>
      </div>

      <p class="table-count">
        {{ filteredCharacters.length }} de {{ allCharacters.length }} personajes
      </p>
    </section>
  </div>
</template>

<style scoped>
.characters-toolbar {
  display: flex;
  gap: 12px;
  margin-bottom: 30px;
  align-items: center;
}

.table-search {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 14px 20px;
  border: 1px solid #918876;
  background: rgba(255,255,255,0.04);
  flex: 1;
  transition: border-color 0.25s ease;
}

.table-search:focus-within {
  border-color: var(--house);
}

.table-search svg {
  color: #625d52;
  flex-shrink: 0;
}

.table-search input {
  flex: 1;
  border: none;
  background: none;
  font: 14px var(--font-serif);
  color: var(--color-ink);
  outline: none;
}

.table-search input::placeholder {
  color: #918876;
  font-size: 12px;
}

.view-toggle {
  display: flex;
  border: 1px solid #918876;
  overflow: hidden;
}

.view-toggle button {
  width: 44px;
  height: 44px;
  border: none;
  background: transparent;
  color: #625d52;
  cursor: pointer;
  display: grid;
  place-items: center;
  transition: all 0.2s ease;
}

.view-toggle button.active {
  background: color-mix(in srgb, var(--house) 15%, var(--color-paper));
  color: var(--house);
}

.view-toggle button:hover:not(.active) {
  background: rgba(255,255,255,0.04);
}

.characters-grid {
  display: grid;
  gap: 12px;
}

.skeleton-card {
  display: flex;
  gap: 20px;
  align-items: center;
  padding: 24px;
  border: 1px solid var(--border);
}

.table-wrapper {
  overflow-x: auto;
  border-top: 1px solid #6e685b;
}

.wiki-table {
  width: 100%;
  border-collapse: collapse;
}

.wiki-table th {
  text-align: left;
  padding: 16px 16px;
  font: 600 8px/1 var(--font-sans);
  text-transform: uppercase;
  letter-spacing: 0.15em;
  color: #5c574d;
  border-bottom: 1px solid #6e685b;
  white-space: nowrap;
  user-select: none;
}

.wiki-table td {
  padding: 18px 16px;
  border-bottom: 1px solid #8b8372;
  font: 500 18px/1 var(--font-serif);
}

.table-row {
  transition: background 0.25s ease;
  cursor: pointer;
}

.table-row:hover {
  background: color-mix(in srgb, var(--house) 15%, var(--color-paper));
}

.cell-link {
  color: inherit;
  text-decoration: none;
  transition: color 0.2s ease;
}

.cell-link:hover {
  color: var(--house);
}

.house-link {
  color: var(--house);
}

.status-badge {
  font: 500 7px/1 var(--font-sans);
  text-transform: uppercase;
  letter-spacing: 0.12em;
  padding: 5px 10px;
  border: 1px solid;
}

.table-count {
  margin-top: 20px;
  font: 500 9px/1 var(--font-sans);
  color: #625d52;
  text-transform: uppercase;
  letter-spacing: 0.12em;
}

@media (max-width: 600px) {
  .characters-toolbar {
    flex-direction: column;
  }

  .view-toggle {
    align-self: flex-end;
  }
}
</style>
