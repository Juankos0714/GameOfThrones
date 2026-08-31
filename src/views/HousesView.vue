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
import {
  TreePine, Crown, Flame, Swords, Flower2, Anchor, Mountain, Waves, Shield,
  Search, ChevronUp, ChevronDown,
} from 'lucide-vue-next'

const { houses, selectHouse } = useHouses()

// vue-qs: search and sort synced with URL
const searchQuery = queryRef('q', { defaultValue: '', codec: stringCodec })
const sortField = queryRef('sort', { defaultValue: 'name', codec: stringCodec })
const sortDir = queryRef('dir', { defaultValue: 'asc', codec: stringCodec })

const iconMap: Record<string, any> = {
  TreePine, Crown, Flame, Swords, Flower2, Anchor, Mountain, Waves,
}

function getIcon(sigil: string) {
  return iconMap[sigil] ?? Shield
}

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
    id: 'index',
    header: '#',
    cell: (info) => String(info.row.index + 1).padStart(2, '0'),
    size: 50,
  },
  {
    id: 'sigil',
    header: '',
    cell: (info) => '',
    size: 32,
    enableSorting: false,
  },
  {
    accessorKey: 'name',
    header: 'Nombre',
    cell: (info) => info.getValue(),
    size: 200,
  },
  {
    accessorKey: 'region',
    header: 'Región',
    cell: (info) => info.getValue(),
    size: 160,
  },
  {
    accessorKey: 'motto',
    header: 'Lema',
    cell: (info) => info.getValue(),
    size: 200,
  },
  {
    id: 'members',
    header: 'Miembros',
    cell: (info) => info.row.original.members?.length ?? 0,
    size: 100,
    enableSorting: false,
  },
  {
    id: 'arrow',
    header: '',
    cell: () => '→',
    size: 30,
    enableSorting: false,
  },
]

const tableData = computed(() => houses.value)

const table = useTable({
  features,
  columns,
  data: tableData,
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
    const house = row.original
    const q = String(filterValue).toLowerCase()
    return (
      house.name.toLowerCase().includes(q) ||
      house.region.toLowerCase().includes(q) ||
      house.motto.toLowerCase().includes(q)
    )
  },
})

function selectAndScroll(id: string) {
  selectHouse(id)
}
</script>

<template>
  <div>
    <section class="catalogue" style="min-height: 100vh">
      <header class="editorial-head">
        <span>01 / Los grandes linajes</span>
        <h2>
          Casas de<br />
          Poniente
        </h2>
        <p>
          Nueve archivos dinásticos. Seleccione un nombre para alterar la materia
          del códice y consultar su monografía.
        </p>
      </header>

      <!-- Search bar -->
      <div class="table-search">
        <Search :size="16" />
        <input
          v-model="globalFilter"
          type="search"
          placeholder="Buscar casa por nombre, región o lema..."
          aria-label="Buscar casas"
          @input="(e: any) => { searchQuery = e.target.value }"
        />
      </div>

      <!-- Table -->
      <div class="table-wrapper" role="region" aria-label="Tabla de casas nobles">
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
              :whileHover="{ backgroundColor: 'color-mix(in srgb, var(--house) 15%, var(--color-paper))' }"
              :transition="{ layout: { type: 'tween', duration: 0.35 }, opacity: { duration: 0.25 } }"
              @click="selectAndScroll(row.original.id)">

              <td
                v-for="cell in row.getVisibleCells()"
                :key="cell.id"
                :class="{ 'sigil-cell': cell.column.id === 'sigil' }"
              >
                <RouterLink
                  v-if="cell.column.id !== 'arrow' && cell.column.id !== 'index' && cell.column.id !== 'sigil' && cell.column.id !== 'members'"
                  :to="`/houses/${row.original.slug}`"
                  class="cell-link"
                >
                  <FlexRender
                    :render="cell.column.columnDef.cell"
                    :props="cell.getContext()"
                  />
                </RouterLink>
                <template v-else-if="cell.column.id === 'sigil'">
                  <component :is="getIcon(row.original.sigil)" :size="18" />
                </template>
                <template v-else-if="cell.column.id === 'members'">
                  {{ row.original.members?.length ?? 0 }}
                </template>
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
        {{ table.getRowModel().rows.length }} de {{ houses.length }} casas
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
  font: 500 clamp(22px, 2.5vw, 34px) / 1 var(--font-serif);
}

.table-row {
  transition: padding 0.3s, background 0.3s;
  cursor: pointer;
}

.table-row:hover {
  background: color-mix(in srgb, var(--house) 20%, var(--color-paper));
}

.table-row:hover td:first-child {
  padding-left: 24px;
}

.sigil-cell {
  color: #514d43;
  width: 32px;
}

.cell-link {
  color: inherit;
  text-decoration: none;
}

.cell-link:hover {
  color: var(--house);
}

.table-count {
  margin-top: 20px;
  font-size: 9px;
  color: #625d52;
  text-transform: uppercase;
  letter-spacing: 0.12em;
}

@media (max-width: 900px) {
  .wiki-table th:nth-child(6),
  .wiki-table td:nth-child(6) {
    display: none;
  }
}

@media (max-width: 600px) {
  .wiki-table th:nth-child(4),
  .wiki-table td:nth-child(4) {
    display: none;
  }
}
</style>
