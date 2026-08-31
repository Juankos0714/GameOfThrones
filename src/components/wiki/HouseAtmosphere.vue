<script setup lang="ts">
/**
 * HouseAtmosphere — deterministic CSS atmospheric effects per house.
 * Particles use golden angle distribution (no random).
 * Animation seekable via animation-play-state.
 * Respects prefers-reduced-motion.
 */
import { computed, ref, watch, onMounted, onUnmounted } from 'vue'
import { useUiStore } from '@/stores/ui'

const activeHouse = computed(() => useUiStore.getState().activeHouse)
const previousHouse = ref<string | null>(null)
const prefersReduced = ref(false)

// Cross-fade: track previous house, clear after transition
let fadeTimer: ReturnType<typeof setTimeout> | null = null
watch(activeHouse, (newVal, oldVal) => {
  if (oldVal && newVal !== oldVal) {
    previousHouse.value = oldVal as string
    if (fadeTimer) clearTimeout(fadeTimer)
    fadeTimer = setTimeout(() => { previousHouse.value = null }, 1200)
  }
})

onMounted(() => {
  const mq = window.matchMedia('(prefers-reduced-motion: reduce)')
  prefersReduced.value = mq.matches
  const handler = (e: MediaQueryListEvent) => { prefersReduced.value = e.matches }
  mq.addEventListener('change', handler)
  onUnmounted(() => mq.removeEventListener('change', handler))
})

// Config: type + intensity (0–1). Intensity controls overall opacity via CSS var.
const atmosphereConfig: Record<string, { type: string; intensity: number }> = {
  stark:     { type: 'winter',  intensity: 0.6 },
  lannister: { type: 'gold',    intensity: 0.45 },
  targaryen: { type: 'fire',    intensity: 0.5 },
  baratheon: { type: 'storm',   intensity: 0.45 },
  tyrell:    { type: 'garden',  intensity: 0.35 },
  martell:   { type: 'desert',  intensity: 0.35 },
  greyjoy:   { type: 'sea',     intensity: 0.45 },
  arryn:     { type: 'mountain', intensity: 0.35 },
  tully:     { type: 'river',   intensity: 0.35 },
}

function getConfig(house: string) {
  return atmosphereConfig[house] ?? atmosphereConfig.stark
}

const currentAtmosphere = computed(() => getConfig(activeHouse.value as string))
const previousAtmosphere = computed(() =>
  previousHouse.value ? getConfig(previousHouse.value) : null
)

// Particle counts: deliberately sparse
const particleCount: Record<string, number> = {
  winter: 12,   // escasa, irregular
  gold: 6,      // apenas visible — polvo en luz rasante
  fire: 8,      // brasas contadas
  storm: 14,    // lluvia fina
  garden: 6,    // pétalos ocasionales
  desert: 5,    // polvo mínimo
  sea: 6,       // niebla en capas
  mountain: 5,  // nubes distantes
  river: 5,     // niebla suave
}

const particles = computed(() => {
  const count = particleCount[currentAtmosphere.value.type] ?? 8
  return Array.from({ length: count }, (_, i) => {
    const n = i + 1
    return {
      id: i,
      x: ((n * 137.508) % 100).toFixed(1),
      y: ((n * 61.803) % 100).toFixed(1),
      // Slower delays, longer durations
      delay: (n * 1.2 % 12).toFixed(2),
      duration: (10 + (n * 0.7 % 8)).toFixed(2),
      size: (1 + (n % 3)).toFixed(1),
      opacity: (0.08 + (n % 4) * 0.04).toFixed(2),
    }
  })
})
</script>

<template>
  <!-- Previous house: fading out -->
  <Transition name="atmo-fade">
    <div
      v-if="previousAtmosphere"
      class="house-atmosphere"
      :class="`atmo-${previousAtmosphere.type}`"
      :style="{ '--atmo-intensity': previousAtmosphere.intensity }"
      aria-hidden="true"
    >
      <div class="atmo-bg" />
      <div class="atmo-fog" />
      <div class="atmo-particles" />
      <div class="atmo-vignette" />
    </div>
  </Transition>

  <!-- Current house: fading in -->
  <div
    class="house-atmosphere"
    :class="[
      `atmo-${currentAtmosphere.type}`,
      { 'atmo-reduced': prefersReduced },
    ]"
    :style="{ '--atmo-intensity': currentAtmosphere.intensity }"
    aria-hidden="true"
  >
    <div class="atmo-bg" />
    <div class="atmo-fog" />

    <div class="atmo-particles">
      <span
        v-for="p in particles"
        :key="p.id"
        class="atmo-particle"
        :style="{
          '--px': p.x + '%',
          '--py': p.y + '%',
          '--delay': p.delay + 's',
          '--dur': p.duration + 's',
          '--size': p.size + 'px',
          '--popacity': p.opacity,
        }"
      />
    </div>

    <div class="atmo-vignette" />
  </div>
</template>

<style scoped>
/* ========================================
   BASE
   ======================================== */
.house-atmosphere {
  position: fixed;
  inset: 0;
  z-index: 1;
  pointer-events: none;
  overflow: hidden;
  opacity: var(--atmo-intensity, 0.5);
  transition: opacity 1.2s ease;
}

/* Cross-fade: previous house fades out over 1.2s */
.atmo-fade-leave-active {
  transition: opacity 1.2s ease;
}

.atmo-fade-leave-to {
  opacity: 0 !important;
}

.atmo-bg,
.atmo-fog,
.atmo-particles,
.atmo-vignette {
  position: absolute;
  inset: 0;
}

.atmo-vignette {
  background: radial-gradient(ellipse at 50% 50%, transparent 30%, rgba(0,0,0,0.35) 100%);
}

/* ========================================
   PARTICLES
   ======================================== */
.atmo-particles { position: absolute; inset: 0; }

.atmo-particle {
  position: absolute;
  left: var(--px);
  top: var(--py);
  width: var(--size);
  height: var(--size);
  border-radius: 50%;
  opacity: 0;
  will-change: transform, opacity;
}

/* ========================================
   WINTER — Stark
   Nieve escasa, profunda, irregular.
   Algunas borrosas (profundidad).
   ======================================== */
.atmo-winter .atmo-bg {
  background: linear-gradient(180deg, rgba(12,20,30,0.12) 0%, transparent 55%);
}

.atmo-winter .atmo-fog {
  background:
    radial-gradient(ellipse at 20% 80%, rgba(158,181,192,0.05) 0%, transparent 50%),
    radial-gradient(ellipse at 80% 60%, rgba(158,181,192,0.03) 0%, transparent 40%);
  animation: fog-drift 28s ease-in-out infinite;
}

.atmo-winter .atmo-particle {
  background: rgba(210,220,235, var(--popacity));
  animation: snow-fall var(--dur) linear var(--delay) infinite;
}

/* Profundidad: algunas borrosas */
.atmo-winter .atmo-particle:nth-child(3n) { filter: blur(1.5px); }
.atmo-winter .atmo-particle:nth-child(5n) { filter: blur(3px); }

@keyframes snow-fall {
  0%   { transform: translateY(-10vh) translateX(0); opacity: 0; }
  8%   { opacity: 0.8; }
  92%  { opacity: 0.6; }
  100% { transform: translateY(105vh) translateX(25px); opacity: 0; }
}

@keyframes fog-drift {
  0%, 100% { transform: translateX(0); opacity: 0.5; }
  50%      { transform: translateX(15px); opacity: 0.8; }
}

/* ========================================
   GOLD — Lannister
   Cámara de castillo antiguo, luz rasante.
   Polvo apenas visible en un rayo de luz.
   ======================================== */
.atmo-gold .atmo-bg {
  background:
    radial-gradient(ellipse at 65% 25%, rgba(183,155,94,0.06) 0%, transparent 50%),
    linear-gradient(180deg, rgba(36,20,13,0.08) 0%, transparent 50%);
}

.atmo-gold .atmo-fog {
  background: radial-gradient(ellipse at 60% 35%, rgba(183,155,94,0.03) 0%, transparent 35%);
  animation: gold-light 16s ease-in-out infinite;
}

.atmo-gold .atmo-particle {
  background: rgba(183,155,94, var(--popacity));
  border-radius: 1px;
  animation: dust-float var(--dur) ease-in-out var(--delay) infinite;
}

@keyframes gold-light {
  0%, 100% { opacity: 0.3; transform: scale(1); }
  50%      { opacity: 0.6; transform: scale(1.03); }
}

@keyframes dust-float {
  0%   { transform: translateY(0) translateX(0); opacity: 0; }
  25%  { opacity: 0.7; }
  75%  { opacity: 0.5; }
  100% { transform: translateY(-6vh) translateX(10px); opacity: 0; }
}

/* ========================================
   FIRE — Targaryen
   Fuego antiguo que nunca terminó de apagarse.
   Brasas escasas que ascienden lento.
   Respiración lumínica sutil.
   ======================================== */
.atmo-fire .atmo-bg {
  background:
    radial-gradient(ellipse at 50% 80%, rgba(168,74,64,0.07) 0%, transparent 50%),
    linear-gradient(0deg, rgba(35,13,11,0.1) 0%, transparent 45%);
}

.atmo-fire .atmo-fog {
  background: radial-gradient(ellipse at 50% 70%, rgba(168,74,64,0.04) 0%, transparent 35%);
  animation: ember-glow 14s ease-in-out infinite;
}

.atmo-fire .atmo-particle {
  background: rgba(200,90,40, var(--popacity));
  border-radius: 50%;
  animation: ember-rise var(--dur) ease-out var(--delay) infinite;
}

.atmo-fire .atmo-particle:nth-child(3n) {
  background: rgba(255,140,45, var(--popacity));
  box-shadow: 0 0 3px rgba(255,100,30,0.2);
}

@keyframes ember-glow {
  0%, 100% { opacity: 0.25; }
  50%      { opacity: 0.5; }
}

@keyframes ember-rise {
  0%   { transform: translateY(8vh) translateX(0) scale(1); opacity: 0; }
  12%  { opacity: 0.7; }
  88%  { opacity: 0.4; }
  100% { transform: translateY(-12vh) translateX(15px) scale(0.6); opacity: 0; }
}

/* ========================================
   STORM — Baratheon
   Viento + lluvia fina. Relámpagos raros.
   Movimiento principal: viento + nubes.
   ======================================== */
.atmo-storm .atmo-bg {
  background: linear-gradient(180deg, rgba(21,25,27,0.12) 0%, transparent 55%);
}

.atmo-storm .atmo-fog {
  background: radial-gradient(ellipse at 30% 20%, rgba(178,154,85,0.03) 0%, transparent 40%);
  animation: storm-clouds 22s ease-in-out infinite;
}

.atmo-storm .atmo-particle {
  background: rgba(140,160,180, var(--popacity));
  width: 1px;
  height: 6px;
  border-radius: 0;
  animation: rain-fall var(--dur) linear var(--delay) infinite;
}

@keyframes storm-clouds {
  0%, 100% { transform: translateX(0); opacity: 0.25; }
  50%      { transform: translateX(-25px); opacity: 0.45; }
}

@keyframes rain-fall {
  0%   { transform: translateY(-10vh) translateX(0) rotate(12deg); opacity: 0; }
  8%   { opacity: 0.5; }
  92%  { opacity: 0.35; }
  100% { transform: translateY(105vh) translateX(-15px) rotate(12deg); opacity: 0; }
}

/* ========================================
   GARDEN — Tyrell
   Pétalos ocasionales, brisa suave.
   No caen constantemente.
   ======================================== */
.atmo-garden .atmo-bg {
  background: linear-gradient(180deg, rgba(17,25,15,0.06) 0%, transparent 45%);
}

.atmo-garden .atmo-fog {
  background: radial-gradient(ellipse at 40% 60%, rgba(133,155,107,0.03) 0%, transparent 35%);
  animation: garden-sway 24s ease-in-out infinite;
}

.atmo-garden .atmo-particle {
  background: rgba(133,155,107, var(--popacity));
  border-radius: 50% 0 50% 0;
  width: calc(var(--size) * 1.5);
  height: var(--size);
  animation: petal-drift var(--dur) ease-in-out var(--delay) infinite;
}

@keyframes garden-sway {
  0%, 100% { transform: translateX(0) rotate(0deg); }
  50%      { transform: translateX(8px) rotate(1.5deg); }
}

@keyframes petal-drift {
  0%   { transform: translateY(0) translateX(0) rotate(0deg); opacity: 0; }
  15%  { opacity: 0.6; }
  85%  { opacity: 0.4; }
  100% { transform: translateY(70vh) translateX(30px) rotate(150deg); opacity: 0; }
}

/* ========================================
   DESERT — Martell
   Más lenta que todas. Polvo mínimo.
   Heat haze sutil. No tormenta de arena.
   ======================================== */
.atmo-desert .atmo-bg {
  background:
    radial-gradient(ellipse at 50% 30%, rgba(185,121,79,0.06) 0%, transparent 50%),
    linear-gradient(180deg, rgba(37,21,13,0.07) 0%, transparent 45%);
}

.atmo-desert .atmo-fog {
  background: radial-gradient(ellipse at 50% 50%, rgba(185,121,79,0.025) 0%, transparent 35%);
  animation: heat-shimmer 10s ease-in-out infinite;
}

.atmo-desert .atmo-particle {
  background: rgba(185,121,79, var(--popacity));
  border-radius: 1px;
  animation: dust-drift var(--dur) ease-in-out var(--delay) infinite;
}

@keyframes heat-shimmer {
  0%, 100% { transform: scaleY(1); opacity: 0.2; }
  50%      { transform: scaleY(1.015); opacity: 0.35; }
}

@keyframes dust-drift {
  0%   { transform: translateX(-5vw) translateY(0); opacity: 0; }
  20%  { opacity: 0.4; }
  80%  { opacity: 0.25; }
  100% { transform: translateX(105vw) translateY(-3vh); opacity: 0; }
}

/* ========================================
   SEA — Greyjoy
   Niebla marina pesada. Movimiento horizontal.
   Sensación de hierro y sal.
   ======================================== */
.atmo-sea .atmo-bg {
  background:
    radial-gradient(ellipse at 50% 85%, rgba(118,149,158,0.06) 0%, transparent 50%),
    linear-gradient(0deg, rgba(14,25,28,0.1) 0%, transparent 45%);
}

.atmo-sea .atmo-fog {
  background:
    radial-gradient(ellipse at 30% 70%, rgba(118,149,158,0.04) 0%, transparent 40%),
    radial-gradient(ellipse at 70% 80%, rgba(118,149,158,0.03) 0%, transparent 35%);
  animation: sea-drift 30s ease-in-out infinite;
}

.atmo-sea .atmo-particle {
  background: rgba(118,149,158, var(--popacity));
  border-radius: 1px;
  height: 1px;
  animation: wave-motion var(--dur) ease-in-out var(--delay) infinite;
}

@keyframes sea-drift {
  0%, 100% { transform: translateX(0); opacity: 0.3; }
  50%      { transform: translateX(30px); opacity: 0.55; }
}

@keyframes wave-motion {
  0%   { transform: translateX(-10vw); opacity: 0; }
  20%  { opacity: 0.35; }
  80%  { opacity: 0.2; }
  100% { transform: translateX(110vw); opacity: 0; }
}

/* ========================================
   MOUNTAIN — Arryn
   Nubes distantes, viento, sensación de altura.
   ======================================== */
.atmo-mountain .atmo-bg {
  background: linear-gradient(180deg, rgba(18,26,30,0.08) 0%, transparent 45%);
}

.atmo-mountain .atmo-fog {
  background: radial-gradient(ellipse at 60% 30%, rgba(169,187,195,0.04) 0%, transparent 35%);
  animation: mountain-wind 26s ease-in-out infinite;
}

.atmo-mountain .atmo-particle {
  background: rgba(169,187,195, var(--popacity));
  border-radius: 1px;
  animation: wind-blow var(--dur) ease-in-out var(--delay) infinite;
}

@keyframes mountain-wind {
  0%, 100% { transform: translateX(0) translateY(0); opacity: 0.25; }
  50%      { transform: translateX(40px) translateY(-8px); opacity: 0.45; }
}

@keyframes wind-blow {
  0%   { transform: translateX(-10vw) translateY(0); opacity: 0; }
  15%  { opacity: 0.3; }
  85%  { opacity: 0.2; }
  100% { transform: translateX(110vw) translateY(-15px); opacity: 0; }
}

/* ========================================
   RIVER — Tully
   Niebla suave, ondas, movimiento orgánico.
   ======================================== */
.atmo-river .atmo-bg {
  background: linear-gradient(180deg, rgba(17,26,32,0.06) 0%, transparent 45%);
}

.atmo-river .atmo-fog {
  background: radial-gradient(ellipse at 40% 70%, rgba(119,148,165,0.04) 0%, transparent 35%);
  animation: river-mist 22s ease-in-out infinite;
}

.atmo-river .atmo-particle {
  background: rgba(119,148,165, var(--popacity));
  border-radius: 50%;
  animation: ripple-float var(--dur) ease-in-out var(--delay) infinite;
}

@keyframes river-mist {
  0%, 100% { transform: translateY(0); opacity: 0.25; }
  50%      { transform: translateY(-10px); opacity: 0.4; }
}

@keyframes ripple-float {
  0%   { transform: translateX(0) translateY(0) scale(1); opacity: 0; }
  20%  { opacity: 0.35; transform: scale(1.1); }
  80%  { opacity: 0.2; }
  100% { transform: translateX(20px) translateY(-4vh) scale(0.8); opacity: 0; }
}

/* ========================================
   REDUCED MOTION
   ======================================== */
.atmo-reduced .atmo-particle,
.atmo-reduced .atmo-fog,
.atmo-reduced .atmo-bg {
  animation: none !important;
}

.atmo-reduced .atmo-particle { opacity: 0 !important; }
</style>
