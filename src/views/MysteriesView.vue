<script setup lang="ts">
import { ref } from 'vue'
import { Motion } from 'motion-v'
import SectionReveal from '@/components/ui/SectionReveal.vue'

const mysteries = ref([
  {
    id: '1',
    title: 'La identidad de Jon Nieve',
    description: '¿Es Jon Nieve realmente el hijo legítimo de Rhaegar Targaryen y Lyanna Stark?',
    evidence: 'El visionado de Bran, las palabras de Ned, el Anillo de Dragón.',
    interpretation: 'La Pantera de la Niebla sugiere que Jon es el heredero legítimo del Trono de Hierro.',
    status: 'canon',
  },
  {
    id: '2',
    title: 'La profecía del Príncipe Prometido',
    description: '¿Quién es el Prínce Prometido de la profecía? ¿Jon o Daenerys?',
    evidence: 'La canción de hielo y fuego, las palabras de Rhaegar.',
    interpretation: 'La profecía puede no referirse a una sola persona sino a la unión de sangre de hielo y fuego.',
    status: 'interpretation',
  },
  {
    id: '3',
    title: 'Los otros y su origen',
    description: '¿Qué son los Caminantes Blancos y quién los creó?',
    evidence: 'Los sueños de Bran, los Mitos del Norte.',
    interpretation: 'Pueden ser una creación de los Primeros Hombres o de los Hijos del Bosque como arma de defensa.',
    status: 'theory',
  },
  {
    id: '4',
    title: 'El cuervo de tres ojos',
    description: '¿Qué es el cuervo de tres ojos y qué relación tiene con Bran?',
    evidence: 'Las visiones de Bran, los Mitos del Norte.',
    interpretation: 'El cuervo es un farcedor que ha transferido sus poderes a Bran para preservar la memoria del mundo.',
    status: 'evidence',
  },
  {
    id: '5',
    title: 'El dragón de hielo',
    description: '¿Existen dragones de hielo bajo el Hielo Durante?',
    evidence: 'El Anillo de Dragón de Jon, los sueños de Dany.',
    interpretation: 'Una tercera especie de dragón que podría haber sido domesticada en el extremo norte.',
    status: 'unresolved',
  },
])

const statusColors: Record<string, string> = {
  canon: 'var(--color-success)',
  evidence: 'var(--color-warning)',
  interpretation: 'var(--color-info)',
  theory: 'var(--color-danger)',
  unresolved: '#8a5a8a',
}

const statusLabels: Record<string, string> = {
  canon: 'Canon',
  evidence: 'Evidencia',
  interpretation: 'Interpretación',
  theory: 'Teoría',
  unresolved: 'Sin resolver',
}
</script>

<template>
  <div>
    <section class="forbidden" style="min-height: auto; padding-top: 140px; padding-bottom: 140px">
      <div class="forbidden-mark">?</div>
      <div>
        <p class="label">Cámara restringida</p>
        <h2>
          Lo que los maestres<br />
          <em>no pueden probar.</em>
        </h2>
        <p>
          Profecías, identidades veladas y relatos contradictorios. Cada ficha
          separa documento, evidencia, interpretación y teoría.
        </p>
        <div class="evidence-key">
          <span>Canon</span>
          <span>Evidencia</span>
          <span>Interpretación</span>
          <span>Teoría</span>
          <span>Sin resolver</span>
        </div>
      </div>
    </section>

    <section class="mysteries-list">
      <SectionReveal
        v-for="(mystery, i) in mysteries"
        :key="mystery.id"
        :delay="i * 0.08"
      >
        <Motion
          as="article"
          class="mystery-card"
          :whileHover="{ y: -2 }"
          :transition="{ duration: 0.25, ease: [0.25, 0.1, 0.25, 1] }"
        >
          <div class="mystery-header">
            <h3>{{ mystery.title }}</h3>
            <span
              class="mystery-status"
              :style="{
                color: statusColors[mystery.status],
                borderColor: statusColors[mystery.status],
              }"
            >
              {{ statusLabels[mystery.status] }}
            </span>
          </div>
          <p class="mystery-desc">{{ mystery.description }}</p>
          <div class="mystery-section">
            <h4>Evidencia</h4>
            <p>{{ mystery.evidence }}</p>
          </div>
          <div class="mystery-section">
            <h4>Interpretación</h4>
            <p>{{ mystery.interpretation }}</p>
          </div>
        </Motion>
      </SectionReveal>
    </section>
  </div>
</template>

<style scoped>
.mysteries-list {
  padding: 0 clamp(24px, 7vw, 110px) 140px;
  display: grid;
  gap: 20px;
}

.mystery-card {
  border: 1px solid var(--border);
  padding: 36px;
  background: color-mix(in srgb, var(--house-deep) 35%, var(--color-background));
  transition: border-color 0.25s ease;
}

.mystery-card:hover {
  border-color: var(--house-border);
}

.mystery-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 14px;
}

.mystery-header h3 {
  font: 500 26px var(--font-serif);
  margin: 0;
}

.mystery-status {
  font: 500 7px/1 var(--font-sans);
  text-transform: uppercase;
  letter-spacing: 0.12em;
  padding: 6px 12px;
  border: 1px solid;
  flex-shrink: 0;
}

.mystery-desc {
  font: italic 15px var(--font-serif);
  color: var(--color-muted-foreground);
  margin: 0 0 22px;
}

.mystery-section {
  margin-top: 14px;
}

.mystery-section h4 {
  font: 600 8px/1 var(--font-sans);
  text-transform: uppercase;
  letter-spacing: 0.15em;
  color: var(--house);
  margin: 0 0 8px;
}

.mystery-section p {
  font-size: 12px;
  line-height: 1.8;
  color: var(--color-muted-foreground);
  margin: 0;
}

@media (max-width: 600px) {
  .mystery-card {
    padding: 22px;
  }

  .mystery-header {
    flex-direction: column;
    align-items: flex-start;
    gap: 10px;
  }
}
</style>
