<script setup lang="ts">
import { ref } from 'vue'
import { Motion } from 'motion-v'
import { Swords } from 'lucide-vue-next'
import SectionReveal from '@/components/ui/SectionReveal.vue'

const battles = ref([
  {
    id: '1',
    name: 'Batalla del Aguasnegras',
    date: '298 d.C.',
    combatants: ['Stark', 'Tully', 'Greyjoy'],
    description: 'La batalla decisiva que puso fin a la rebelión de Greyjoy contra el Trono de Hierro.',
    outcome: 'Victoria de la coalición norteña',
  },
  {
    id: '2',
    name: 'Batalla del Bosque Real',
    date: '299 d.C.',
    combatants: ['Baratheon', 'Lannister'],
    description: 'Stannis asedia Desembarco del Rey. La intervención de los Tyrell cambia el curso de la guerra.',
    outcome: 'Victoria Lannister-Tyrell',
  },
  {
    id: '3',
    name: 'La Boda Roja',
    date: '299 d.C.',
    combatants: ['Frey', 'Bolton', 'Stark'],
    description: 'La traición más famosa de Poniente. Robb Stark y su ejército son masacrados en una boda.',
    outcome: 'Destrucción de la casa Stark',
  },
  {
    id: '4',
    name: 'Batalla de los Campamentos',
    date: '300 d.C.',
    combatants: ['Targaryen', 'Lannister'],
    description: 'Daenerys libera Meereen y derrota a los Amos de la Guerra.',
    outcome: 'Victoria Targaryen',
  },
  {
    id: '5',
    name: 'Batalla del Puente Rojo',
    date: '300 d.C.',
    combatants: ['Stark', 'Bolton'],
    description: 'Jon Nieve lidera el asalto contra los Boltons para recuperar Invernalia.',
    outcome: 'Victoria Stark',
  },
])
</script>

<template>
  <div class="battles-page">
    <section class="chronology" style="min-height: 60vh">
      <SectionReveal>
        <p class="label">Batallas</p>
        <h2>
          Sangre y<br />
          consecuencias
        </h2>
      </SectionReveal>

      <div class="battles-grid">
        <SectionReveal
          v-for="(battle, i) in battles"
          :key="battle.id"
          :delay="i * 0.08"
        >
          <Motion
            as="article"
            class="battle-card"
            :whileHover="{ y: -3 }"
            :transition="{ duration: 0.25, ease: [0.25, 0.1, 0.25, 1] }"
          >
            <div class="battle-header">
              <div class="battle-icon">
                <Swords :size="24" />
              </div>
              <div>
                <h3>{{ battle.name }}</h3>
                <time>{{ battle.date }}</time>
              </div>
            </div>
            <p class="battle-desc">{{ battle.description }}</p>
            <div class="battle-combatants">
              <span v-for="c in battle.combatants" :key="c" class="combatant-tag">
                {{ c }}
              </span>
            </div>
            <div class="battle-outcome">
              <span class="outcome-label">Resultado:</span>
              <span>{{ battle.outcome }}</span>
            </div>
          </Motion>
        </SectionReveal>
      </div>
    </section>
  </div>
</template>

<style scoped>
.battles-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(380px, 1fr));
  gap: 20px;
}

.battle-card {
  border: 1px solid var(--border);
  padding: 28px;
  transition: border-color 0.25s ease;
}

.battle-card:hover {
  border-color: var(--house-border);
  background: var(--house-surface);
}

.battle-header {
  display: flex;
  align-items: center;
  gap: 16px;
  margin-bottom: 16px;
}

.battle-icon {
  width: 48px;
  height: 48px;
  border: 1px solid var(--border);
  display: grid;
  place-items: center;
  color: var(--house);
  flex-shrink: 0;
  transition: border-color 0.25s ease, transform 0.25s ease;
}

.battle-card:hover .battle-icon {
  border-color: var(--house-border);
  transform: scale(1.05);
}

.battle-header h3 {
  font: 500 24px var(--font-serif);
  margin: 0;
}

.battle-header time {
  font: 600 8px/1 var(--font-sans);
  color: var(--house);
}

.battle-desc {
  font-size: 12px;
  line-height: 1.8;
  color: var(--color-muted-foreground);
  margin: 0 0 16px;
}

.battle-combatants {
  display: flex;
  gap: 6px;
  margin-bottom: 16px;
  flex-wrap: wrap;
}

.combatant-tag {
  font: 500 7px/1 var(--font-sans);
  text-transform: uppercase;
  letter-spacing: 0.12em;
  padding: 5px 10px;
  border: 1px solid var(--border);
  color: var(--color-muted-foreground);
  transition: border-color 0.2s ease, color 0.2s ease;
}

.battle-card:hover .combatant-tag {
  border-color: var(--house-border);
}

.battle-outcome {
  font-size: 10px;
  color: var(--color-muted-foreground);
  border-top: 1px solid var(--border);
  padding-top: 12px;
}

.outcome-label {
  color: var(--house);
  font-weight: 600;
}

@media (max-width: 600px) {
  .battles-grid {
    grid-template-columns: 1fr;
  }
}
</style>
