<script setup lang="ts">
import { ref, onMounted, onUnmounted } from 'vue'
import { monitorForElements } from '@atlaskit/pragmatic-drag-and-drop/element/adapter'
import { Clipboard, CheckCircle, XCircle, Clock } from 'lucide-vue-next'

/**
 * Moderation queue — drag revisions between columns:
 * Pendiente → Aprobado / Rechazado
 *
 * Uses @atlaskit/pragmatic-drag-and-drop (framework-agnostic).
 */

interface Revision {
  id: string
  tableName: string
  recordId: string
  changedBy: string
  diff: Record<string, { old: any; new: any }>
  createdAt: string
  status: 'pending' | 'approved' | 'rejected'
}

// Sample data (would come from Supabase in production)
const allRevisions = ref<Revision[]>([
  {
    id: '1',
    tableName: 'characters',
    recordId: 'b0000000-0000-0000-0000-000000000001',
    changedBy: 'editor@example.com',
    diff: { description: { old: 'Ned Stark era un hombre honorable.', new: 'Eddard Stark, conocido como Ned, fue Señor de Invernalia y Mano del Rey.' } },
    createdAt: '298 AC',
    status: 'pending',
  },
  {
    id: '2',
    tableName: 'houses',
    recordId: 'a0000000-0000-0000-0000-000000000002',
    changedBy: 'editor2@example.com',
    diff: { words: { old: 'Oye mi rugido', new: 'Oye mi rugido (Lann el Astuto)' } },
    createdAt: '299 AC',
    status: 'pending',
  },
  {
    id: '3',
    tableName: 'characters',
    recordId: 'b0000000-0000-0000-0000-000000000009',
    changedBy: 'editor3@example.com',
    diff: { status: { old: 'desconocido', new: 'muerto' } },
    createdAt: '300 AC',
    status: 'pending',
  },
])

const pending = ref<Revision[]>([])
const approved = ref<Revision[]>([])
const rejected = ref<Revision[]>([])

function initColumns() {
  pending.value = allRevisions.value.filter((r) => r.status === 'pending')
  approved.value = allRevisions.value.filter((r) => r.status === 'approved')
  rejected.value = allRevisions.value.filter((r) => r.status === 'rejected')
}

function findByRevisionId(id: string): { list: typeof pending; index: number } | null {
  const lists = [pending, approved, rejected]
  for (const list of lists) {
    const idx = list.value.findIndex((r: Revision) => r.id === id)
    if (idx !== -1) return { list, index: idx }
  }
  return null
}

onMounted(() => {
  initColumns()

  const cleanup = monitorForElements({
    onDrop({ source, location }: any) {
      const target = location.current.dropTargets[0]
      if (!target) return
      const targetColumn = target.data.get('column') as string
      const revisionId = source.data.get('revisionId') as string

      if (!targetColumn || !revisionId) return

      const found = findByRevisionId(revisionId)
      if (!found) return

      const moved = found.list.value.splice(found.index, 1)[0]
      moved.status = targetColumn as Revision['status']

      if (targetColumn === 'pending') pending.value.push(moved)
      else if (targetColumn === 'approved') approved.value.push(moved)
      else if (targetColumn === 'rejected') rejected.value.push(moved)
    },
  })

  onUnmounted(() => cleanup())
})

function onDragStart(e: DragEvent, revision: Revision) {
  e.dataTransfer?.setData('text/plain', revision.id)
}

const tableLabels: Record<string, string> = {
  characters: 'Personaje',
  houses: 'Casa',
  locations: 'Lugar',
  events: 'Evento',
}
</script>

<template>
  <div class="moderation-queue">
    <header class="queue-header">
      <Clipboard :size="20" />
      <div>
        <h2>Cola de moderación</h2>
        <p>Arrastre las ediciones pendientes para aprobarlas o rechazarlas.</p>
      </div>
    </header>

    <div class="columns">
      <!-- Pendiente -->
      <div
        class="column"
        data-column="pending"
        @dragover.prevent
      >
        <div class="column-header pending">
          <Clock :size="16" />
          <span>Pendiente</span>
          <span class="count">{{ pending.length }}</span>
        </div>
        <div class="column-body">
          <div
            v-for="rev in pending"
            :key="rev.id"
            class="revision-card"
            draggable="true"
            :data-revision-id="rev.id"
            @dragstart="(e: DragEvent) => onDragStart(e, rev)"
          >
            <div class="rev-meta">
              <span class="rev-table">{{ tableLabels[rev.tableName] }}</span>
              <span class="rev-date">{{ rev.createdAt }}</span>
            </div>
            <p class="rev-author">{{ rev.changedBy }}</p>
            <div class="rev-diff">
              <div v-for="(change, field) in rev.diff" :key="field" class="diff-line">
                <span class="diff-field">{{ field }}</span>
                <span class="diff-old">{{ change.old }}</span>
                <span class="diff-arrow">→</span>
                <span class="diff-new">{{ change.new }}</span>
              </div>
            </div>
          </div>
          <p v-if="!pending.length" class="empty-col">Sin ediciones pendientes</p>
        </div>
      </div>

      <!-- Aprobado -->
      <div
        class="column"
        data-column="approved"
        @dragover.prevent
      >
        <div class="column-header approved">
          <CheckCircle :size="16" />
          <span>Aprobado</span>
          <span class="count">{{ approved.length }}</span>
        </div>
        <div class="column-body">
          <div
            v-for="rev in approved"
            :key="rev.id"
            class="revision-card approved"
            draggable="true"
            :data-revision-id="rev.id"
            @dragstart="(e: DragEvent) => onDragStart(e, rev)"
          >
            <div class="rev-meta">
              <span class="rev-table">{{ tableLabels[rev.tableName] }}</span>
              <span class="rev-date">{{ rev.createdAt }}</span>
            </div>
            <p class="rev-author">{{ rev.changedBy }}</p>
          </div>
          <p v-if="!approved.length" class="empty-col">Sin ediciones aprobadas</p>
        </div>
      </div>

      <!-- Rechazado -->
      <div
        class="column"
        data-column="rejected"
        @dragover.prevent
      >
        <div class="column-header rejected">
          <XCircle :size="16" />
          <span>Rechazado</span>
          <span class="count">{{ rejected.length }}</span>
        </div>
        <div class="column-body">
          <div
            v-for="rev in rejected"
            :key="rev.id"
            class="revision-card rejected"
            draggable="true"
            :data-revision-id="rev.id"
            @dragstart="(e: DragEvent) => onDragStart(e, rev)"
          >
            <div class="rev-meta">
              <span class="rev-table">{{ tableLabels[rev.tableName] }}</span>
              <span class="rev-date">{{ rev.createdAt }}</span>
            </div>
            <p class="rev-author">{{ rev.changedBy }}</p>
          </div>
          <p v-if="!rejected.length" class="empty-col">Sin ediciones rechazadas</p>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.moderation-queue {
  padding: 40px 0;
}

.queue-header {
  display: flex;
  align-items: center;
  gap: 16px;
  margin-bottom: 30px;
}

.queue-header svg {
  color: var(--house);
}

.queue-header h2 {
  font: 500 28px var(--font-serif);
  margin: 0;
}

.queue-header p {
  font-size: 11px;
  color: var(--color-muted-foreground);
  margin: 4px 0 0;
}

.columns {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 16px;
}

.column {
  border: 1px solid var(--border);
  min-height: 300px;
}

.column-header {
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 14px 16px;
  border-bottom: 1px solid var(--border);
  font-size: 10px;
  text-transform: uppercase;
  letter-spacing: 0.12em;
}

.column-header.pending { background: color-mix(in srgb, var(--house) 8%, transparent); }
.column-header.approved { background: color-mix(in srgb, #5a8a5e 8%, transparent); color: #5a8a5e; }
.column-header.rejected { background: color-mix(in srgb, #8a5a5a 8%, transparent); color: #8a5a5a; }

.column-header .count {
  margin-left: auto;
  background: rgba(0,0,0,0.2);
  padding: 2px 8px;
  border-radius: 10px;
  font-size: 9px;
}

.column-body {
  padding: 12px;
  min-height: 200px;
}

.revision-card {
  border: 1px solid var(--border);
  padding: 14px;
  margin-bottom: 8px;
  background: var(--color-background);
  cursor: grab;
  transition: box-shadow 0.2s;
}

.revision-card:active {
  cursor: grabbing;
  box-shadow: 0 4px 12px rgba(0,0,0,0.3);
}

.revision-card.approved {
  opacity: 0.7;
  border-color: #5a8a5e;
}

.revision-card.rejected {
  opacity: 0.5;
  border-color: #8a5a5a;
  text-decoration: line-through;
}

.rev-meta {
  display: flex;
  justify-content: space-between;
  margin-bottom: 6px;
}

.rev-table {
  font-size: 8px;
  text-transform: uppercase;
  letter-spacing: 0.12em;
  color: var(--house);
}

.rev-date {
  font-size: 8px;
  color: var(--color-muted-foreground);
}

.rev-author {
  font-size: 11px;
  color: var(--color-muted-foreground);
  margin: 0 0 10px;
}

.rev-diff {
  border-top: 1px solid var(--border);
  padding-top: 8px;
}

.diff-line {
  display: flex;
  align-items: baseline;
  gap: 6px;
  font-size: 11px;
  margin-bottom: 4px;
  flex-wrap: wrap;
}

.diff-field {
  font-size: 8px;
  text-transform: uppercase;
  letter-spacing: 0.1em;
  color: var(--house);
  min-width: 60px;
}

.diff-old {
  color: #8a5a5a;
  text-decoration: line-through;
}

.diff-arrow {
  color: var(--color-muted-foreground);
}

.diff-new {
  color: #5a8a5e;
}

.empty-col {
  text-align: center;
  color: var(--color-muted-foreground);
  font-size: 11px;
  padding: 40px 20px;
}

@media (max-width: 900px) {
  .columns {
    grid-template-columns: 1fr;
  }
}
</style>
