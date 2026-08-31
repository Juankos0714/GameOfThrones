<script setup lang="ts">
import { ref } from 'vue'
import { useHouses } from '@/composables'
import { cn } from '@/utils'
import { Motion, AnimatePresence } from 'motion-v'
import { MapPin } from 'lucide-vue-next'

const { houses } = useHouses()

const zoom = ref(1)
const panX = ref(0)
const panY = ref(0)
const isDragging = ref(false)
const lastMouse = ref({ x: 0, y: 0 })

const regions = [
  { id: 'stark', name: 'El Norte', x: 400, y: 80, width: 200, height: 120 },
  { id: 'arryn', name: 'El Valle', x: 420, y: 220, width: 100, height: 80 },
  { id: 'tully', name: 'Tierras de los Ríos', x: 320, y: 280, width: 100, height: 60 },
  { id: 'lannister', name: 'Tierras del Oeste', x: 120, y: 250, width: 120, height: 100 },
  { id: 'baratheon', name: 'Tierras de la Tormenta', x: 350, y: 360, width: 120, height: 70 },
  { id: 'tyrell', name: 'El Dominio', x: 200, y: 370, width: 120, height: 80 },
  { id: 'martell', name: 'Dorne', x: 320, y: 440, width: 110, height: 60 },
  { id: 'greyjoy', name: 'Islas del Hierro', x: 80, y: 200, width: 80, height: 50 },
  { id: 'targaryen', name: 'Rocadragón', x: 500, y: 350, width: 70, height: 50 },
]

const selectedRegion = ref<string | null>(null)

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

      <div class="map-controls">
        <Motion as="button" :whileTap="{ scale: 0.92 }" @click="zoom = Math.min(3, zoom + 0.2)">+</Motion>
        <Motion as="button" :whileTap="{ scale: 0.92 }" @click="zoom = Math.max(0.5, zoom - 0.2)">−</Motion>
        <Motion as="button" :whileTap="{ scale: 0.92 }" :whileHover="{ backgroundColor: 'color-mix(in srgb, var(--house) 15%, var(--color-background))' }" @click="resetView">Reset</Motion>
      </div>

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
            opacity="0.6"
          />

          <!-- Region boxes -->
          <g v-for="region in regions" :key="region.id">
            <rect
              :x="region.x"
              :y="region.y"
              :width="region.width"
              :height="region.height"
              :fill="
                selectedRegion === region.id
                  ? `color-mix(in srgb, var(--house) 25%, transparent)`
                  : 'transparent'
              "
              :stroke="selectedRegion === region.id ? 'var(--house)' : 'var(--border)'"
              stroke-width="1"
              rx="2"
              class="region-rect"
              @click="selectRegion(region.id)"
              style="cursor: pointer"
            />
            <text
              :x="region.x + region.width / 2"
              :y="region.y + region.height / 2"
              text-anchor="middle"
              dominant-baseline="middle"
              fill="var(--color-foreground)"
              font-size="9"
              letter-spacing="0.1em"
              text-transform="uppercase"
              style="pointer-events: none; text-transform: uppercase"
            >
              {{ region.name }}
            </text>
          </g>

          <!-- Compass -->
          <g transform="translate(520, 480)">
            <circle r="25" fill="none" stroke="var(--border)" stroke-width="0.5" />
            <text y="-10" text-anchor="middle" fill="var(--house)" font-size="10" font-weight="600">N</text>
            <line x1="0" y1="-7" x2="0" y2="7" stroke="var(--house)" stroke-width="0.5" />
          </g>
        </svg>
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
          <h3>Casa {{ houses.find(h => h.id === selectedRegion)?.name }}</h3>
          <p>{{ houses.find(h => h.id === selectedRegion)?.region }}</p>
          <p class="region-desc">{{ houses.find(h => h.id === selectedRegion)?.seat }}</p>
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

.map-controls button:hover {
  background: color-mix(in srgb, var(--house) 15%, var(--color-background));
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
  transition: fill 0.3s ease, stroke 0.3s ease, opacity 0.3s ease;
  cursor: pointer;
}

.region-rect:hover {
  fill: color-mix(in srgb, var(--house) 15%, transparent);
  stroke: var(--house);
}

.region-panel {
  margin-top: 30px;
  padding: 30px;
  border: 1px solid var(--border);
  background: color-mix(in srgb, var(--house-deep) 68%, #0b0c0c);
}

.region-panel h3 {
  font: 500 32px var(--font-serif);
  margin: 0 0 8px;
}

.region-panel p {
  font-size: 10px;
  text-transform: uppercase;
  letter-spacing: 0.12em;
  color: var(--house);
  margin: 4px 0;
}

.region-desc {
  color: var(--color-muted-foreground) !important;
  text-transform: none !important;
  font: 14px var(--font-serif) !important;
}
</style>
