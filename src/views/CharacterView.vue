<script setup lang="ts">
import { computed } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useHouses } from '@/composables'
import InfoBox from '@/components/wiki/InfoBox.vue'
import CrossLink from '@/components/wiki/CrossLink.vue'
import SectionReveal from '@/components/ui/SectionReveal.vue'
import { Motion } from 'motion-v'
import { Users } from 'lucide-vue-next'

const route = useRoute()
const router = useRouter()
const { houses } = useHouses()

const character = computed(() => {
  const slug = route.params.slug as string
  for (const house of houses.value) {
    const member = house.members.find(
      (m) => m.name.toLowerCase().replace(/\s+/g, '-') === slug
    )
    if (member) return { ...member, house }
  }
  return null
})

const infoboxRows = computed(() => {
  if (!character.value) return []
  return [
    { label: 'Casa', value: character.value.house.name, link: `/houses/${character.value.house.slug}` },
    { label: 'Región', value: character.value.house.region },
    { label: 'Título', value: character.value.title },
    { label: 'Estado', value: character.value.status === 'alive' ? 'Vivo' : character.value.status === 'deceased' ? 'Fallecido' : 'Desconocido' },
    { label: 'Lema', value: `\"${character.value.house.motto}\"` },
    { label: 'Sede', value: character.value.house.seat },
  ]
})

const statusLabels: Record<string, string> = {
  alive: 'Vivo',
  deceased: 'Fallecido',
  unknown: 'Desconocido',
}

const statusColors: Record<string, string> = {
  alive: 'var(--color-success)',
  deceased: 'var(--color-danger)',
  unknown: 'var(--color-warning)',
}

document.title = character.value
  ? `${character.value.name} — Archivo de Poniente`
  : 'Personaje — Archivo de Poniente'
</script>

<template>
  <div v-if="character" class="character-detail">
    <section class="character-hero">
      <Motion
        class="character-portrait"
        :initial="{ opacity: 0, scale: 0.9 }"
        :animate="{ opacity: 1, scale: 1 }"
        :transition="{ duration: 0.6, delay: 0.2, ease: [0.25, 0.1, 0.25, 1] }"
      >
        <Users />
      </Motion>
      <div class="character-meta">
        <Motion
          :initial="{ opacity: 0, y: 15 }"
          :animate="{ opacity: 1, y: 0 }"
          :transition="{ duration: 0.6, delay: 0.3 }"
        >
          <RouterLink :to="`/houses/${character.house.slug}`" class="house-link">
            Casa {{ character.house.name }}
          </RouterLink>
        </Motion>
        <Motion
          :initial="{ opacity: 0, y: 20 }"
          :animate="{ opacity: 1, y: 0 }"
          :transition="{ duration: 0.7, delay: 0.4 }"
        >
          <h1>{{ character.name }}</h1>
        </Motion>
        <Motion
          :initial="{ opacity: 0 }"
          :animate="{ opacity: 1 }"
          :transition="{ duration: 0.5, delay: 0.55 }"
        >
          <p class="character-title-detail">{{ character.title }}</p>
        </Motion>
        <Motion
          :initial="{ opacity: 0, y: 10 }"
          :animate="{ opacity: 1, y: 0 }"
          :transition="{ duration: 0.5, delay: 0.65 }"
        >
          <div
            class="character-status-badge"
            :style="{
              color: statusColors[character.status],
              borderColor: statusColors[character.status],
            }"
          >
            {{ statusLabels[character.status] }}
          </div>
        </Motion>
      </div>
    </section>

    <div class="character-layout">
      <div class="character-body">
        <SectionReveal>
          <div class="detail-section">
            <h3>Afiliación</h3>
            <p>
              <RouterLink :to="`/houses/${character.house.slug}`">
                Casa {{ character.house.name }}
              </RouterLink>
              — {{ character.house.region }}
            </p>
          </div>
        </SectionReveal>
        <SectionReveal :delay="0.1">
          <div class="detail-section">
            <h3>Lema de la casa</h3>
            <p class="motto">"{{ character.house.motto }}"</p>
          </div>
        </SectionReveal>
        <SectionReveal :delay="0.2">
          <div class="detail-section">
            <h3>Sede</h3>
            <p>{{ character.house.seat }}</p>
          </div>
        </SectionReveal>
      </div>

      <!-- Sidebar InfoBox -->
      <aside class="character-sidebar">
        <InfoBox :title="character.name" :rows="infoboxRows">
          <template #footer>
            <RouterLink to="/characters" class="back-link">
              ← Volver a Personajes
            </RouterLink>
          </template>
        </InfoBox>
      </aside>
    </div>
  </div>

  <div v-else style="padding: 200px 40px; text-align: center; color: var(--color-muted-foreground);">
    <p>Personaje no encontrado.</p>
    <button
      @click="router.push('/characters')"
      style="margin-top: 16px; border: 0; border-bottom: 1px solid var(--house); background: none; color: var(--color-foreground); cursor: pointer; text-transform: uppercase; letter-spacing: 0.14em; font-size: 8px;"
    >
      Volver a Personajes
    </button>
  </div>
</template>

<style scoped>
.character-hero {
  padding: 140px clamp(24px, 7vw, 110px) 80px;
  display: grid;
  grid-template-columns: auto 1fr;
  gap: 60px;
  align-items: center;
  border-bottom: 1px solid var(--border);
}

.character-portrait {
  width: 180px;
  height: 180px;
  border-radius: 50%;
  border: 1px solid var(--border);
  display: grid;
  place-items: center;
  color: var(--house);
  background: color-mix(in srgb, var(--house-deep) 60%, #0b0c0c);
  transition: border-color 0.25s ease, transform 0.3s ease;
}

.character-portrait:hover {
  border-color: var(--house-border);
  transform: scale(1.03);
}

.character-portrait svg {
  width: 60px;
}

.house-link {
  color: var(--house);
  text-decoration: none;
  font: 700 8px/1 var(--font-sans);
  text-transform: uppercase;
  letter-spacing: 0.21em;
  transition: opacity 0.2s ease;
}

.house-link:hover {
  opacity: 0.7;
  text-decoration: underline;
}

.character-meta h1 {
  font: 500 clamp(50px, 7vw, 100px) / 0.8 var(--font-serif);
  margin: 12px 0;
  letter-spacing: -0.05em;
}

.character-title-detail {
  font: italic 20px var(--font-serif);
  color: var(--color-muted-foreground);
}

.character-status-badge {
  display: inline-block;
  margin-top: 16px;
  font: 500 8px/1 var(--font-sans);
  text-transform: uppercase;
  letter-spacing: 0.12em;
  padding: 8px 14px;
  border: 1px solid;
}

.character-layout {
  display: grid;
  grid-template-columns: 1fr 340px;
}

.character-body {
  padding: 80px clamp(24px, 7vw, 110px);
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 50px;
  border-bottom: 1px solid var(--border);
}

.character-sidebar {
  border-left: 1px solid var(--border);
  padding: 40px 30px;
  position: sticky;
  top: calc(var(--header-height) + 20px);
  align-self: start;
  max-height: calc(100vh - var(--header-height) - 40px);
  overflow-y: auto;
}

.detail-section h3 {
  font: 600 8px/1 var(--font-sans);
  text-transform: uppercase;
  letter-spacing: 0.15em;
  color: var(--house);
  margin: 0 0 12px;
}

.detail-section p {
  font: 18px/1.6 var(--font-serif);
  margin: 0;
  color: var(--color-muted-foreground);
}

.detail-section p a {
  color: var(--house);
  text-decoration: none;
  transition: opacity 0.2s ease;
}

.detail-section p a:hover {
  opacity: 0.7;
  text-decoration: underline;
}

.motto {
  font-style: italic;
}

.back-link {
  display: block;
  text-align: center;
  color: var(--house);
  text-decoration: none;
  font: 600 8px/1 var(--font-sans);
  text-transform: uppercase;
  letter-spacing: 0.14em;
  padding: 12px 0;
  transition: opacity 0.2s ease;
}

.back-link:hover {
  opacity: 0.7;
  text-decoration: underline;
}

@media (max-width: 1100px) {
  .character-layout {
    grid-template-columns: 1fr;
  }

  .character-sidebar {
    border-left: none;
    border-top: 1px solid var(--border);
    position: static;
    max-height: none;
    padding: 40px clamp(24px, 7vw, 110px);
  }
}

@media (max-width: 900px) {
  .character-hero {
    grid-template-columns: 1fr;
    text-align: center;
  }

  .character-portrait {
    margin: 0 auto;
  }

  .character-body {
    grid-template-columns: 1fr;
    gap: 35px;
  }
}
</style>
