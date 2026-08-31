<script setup lang="ts">
import { ref } from 'vue'
import { Motion } from 'motion-v'
import { Swords } from 'lucide-vue-next'

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
      <p class="label">Batallas</p>
      <h2>
        Sangre y<br />
        consecuencias
      </h2>

      <div class="battles-grid">
        <Motion
          v-for="battle in battles"
          :key="battle.id"
          as="article"
          class="battle-card"
          :initial="{ opacity: 0, y: 20 }"
          :whileInView="{ opacity: 1, y: 0 }"
          :whileHover="{ y: -3 }"
          :transition="{ duration: 0.5 }"
          :viewport="{ once: true, margin: '-50px' }"
        >
          <div class="battle-header">
            <Swords />
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
      </div>
    </section>
  </div>
</template>

<style scoped>
.battles-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(380px, 1fr));
  gap: 24px;
}

.battle-card {
  border: 1px solid var(--border);
  padding: 30px;
  transition: background 0.2s;
}

.battle-card:hover {
  background: color-mix(in srgb, var(--house) 5%, transparent);
}

.battle-header {
  display: flex;
  align-items: center;
  gap: 16px;
  margin-bottom: 16px;
}

.battle-header svg {
  width: 28px;
  color: var(--house);
  flex-shrink: 0;
}

.battle-header h3 {
  font: 500 24px var(--font-serif);
  margin: 0;
}

.battle-header time {
  font-size: 9px;
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
}

.combatant-tag {
  font-size: 7px;
  text-transform: uppercase;
  letter-spacing: 0.12em;
  padding: 5px 10px;
  border: 1px solid var(--border);
  color: var(--color-muted-foreground);
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
