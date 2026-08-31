<script setup lang="ts">
import { computed } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useHouses } from '@/composables'
import InfoBox from '@/components/wiki/InfoBox.vue'
import CrossLink from '@/components/wiki/CrossLink.vue'
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
    { label: 'Lema', value: `"${character.value.house.motto}"` },
    { label: 'Sede', value: character.value.house.seat },
  ]
})

const statusLabels: Record<string, string> = {
  alive: 'Vivo',
  deceased: 'Fallecido',
  unknown: 'Desconocido',
}

document.title = character.value
  ? `${character.value.name} — Archivo de Poniente`
  : 'Personaje — Archivo de Poniente'
</script>

<template>
  <div v-if="character" class="character-detail">
    <section class="character-hero">
      <div class="character-portrait">
        <Users />
      </div>
      <div class="character-meta">
        <RouterLink :to="`/houses/${character.house.slug}`" class="house-link">
          Casa {{ character.house.name }}
        </RouterLink>
        <h1>{{ character.name }}</h1>
        <p class="character-title-detail">{{ character.title }}</p>
        <div class="character-status-badge" :class="`status-${character.status}`">
          {{ statusLabels[character.status] }}
        </div>
      </div>
    </section>

    <div class="character-layout">
      <section class="character-body">
        <div class="detail-section">
          <h3>Afiliación</h3>
          <p>
            <RouterLink :to="`/houses/${character.house.slug}`">
              Casa {{ character.house.name }}
            </RouterLink>
            — {{ character.house.region }}
          </p>
        </div>
        <div class="detail-section">
          <h3>Lema de la casa</h3>
          <p class="motto">"{{ character.house.motto }}"</p>
        </div>
        <div class="detail-section">
          <h3>Sede</h3>
          <p>{{ character.house.seat }}</p>
        </div>
      </section>

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
  background: color-mix(in srgb, var(--house-deep) 68%, #0b0c0c);
}

.character-portrait svg {
  width: 60px;
}

.house-link {
  color: var(--house);
  text-decoration: none;
  font-size: 8px;
  text-transform: uppercase;
  letter-spacing: 0.21em;
  font-weight: 700;
}

.house-link:hover {
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
  font-size: 8px;
  text-transform: uppercase;
  letter-spacing: 0.12em;
  padding: 8px 14px;
  border: 1px solid var(--border);
}

.status-alive {
  color: #5a8a5e;
  border-color: #5a8a5e;
}

.status-deceased {
  color: #8a5a5a;
  border-color: #8a5a5a;
}

.status-unknown {
  color: #8a8a5a;
  border-color: #8a8a5a;
}

.character-layout {
  display: grid;
  grid-template-columns: 1fr 320px;
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
  padding: 40px 0;
  position: sticky;
  top: 100px;
  align-self: start;
  max-height: calc(100vh - 120px);
  overflow-y: auto;
}

.detail-section h3 {
  font-size: 8px;
  text-transform: uppercase;
  letter-spacing: 0.15em;
  color: var(--house);
  margin: 0 0 12px;
}

.detail-section p {
  font: 18px var(--font-serif);
  margin: 0;
  color: var(--color-muted-foreground);
}

.detail-section p a {
  color: var(--house);
  text-decoration: none;
}

.detail-section p a:hover {
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
  font-size: 8px;
  text-transform: uppercase;
  letter-spacing: 0.14em;
  padding: 12px 0;
}

.back-link:hover {
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
