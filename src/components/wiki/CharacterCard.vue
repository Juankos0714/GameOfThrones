<script setup lang="ts">
/**
 * CharacterCard — styled as a historical dossier / archive record.
 * Shows name, title, house affiliation, status badge, and links to detail.
 */
import { computed } from 'vue'
import { RouterLink } from 'vue-router'
import { Motion } from 'motion-v'
import { Shield } from 'lucide-vue-next'

const props = defineProps<{
  name: string
  title: string
  status: 'alive' | 'deceased' | 'unknown'
  houseName: string
  houseSlug: string
  houseSigil?: string
}>()

const characterSlug = computed(() =>
  props.name.toLowerCase().replace(/\s+/g, '-')
)

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
</script>

<template>
  <Motion
    as="article"
    class="character-card"
    :whileHover="{ y: -2 }"
    :whileTap="{ scale: 0.995 }"
    :transition="{ duration: 0.25, ease: [0.25, 0.1, 0.25, 1] }"
  >
    <RouterLink :to="`/characters/${characterSlug}`" class="character-card-link">
      <div class="character-card-portrait">
        <Shield />
      </div>

      <div class="character-card-info">
        <RouterLink :to="`/houses/${houseSlug}`" class="character-card-house">
          Casa {{ houseName }}
        </RouterLink>
        <h3 class="character-card-name">{{ name }}</h3>
        <p class="character-card-title">{{ title }}</p>
      </div>

      <div class="character-card-status">
        <span
          class="status-badge"
          :style="{
            color: statusColors[status],
            borderColor: statusColors[status],
          }"
        >
          {{ statusLabels[status] }}
        </span>
      </div>
    </RouterLink>
  </Motion>
</template>

<style scoped>
.character-card {
  border: 1px solid var(--border);
  transition: border-color 0.25s ease, background 0.25s ease;
}

.character-card:hover {
  border-color: var(--house-border);
  background: var(--house-surface);
}

.character-card-link {
  display: grid;
  grid-template-columns: 72px 1fr auto;
  gap: 20px;
  align-items: center;
  padding: 24px;
  text-decoration: none;
  color: inherit;
}

.character-card-portrait {
  width: 72px;
  height: 72px;
  border-radius: 50%;
  border: 1px solid var(--border);
  display: grid;
  place-items: center;
  color: var(--house);
  background: color-mix(in srgb, var(--house-deep) 60%, var(--color-background));
  flex-shrink: 0;
  transition: border-color 0.25s ease, transform 0.25s ease;
}

.character-card:hover .character-card-portrait {
  border-color: var(--house-border);
  transform: scale(1.05);
}

.character-card-portrait svg {
  width: 28px;
}

.character-card-house {
  display: inline-block;
  color: var(--house);
  text-decoration: none;
  font: 700 7px/1 var(--font-sans);
  text-transform: uppercase;
  letter-spacing: 0.21em;
  margin-bottom: 6px;
  transition: color 0.2s ease;
}

.character-card-house:hover {
  text-decoration: underline;
}

.character-card-name {
  font: 500 28px/1.1 var(--font-serif);
  margin: 0;
  transition: color 0.25s ease;
}

.character-card:hover .character-card-name {
  color: var(--house);
}

.character-card-title {
  font: italic 14px var(--font-serif);
  color: var(--color-muted-foreground);
  margin: 4px 0 0;
}

.character-card-status {
  flex-shrink: 0;
}

.status-badge {
  font: 500 7px/1 var(--font-sans);
  text-transform: uppercase;
  letter-spacing: 0.12em;
  padding: 6px 12px;
  border: 1px solid;
}

@media (max-width: 600px) {
  .character-card-link {
    grid-template-columns: 56px 1fr;
    gap: 14px;
    padding: 18px;
  }

  .character-card-portrait {
    width: 56px;
    height: 56px;
  }

  .character-card-portrait svg {
    width: 22px;
  }

  .character-card-status {
    grid-column: 2;
  }
}
</style>
