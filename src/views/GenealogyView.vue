<script setup lang="ts">
import { ref } from 'vue'
import { useHouses } from '@/composables'

const { houses, selectHouse, selectedHouse } = useHouses()

const zoom = ref(1)
const panX = ref(0)
const panY = ref(0)

const treeNodes = [
  { id: 'root', name: 'Aegon I', x: 400, y: 50, parent: null },
  { id: 'aenys', name: 'Aenys I', x: 300, y: 150, parent: 'root' },
  { id: 'maegor', name: 'Maegor I', x: 500, y: 150, parent: 'root' },
  { id: 'jaehaerys', name: 'Jaehaerys I', x: 300, y: 250, parent: 'aenys' },
  { id: 'viserys', name: 'Viserys I', x: 200, y: 350, parent: 'jaehaerys' },
  { id: 'aegon-ii', name: 'Aegon II', x: 100, y: 450, parent: 'viserys' },
  { id: 'aegon-iii', name: 'Aegon III', x: 300, y: 450, parent: 'viserys' },
  { id: 'daeron', name: 'Daeron I', x: 250, y: 550, parent: 'aegon-iii' },
  { id: 'baelor', name: 'Baelor I', x: 350, y: 550, parent: 'aegon-iii' },
  { id: 'aerys', name: 'Aerys II', x: 200, y: 650, parent: 'daeron' },
  { id: 'rhaegar', name: 'Rhaegar', x: 150, y: 750, parent: 'aerys' },
  { id: 'viserys-iii', name: 'Viserys III', x: 250, y: 750, parent: 'aerys' },
  { id: 'daenerys', name: 'Daenerys', x: 150, y: 850, parent: 'rhaegar' },
  { id: 'aegon-vi', name: 'Aegon VI (Jon)', x: 300, y: 850, parent: 'rhaegar' },
]

const edges = treeNodes
  .filter((n) => n.parent)
  .map((n) => {
    const parent = treeNodes.find((p) => p.id === n.parent)!
    return { from: parent, to: n }
  })

function resetView() {
  zoom.value = 1
  panX.value = 0
  panY.value = 0
}
</script>

<template>
  <div class="genealogy-page">
    <section class="chronology" style="min-height: 60vh">
      <p class="label">Genealogía</p>
      <h2>
        La sangre<br />
        recuerda
      </h2>

      <div class="genealogy-controls">
        <button @click="zoom = Math.min(2, zoom + 0.2)">+</button>
        <button @click="zoom = Math.max(0.5, zoom - 0.2)">−</button>
        <button @click="resetView">Reset</button>
      </div>

      <div class="genealogy-tree">
        <svg
          viewBox="0 0 600 900"
          :style="{ transform: `scale(${zoom}) translate(${panX}px, ${panY}px)` }"
          class="tree-svg"
        >
          <!-- Edges -->
          <line
            v-for="(edge, i) in edges"
            :key="i"
            :x1="edge.from.x"
            :y1="edge.from.y + 20"
            :x2="edge.to.x"
            :y2="edge.to.y - 20"
            stroke="var(--house)"
            stroke-width="1"
            opacity="0.6"
          />

          <!-- Nodes -->
          <g v-for="node in treeNodes" :key="node.id">
            <rect
              :x="node.x - 55"
              :y="node.y - 16"
              width="110"
              height="32"
              fill="#0d0e0e"
              stroke="var(--border)"
              rx="2"
            />
            <text
              :x="node.x"
              :y="node.y + 4"
              text-anchor="middle"
              fill="var(--color-foreground)"
              font-size="10"
              font-family="var(--font-serif)"
            >
              {{ node.name }}
            </text>
          </g>
        </svg>
      </div>
    </section>
  </div>
</template>

<style scoped>
.genealogy-controls {
  display: flex;
  gap: 8px;
  margin-bottom: 20px;
}

.genealogy-controls button {
  width: 36px;
  height: 36px;
  border: 1px solid var(--border);
  background: var(--color-background);
  color: var(--color-foreground);
  cursor: pointer;
  font-size: 16px;
  display: grid;
  place-items: center;
  transition: background 0.2s;
}

.genealogy-controls button:hover {
  background: color-mix(in srgb, var(--house) 15%, var(--color-background));
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
</style>
