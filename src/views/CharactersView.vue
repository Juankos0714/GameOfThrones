<script setup lang="ts">
import { ref, computed, watch } from 'vue'
import { RouterLink } from 'vue-router'
import {
  useTable,
  tableFeatures,
  createSortedRowModel,
  createFilteredRowModel,
  rowSortingFeature,
  globalFilteringFeature,
  columnFilteringFeature,
  sortFns,
  FlexRender,
  type ColumnDef,
  type SortingState,
} from '@tanstack/vue-table'
import { queryRef, stringCodec } from 'vue-qs'
import { useHouses } from '@/composables'
import { Motion } from 'motion-v'
import { Search, ChevronUp, ChevronDown } from 'lucide-vue-next'

import Skeleton from '@/components/ui/Skeleton.vue'
const { houses, loading } = useHouses()

// vue-qs: search and sort synced with URL
const searchQuery = queryRef('q', { defaultValue: '', codec: stringCodec })
const sortField = queryRef('sort', { defaultValue: 'name', codec: stringCodec })
const sortDir = queryRef('dir', { defaultValue: 'asc', codec: stringCodec })

const allCharacters = computed(() => {
  const characters: Array<{
    id: string
    name: string
    title: string
    status: string
    houseName: string
    houseSlug: string
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
      })
    })
  })
  return characters
})

const sorting = ref<SortingState>([
  { id: sortField.value || 'name', desc: sortDir.value === 'desc' },
])

const globalFilter = ref(searchQuery.value)

watch(searchQuery, (v) => { globalFilter.value = v })
watch(sorting, (s) => {
  if (s.length > 0) {
    sortField.value = s[0].id
    sortDir.value = s[0].desc ? 'desc' : 'asc'
  }
}, { deep: true })

const statusLabels: Record<string, string> = {
  alive: 'Vivo',
  deceased: 'Fallecido',
  unknown: 'Desconocido',
}

const features = tableFeatures({
  rowSortingFeature,
  globalFilteringFeature,
  columnFilteringFeature,
  sortedRowModel: createSortedRowModel(),
  filteredRowModel: createFilteredRowModel(),
  sortFns,
})

const columns: ColumnDef<any, any>[] = [
  {
    accessorKey: 'name',
    header: 'Nombre',
    cell: (info) => info.getValue(),
    size: 220,
  },
  {
    accessorKey: 'title',
    header: 'Título',
    cell: (info) => info.getValue(),
    size: 200,
  },
  {
    accessorKey: 'houseName',
    header: 'Casa',
    cell: (info) => info.getValue(),
    size: 140,
  },
  {
    accessorKey: 'status',
    header: 'Estado',
    cell: (info) => statusLabels[String(info.getValue())] ?? String(info.getValue()),
    size: 120,
  },
  {
    id: 'arrow',
    header: '',
    cell: () => '→',
    size: 30,
    enableSorting: false,
  },
]

const table = useTable({
  features,
  columns,
  data: allCharacters,
  state: {
    get sorting() { return sorting.value },
    get globalFilter() { return globalFilter.value },
  },
  onSortingChange: (updater) => {
    sorting.value = typeof updater === 'function' ? updater(sorting.value) : updater
  },
  onGlobalFilterChange: (updater) => {
    globalFilter.value = typeof updater === 'function' ? updater(globalFilter.value) : updater
    searchQuery.value = globalFilter.value
  },
  globalFilterFn: (row, _columnId, filterValue) => {
    const char = row.original
    const q = String(filterValue).toLowerCase()
    return (
      char.name.toLowerCase().includes(q) ||
      char.title.toLowerCase().includes(q) ||
      char.houseName.toLowerCase().includes(q)
    )
  },
})

function getCharacterSlug(name: string) {
  return name.toLowerCase().replace(/\s+/g, '-')
}
</script>

<template>
  <div class="characters-page">
    <section class="catalogue" style="min-height: 60vh">
      <header class="editorial-head">
        <span>Personajes</span>
        <h2>Figuras de<br />Poniente</h2>
        <p>
          Expedientes de quienes moldearon la historia con juramentos, traiciones
          y glorias.
        </p>
      </header>

      <!-- Search bar -->
      <div class="table-search">
        <Search :size="16" />
        <input
          v-model="globalFilter"
          type="search"
          placeholder="Buscar personaje por nombre, título o casa..."
          aria-label="Buscar personajes"
          @input="(e: any) => { searchQuery = e.target.value }"
        />
      </div>

      <!-- Loading skeleton -->
      <div v-if="loading" class="table-wrapper" role="status" aria-label="Cargando personajes">
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
            <tr v-for="i in 8" :key="i" class="skeleton-row">
              <td><Skeleton width="150px" height="14px" /></td>
              <td><Skeleton width="130px" height="14px" /></td>
              <td><Skeleton width="90px" height="14px" /></td>
              <td><Skeleton width="80px" height="14px" /></td>
            </tr>
          </tbody>
        </table>
        <p class="table-count">Cargando personajes...</p>
      </div>

      <!-- Table -->
      <div v-else class="table-wrapper" role="region" aria-label="Tabla de personajes">
        <table class="wiki-table">
          <thead>
            <tr v-for="headerGroup in table.getHeaderGroups()" :key="headerGroup.id">
              <th
                v-for="header in headerGroup.headers"
                :key="header.id"
                :style="{ width: header.column.columnDef.size ? `${header.column.columnDef.size}px` : undefined }"
                :class="{ sortable: header.column.getCanSort() }"
                @click="header.column.getToggleSortingHandler()?.($event)"
              >
                <FlexRender
                  v-if="!header.isPlaceholder"
                  :render="header.column.columnDef.header"
                  :props="header.getContext()"
                />
                <span v-if="header.column.getCanSort()" class="sort-icon">
                  <ChevronUp v-if="header.column.getIsSorted() === 'asc'" :size="12" />
                  <ChevronDown v-else-if="header.column.getIsSorted() === 'desc'" :size="12" />
                </span>
              </th>
            </tr>
          </thead>
          <tbody>
            <Motion
              v-for="row in table.getRowModel().rows"
              :key="row.original.id"
              as="tr"
              class="table-row"
              layout
              :layout-dependency="globalFilter"
              :initial="{ opacity: 0 }"
              :animate="{ opacity: 1 }"
              :exit="{ opacity: 0 }"
              :whileHover="{ backgroundColor: 'color-mix(in srgb, var(--house) 12%, var(--color-paper))' }"
              :transition="{ layout: { type: 'tween', duration: 0.35 }, opacity: { duration: 0.25 } }"
            >
              <td v-for="cell in row.getVisibleCells()" :key="cell.id">
                <RouterLink
                  v-if="cell.column.id !== 'arrow' && cell.column.id !== 'status'"
                  :to="`/characters/${getCharacterSlug(row.original.name)}`"
                  class="cell-link"
                >
                  <FlexRender
                    :render="cell.column.columnDef.cell"
                    :props="cell.getContext()"
                  />
                </RouterLink>
                <span
                  v-else-if="cell.column.id === 'status'"
                  :class="`status-badge status-${row.original.status}`"
                >
                  {{ statusLabels[row.original.status] }}
                </span>
                <template v-else>
                  <FlexRender
                    :render="cell.column.columnDef.cell"
                    :props="cell.getContext()"
                  />
                </template>
              </td>
            </Motion>
          </tbody>
        </table>
      </div>

      <p class="table-count">
        {{ table.getRowModel().rows.length }} de {{ allCharacters.length }} personajes
      </p>
    </section>
  </div>
</template>

<style scoped>
.table-search {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 14px 20px;
  border: 1px solid #918876;
  margin-bottom: 30px;
  background: rgba(255,255,255,0.04);
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
  font-size: 8px;
  text-transform: uppercase;
  letter-spacing: 0.15em;
  color: #5c574d;
  border-bottom: 1px solid #6e685b;
  white-space: nowrap;
  user-select: none;
}

.wiki-table th.sortable {
  cursor: pointer;
}

.wiki-table th.sortable:hover {
  color: var(--house);
}

.sort-icon {
  margin-left: 4px;
  display: inline-flex;
  vertical-align: middle;
}

.wiki-table td {
  padding: 18px 16px;
  border-bottom: 1px solid #8b8372;
  font: 500 18px/1 var(--font-serif);
}

.table-row {
  transition: background 0.3s;
}

.table-row:hover {
  background: color-mix(in srgb, var(--house) 15%, var(--color-paper));
}

.cell-link {
  color: inherit;
  text-decoration: none;
}

.cell-link:hover {
  color: var(--house);
}

.status-badge {
  font-size: 7px;
  text-transform: uppercase;
  letter-spacing: 0.12em;
  padding: 5px 10px;
  border: 1px solid var(--border);
}

.status-alive {
  color: #5a8a5e;
  border-color: #5a8a5e;
}

.status-deceased {
  color: #8a5a5a;
  border-color: #8a5a5a;
}

.status-unknown {
  color: #8a8a5a;
  border-color: #8a8a5a;
}

.skeleton-row td {
  padding: 18px 16px;
  border-bottom: 1px solid #8b8372;
}

.table-count {
  margin-top: 20px;
  font-size: 9px;
  color: #625d52;
  text-transform: uppercase;
  letter-spacing: 0.12em;
}

@media (max-width: 600px) {
  .wiki-table th:nth-child(3),
  .wiki-table td:nth-child(3) {
    display: none;
  }
}
</style>
