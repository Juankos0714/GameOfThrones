<script setup lang="ts">
import { ref, computed } from 'vue'
import { useHouses } from '@/composables'
import { Motion } from 'motion-v'
import SectionReveal from '@/components/ui/SectionReveal.vue'
import { ZoomIn, ZoomOut, RotateCcw } from 'lucide-vue-next'

const { houses, selectedHouse, selectHouse } = useHouses()

const zoom = ref(1)
const panX = ref(0)
const panY = ref(0)
const selectedNode = ref<string | null>(null)

const treeNodes = [
  { id: 'root', name: 'Aegon I', title: 'El Conquistador', x: 400, y: 50, parent: null, house: 'targaryen' },
  { id: 'aenys', name: 'Aenys I', title: 'El Débil', x: 300, y: 150, parent: 'root', house: 'targaryen' },
  { id: 'maegor', name: 'Maegor I', title: 'El Cruel', x: 500, y: 150, parent: 'root', house: 'targaryen' },
  { id: 'jaehaerys', name: 'Jaehaerys I', title: 'El Conciliador', x: 300, y: 250, parent: 'aenys', house: 'targaryen' },
  { id: 'viserys', name: 'Viserys I', title: 'El Pacífico', x: 200, y: 350, parent: 'jaehaerys', house: 'targaryen' },
  { id: 'aegon-ii', name: 'Aegon II', title: 'El Usurpador', x: 100, y: 450, parent: 'viserys', house: 'targaryen' },
  { id: 'aegon-iii', name: 'Aegon III', title: 'El Desdichado', x: 300, y: 450, parent: 'viserys', house: 'targaryen' },
  { id: 'daeron', name: 'Daeron I', title: 'El Joven Dragón', x: 250, y: 550, parent: 'aegon-iii', house: 'targaryen' },
  { id: 'baelor', name: 'Baelor I', title: 'El Bendito', x: 350, y: 550, parent: 'aegon-iii', house: 'targaryen' },
  { id: 'aerys', name: 'Aerys II', title: 'El Rey Loco', x: 200, y: 650, parent: 'daeron', house: 'targaryen' },
  { id: 'rhaegar', name: 'Rhaegar', title: 'El Príncipe Consentido', x: 150, y: 750, parent: 'aerys', house: 'targaryen' },
  { id: 'viserys-iii', name: 'Viserys III', title: 'El Rey Mendicante', x: 250, y: 750, parent: 'aerys', house: 'targaryen' },
  { id: 'daenerys', name: 'Daenerys', title: 'Madre de Dragones', x: 150, y: 850, parent: 'rhaegar', house: 'targaryen' },
  { id: 'aegon-vi', name: 'Aegon VI', title: 'Jon Nieve', x: 300, y: 850, parent: 'rhaegar', house: 'targaryen' },
]

const edges = computed(() =>
  treeNodes
    .filter((n) => n.parent)
    .map((n) => {
      const parent = treeNodes.find((p) => p.id === n.parent)!
      return { from: parent, to: n, id: `${parent.id}-${n.id}` }
    })
)

// Get related nodes (parent, children, siblings)
function getRelatedNodes(nodeId: string): string[] {
  const node = treeNodes.find(n => n.id === nodeId)
  if (!node) return []
  const related: string[] = [nodeId]
  // Parent
  if (node.parent) related.push(node.parent)
  // Children
  treeNodes.filter(n => n.parent === nodeId).forEach(n => related.push(n.id))
  // Siblings
  if (node.parent) {
    treeNodes.filter(n => n.parent === node.parent && n.id !== nodeId).forEach(n => related.push(n.id))
  }
  return related
}

const highlightedNodes = computed(() => {
  if (!selectedNode.value) return new Set<string>()
  return new Set(getRelatedNodes(selectedNode.value))
})

function resetView() {
  zoom.value = 1
  panX.value = 0
  panY.value = 0
}

function selectNode(id: string) {
  selectedNode.value = selectedNode.value === id ? null : id
}
</script>

<template>
  <div class="genealogy-page">
    <section class="chronology" style="min-height: 60vh">
      <SectionReveal>
        <p class="label">Genealogía</p>
        <h2>
          La sangre<br />
          recuerda
        </h2>
      </SectionReveal>

      <!-- House selector -->
      <div class="genealogy-houses">
        <button
          v-for="house in houses"
          :key="house.id"
          :class="{ active: house.id === 'targaryen' }"
          disabled
        >
          {{ house.name }}
        </button>
        <span class="genealogy-note">Mostrando: Línea Targaryen</span>
      </div>

      <!-- Controls -->
      <div class="genealogy-controls">
        <button @click="zoom = Math.min(2, zoom + 0.2)" aria-label="Acercar">
          <ZoomIn :size="14" />
        </button>
        <button @click="zoom = Math.max(0.5, zoom - 0.2)" aria-label="Alejar">
          <ZoomOut :size="14" />
        </button>
        <button @click="resetView" aria-label="Restablecer vista">
          <RotateCcw :size="14" />
          <span>Reset</span>
        </button>
      </div>

      <!-- Selected node info -->
      <AnimatePresence>
        <Motion
          v-if="selectedNode"
          class="node-info"
          :initial="{ opacity: 0, y: 8 }"
          :animate="{ opacity: 1, y: 0 }"
          :exit="{ opacity: 0 }"
          :transition="{ duration: 0.25 }"
        >
          <span class="node-info-name">{{ treeNodes.find(n => n.id === selectedNode)?.name }}</span>
          <span class="node-info-title">{{ treeNodes.find(n => n.id === selectedNode)?.title }}</span>
          <button @click="selectedNode = null" class="node-info-close">×</button>
        </Motion>
      </AnimatePresence>

      <!-- Tree -->
      <div class="genealogy-tree">
        <svg
          viewBox="0 0 600 900"
          :style="{ transform: `scale(${zoom}) translate(${panX}px, ${panY}px)` }"
          class="tree-svg"
        >
          <!-- Edges -->
          <line
            v-for="edge in edges"
            :key="edge.id"
            :x1="edge.from.x"
            :y1="edge.from.y + 20"
            :x2="edge.to.x"
            :y2="edge.to.y - 20"
            :stroke="selectedNode && !highlightedNodes.has(edge.id.split('-')[0]) ? 'var(--border)' : 'var(--house)'"
            :stroke-width="selectedNode && highlightedNodes.has(edge.id.split('-')[0]) ? 1.5 : 1"
            :opacity="selectedNode && !highlightedNodes.has(edge.id.split('-')[0]) ? 0.3 : 0.6"
            class="tree-edge"
          />

          <!-- Nodes -->
          <g v-for="node in treeNodes" :key="node.id" @click="selectNode(node.id)" style="cursor: pointer">
            <rect
              :x="node.x - 55"
              :y="node.y - 16"
              width="110"
              height="32"
              :fill="selectedNode === node.id ? 'var(--house-surface)' : '#0d0e0e'"
              :stroke="selectedNode === node.id ? 'var(--house)' : highlightedNodes.has(node.id) ? 'var(--house-border)' : 'var(--border)'"
              :stroke-width="selectedNode === node.id ? 1.5 : 0.5"
              rx="3"
              class="tree-node-rect"
            />
            <text
              :x="node.x"
              :y="node.y + 4"
              text-anchor="middle"
              :fill="selectedNode === node.id || highlightedNodes.has(node.id) ? 'var(--house)' : 'var(--color-foreground)'"
              font-size="10"
              font-family="var(--font-serif)"
              style="pointer-events: none"
            >
              {{ node.name }}
            </text>
          </g>
        </svg>
      </div>

      <p class="genealogy-hint">Haga clic en un nodo para resaltar sus relaciones familiares</p>
    </section>
  </div>
</template>

<style scoped>
.genealogy-houses {
  display: flex;
  gap: 8px;
  margin-bottom: 20px;
  flex-wrap: wrap;
  align-items: center;
}

.genealogy-houses button {
  border: 1px solid var(--border);
  background: transparent;
  color: var(--color-muted-foreground);
  padding: 6px 14px;
  font: 500 8px/1 var(--font-sans);
  text-transform: uppercase;
  letter-spacing: 0.12em;
  cursor: not-allowed;
  opacity: 0.5;
}

.genealogy-houses button.active {
  border-color: var(--house);
  color: var(--house);
  background: var(--house-surface);
  opacity: 1;
  cursor: default;
}

.genealogy-note {
  font: italic 12px var(--font-serif);
  color: var(--color-muted-foreground);
  margin-left: 8px;
}

.genealogy-controls {
  display: flex;
  gap: 8px;
  margin-bottom: 20px;
}

.genealogy-controls button {
  height: 36px;
  padding: 0 14px;
  border: 1px solid var(--border);
  background: var(--color-background);
  color: var(--color-foreground);
  cursor: pointer;
  font: 500 8px/1 var(--font-sans);
  text-transform: uppercase;
  letter-spacing: 0.1em;
  display: flex;
  align-items: center;
  gap: 6px;
  transition: all 0.2s ease;
}

.genealogy-controls button:hover {
  background: var(--house-surface);
  border-color: var(--house-border);
  color: var(--house);
}

.node-info {
  display: flex;
  align-items: center;
  gap: 16px;
  padding: 14px 20px;
  border: 1px solid var(--house-border);
  background: var(--house-surface);
  margin-bottom: 20px;
}

.node-info-name {
  font: 500 18px var(--font-serif);
  color: var(--house);
}

.node-info-title {
  font: italic 14px var(--font-serif);
  color: var(--color-muted-foreground);
}

.node-info-close {
  margin-left: auto;
  width: 28px;
  height: 28px;
  border: 1px solid var(--border);
  background: transparent;
  color: var(--color-muted-foreground);
  cursor: pointer;
  font-size: 16px;
  display: grid;
  place-items: center;
  transition: all 0.2s ease;
}

.node-info-close:hover {
  border-color: var(--house);
  color: var(--house);
}

.genealogy-tree {
  width: 100%;
  overflow: auto;
  border: 1px solid var(--border);
  background: var(--color-background);
  cursor: grab;
}

.genealogy-tree:active {
  cursor: grabbing;
}

.tree-svg {
  width: 100%;
  min-height: 600px;
  transition: transform 0.1s ease-out;
}

.tree-edge {
  transition: stroke 0.3s ease, opacity 0.3s ease, stroke-width 0.3s ease;
}

.tree-node-rect {
  transition: fill 0.25s ease, stroke 0.25s ease, stroke-width 0.25s ease;
}

.tree-node-rect:hover {
  stroke: var(--house);
  stroke-width: 1;
}

.genealogy-hint {
  margin-top: 16px;
  font: italic 12px var(--font-serif);
  color: var(--color-muted-foreground);
  text-align: center;
}
</style>
