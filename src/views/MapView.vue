<script setup lang="ts">
import { ref } from 'vue'
import { useHouses } from '@/composables'
import { cn } from '@/utils'
import { Motion, AnimatePresence } from 'motion-v'
import { MapPin, ZoomIn, ZoomOut, RotateCcw } from 'lucide-vue-next'

const { houses } = useHouses()

const zoom = ref(1)
const panX = ref(0)
const panY = ref(0)
const isDragging = ref(false)
const lastMouse = ref({ x: 0, y: 0 })

const regions = [
  { id: 'stark', name: 'El Norte', x: 400, y: 80, width: 200, height: 120, desc: 'El reino más extenso, gobernado desde Invernalia por la casa Stark.' },
  { id: 'arryn', name: 'El Valle', x: 420, y: 220, width: 100, height: 80, desc: 'Un bastión montañés protegido por pasos estrechos.' },
  { id: 'tully', name: 'Tierras de los Ríos', x: 320, y: 280, width: 100, height: 60, desc: 'Corazón estratégico entre norte y sur, hogar de los Tully.' },
  { id: 'lannister', name: 'Tierras del Oeste', x: 120, y: 250, width: 120, height: 100, desc: 'La región más rica, controlada desde la Roca Casterly.' },
  { id: 'baratheon', name: 'Tierras de la Tormenta', x: 350, y: 360, width: 120, height: 70, desc: 'Costa tempestuosa regida desde Bastión de Tormentas.' },
  { id: 'tyrell', name: 'El Dominio', x: 200, y: 370, width: 120, height: 80, desc: 'El granero del reino, hogar de los Tyrell.' },
  { id: 'martell', name: 'Dorne', x: 320, y: 440, width: 110, height: 60, desc: 'La única región que resistió la conquista Targaryen.' },
  { id: 'greyjoy', name: 'Islas del Hierro', x: 80, y: 200, width: 80, height: 50, desc: 'Archipiélago severo de señores de la guerra marítima.' },
  { id: 'targaryen', name: 'Rocadragón', x: 500, y: 350, width: 70, height: 50, desc: 'Isla fortaleza ancestral de la dinastía Targaryen.' },
]

const selectedRegion = ref<string | null>(null)
const hoveredRegion = ref<string | null>(null)

function handleMouseDown(e: MouseEvent) {
  isDragging.value = true
  lastMouse.value = { x: e.clientX, y: e.clientY }
}

function handleMouseMove(e: MouseEvent) {
  if (!isDragging.value) return
  const dx = e.clientX - lastMouse.value.x
  const dy = e.clientY - lastMouse.value.y
  panX.value += dx
  panY.value += dy
  lastMouse.value = { x: e.clientX, y: e.clientY }
}

function handleMouseUp() {
  isDragging.value = false
}

function handleWheel(e: WheelEvent) {
  e.preventDefault()
  const delta = e.deltaY > 0 ? -0.1 : 0.1
  zoom.value = Math.max(0.5, Math.min(3, zoom.value + delta))
}

function selectRegion(id: string) {
  selectedRegion.value = selectedRegion.value === id ? null : id
}

function resetView() {
  zoom.value = 1
  panX.value = 0
  panY.value = 0
}

function getHouseForRegion(regionId: string) {
  return houses.value.find(h => h.id === regionId)
}
</script>

<template>
  <div class="map-page">
    <section class="atlas" style="min-height: 60vh">
      <header class="editorial-head">
        <span>Cartografía</span>
        <h2>Mapa de<br />Poniente</h2>
        <p>
          Explore las regiones del reino. Haga clic para seleccionar, arrastre
          para mover, use la rueda para hacer zoom.
        </p>
      </header>

      <!-- Map controls -->
      <div class="map-controls">
        <button @click="zoom = Math.min(3, zoom + 0.2)" aria-label="Acercar">
          <ZoomIn :size="16" />
        </button>
        <button @click="zoom = Math.max(0.5, zoom - 0.2)" aria-label="Alejar">
          <ZoomOut :size="16" />
        </button>
        <button @click="resetView" aria-label="Restablecer vista">
          <RotateCcw :size="14" />
          <span>Reset</span>
        </button>
      </div>

      <!-- Map container -->
      <div
        class="map-container"
        @mousedown="handleMouseDown"
        @mousemove="handleMouseMove"
        @mouseup="handleMouseUp"
        @mouseleave="handleMouseUp"
        @wheel.prevent="handleWheel"
        :class="{ dragging: isDragging }"
      >
        <svg
          :viewBox="'0 0 600 550'"
          :style="{
            transform: `translate(${panX}px, ${panY}px) scale(${zoom})`,
          }"
          :class="cn('map-svg', isDragging && 'dragging')"
        >
          <!-- Map outline -->
          <path
            d="M100,50 Q200,30 300,60 Q400,40 500,80 Q550,120 520,180
               Q540,220 500,260 Q520,300 480,340 Q500,380 460,420
               Q440,460 400,480 Q360,500 320,490 Q280,510 240,490
               Q200,500 160,470 Q120,440 100,400 Q80,360 90,320
               Q70,280 80,240 Q60,200 80,160 Q60,120 100,50 Z"
            fill="none"
            stroke="var(--border)"
            stroke-width="1.5"
            opacity="0.5"
          />

          <!-- Region boxes -->
          <g v-for="region in regions" :key="region.id">
            <!-- Region background -->
            <rect
              :x="region.x"
              :y="region.y"
              :width="region.width"
              :height="region.height"
              :fill="
                selectedRegion === region.id
                  ? `color-mix(in srgb, var(--house) 20%, transparent)`
                  : hoveredRegion === region.id
                    ? `color-mix(in srgb, var(--house) 10%, transparent)`
                    : 'transparent'
              "
              :stroke="selectedRegion === region.id ? 'var(--house)' : 'var(--border)'"
              :stroke-width="selectedRegion === region.id ? 1.5 : 0.5"
              rx="3"
              class="region-rect"
              @click="selectRegion(region.id)"
              @mouseenter="hoveredRegion = region.id"
              @mouseleave="hoveredRegion = null"
            />
            <!-- Region label -->
            <text
              :x="region.x + region.width / 2"
              :y="region.y + region.height / 2 - 4"
              text-anchor="middle"
              dominant-baseline="middle"
              fill="var(--color-foreground)"
              font-size="9"
              font-family="var(--font-sans)"
              letter-spacing="0.1em"
              style="pointer-events: none; text-transform: uppercase"
            >
              {{ region.name }}
            </text>
            <!-- Region house name -->
            <text
              :x="region.x + region.width / 2"
              :y="region.y + region.height / 2 + 10"
              text-anchor="middle"
              fill="var(--house)"
              font-size="7"
              font-family="var(--font-serif)"
              font-style="italic"
              style="pointer-events: none"
            >
              {{ getHouseForRegion(region.id)?.name ?? '' }}
            </text>
            <!-- Marker dot -->
            <circle
              :cx="region.x + region.width / 2"
              :cy="region.y + 12"
              r="3"
              :fill="selectedRegion === region.id ? 'var(--house)' : 'var(--border)'"
              class="marker-dot"
              style="pointer-events: none"
            />
          </g>

          <!-- Compass -->
          <g transform="translate(540, 510)">
            <circle r="20" fill="none" stroke="var(--border)" stroke-width="0.5" opacity="0.6" />
            <text y="-6" text-anchor="middle" fill="var(--house)" font-size="8" font-family="var(--font-sans)" font-weight="600">N</text>
            <line x1="0" y1="-3" x2="0" y2="3" stroke="var(--house)" stroke-width="0.5" />
          </g>
        </svg>

        <!-- Hover tooltip -->
        <AnimatePresence>
          <Motion
            v-if="hoveredRegion && !selectedRegion"
            class="map-tooltip"
            :initial="{ opacity: 0, y: 4 }"
            :animate="{ opacity: 1, y: 0 }"
            :exit="{ opacity: 0 }"
            :transition="{ duration: 0.15 }"
          >
            {{ regions.find(r => r.id === hoveredRegion)?.name }}
          </Motion>
        </AnimatePresence>
      </div>

      <!-- Region detail panel -->
      <AnimatePresence>
        <Motion
          v-if="selectedRegion"
          key="region-panel"
          class="region-panel"
          :initial="{ opacity: 0, y: 12 }"
          :animate="{ opacity: 1, y: 0 }"
          :exit="{ opacity: 0, y: 8 }"
          :transition="{ duration: 0.35, ease: [0.25, 0.1, 0.25, 1] }"
        >
          <div class="region-panel-header">
            <h3>Casa {{ getHouseForRegion(selectedRegion)?.name }}</h3>
            <button @click="selectedRegion = null" class="region-close" aria-label="Cerrar panel">×</button>
          </div>
          <p class="region-region">{{ getHouseForRegion(selectedRegion)?.region }}</p>
          <p class="region-desc">{{ regions.find(r => r.id === selectedRegion)?.desc }}</p>
          <div class="region-meta">
            <span>Sede: {{ getHouseForRegion(selectedRegion)?.seat }}</span>
            <span>Lema: "{{ getHouseForRegion(selectedRegion)?.motto }}"</span>
          </div>
        </Motion>
      </AnimatePresence>
    </section>
  </div>
</template>

<style scoped>
.map-controls {
  display: flex;
  gap: 8px;
  margin-bottom: 20px;
}

.map-controls button {
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

.map-controls button:hover {
  background: var(--house-surface);
  border-color: var(--house-border);
  color: var(--house);
}

.map-container {
  width: 100%;
  height: 500px;
  border: 1px solid var(--border);
  overflow: hidden;
  position: relative;
  background: var(--color-background);
  cursor: grab;
}

.map-container.dragging {
  cursor: grabbing;
}

.map-svg {
  width: 100%;
  height: 100%;
  transition: transform 0.35s cubic-bezier(0.25, 0.1, 0.25, 1);
  will-change: transform;
}

.map-svg.dragging {
  transition: none;
}

.region-rect {
  transition: fill 0.3s ease, stroke 0.3s ease, stroke-width 0.3s ease;
  cursor: pointer;
}

.region-rect:hover {
  fill: color-mix(in srgb, var(--house) 12%, transparent);
  stroke: var(--house);
  stroke-width: 1;
}

.marker-dot {
  transition: fill 0.25s ease;
}

.map-tooltip {
  position: absolute;
  top: 16px;
  left: 16px;
  padding: 8px 14px;
  background: rgb(10 11 11 / 0.95);
  border: 1px solid var(--border);
  font: 500 8px/1 var(--font-sans);
  text-transform: uppercase;
  letter-spacing: 0.12em;
  color: var(--house);
  pointer-events: none;
}

.region-panel {
  margin-top: 30px;
  padding: 30px;
  border: 1px solid var(--border);
  background: color-mix(in srgb, var(--house-deep) 60%, #0b0c0c);
}

.region-panel-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 8px;
}

.region-panel-header h3 {
  font: 500 32px var(--font-serif);
  margin: 0;
}

.region-close {
  width: 32px;
  height: 32px;
  border: 1px solid var(--border);
  background: transparent;
  color: var(--color-muted-foreground);
  cursor: pointer;
  font-size: 18px;
  display: grid;
  place-items: center;
  transition: all 0.2s ease;
}

.region-close:hover {
  border-color: var(--house);
  color: var(--house);
}

.region-region {
  font: 600 10px/1 var(--font-sans);
  text-transform: uppercase;
  letter-spacing: 0.12em;
  color: var(--house);
  margin: 4px 0 16px;
}

.region-desc {
  color: var(--color-muted-foreground);
  font: 14px/1.7 var(--font-serif);
  margin: 0 0 16px;
}

.region-meta {
  display: flex;
  gap: 24px;
  flex-wrap: wrap;
}

.region-meta span {
  font: 500 8px/1 var(--font-sans);
  text-transform: uppercase;
  letter-spacing: 0.1em;
  color: var(--color-muted-foreground);
}

@media (max-width: 600px) {
  .map-container {
    height: 350px;
  }

  .region-meta {
    flex-direction: column;
    gap: 8px;
  }
}
</style>
