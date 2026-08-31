<script setup lang="ts">
/**
 * HouseCard — visual card for a house with microinteractions.
 * Shows sigil icon, name, territory, motto, and member count.
 * Hover triggers subtle atmospheric shift and typographic accent.
 */
import { computed } from 'vue'
import { Motion } from 'motion-v'
import {
  TreePine, Crown, Flame, Swords, Flower2, Anchor, Mountain, Waves, Shield,
} from 'lucide-vue-next'
import type { House } from '@/types'

const props = defineProps<{
  house: House
  isActive?: boolean
  index?: number
}>()

const emit = defineEmits<{
  select: [id: string]
}>()

const iconMap: Record<string, any> = {
  TreePine, Crown, Flame, Swords, Flower2, Anchor, Mountain, Waves,
}

const houseIcon = computed(() => iconMap[props.house.sigil] ?? Shield)
const padIndex = computed(() => String((props.index ?? 0) + 1).padStart(2, '0'))
</script>

<template>
  <Motion
    as="button"
    class="house-card"
    :class="{ active: isActive }"
    :whileHover="{ y: -2 }"
    :whileTap="{ scale: 0.995 }"
    :transition="{ layout: { type: 'tween', duration: 0.3 }, default: { type: 'tween', duration: 0.2 } }"
    @click="emit('select', house.id)"
    :aria-pressed="isActive"
  >
    <div class="house-card-index">
      <span class="index-no">{{ padIndex }}</span>
    </div>

    <div class="house-card-sigil">
      <component :is="houseIcon" />
    </div>

    <div class="house-card-content">
      <div class="house-card-header">
        <h3 class="house-card-name">{{ house.name }}</h3>
        <span class="house-card-region">{{ house.region }}</span>
      </div>
      <p class="house-card-motto">"{{ house.motto }}"</p>
    </div>

    <div class="house-card-meta">
      <span class="house-card-members">{{ house.members.length }} miembros</span>
      <span class="house-card-arrow" aria-hidden="true">→</span>
    </div>
  </Motion>
</template>

<style scoped>
.house-card {
  width: 100%;
  border: 0;
  border-bottom: 1px solid #8b8372;
  background: transparent;
  color: var(--color-ink);
  display: grid;
  grid-template-columns: 50px 40px 1fr auto;
  align-items: center;
  gap: 16px;
  padding: 22px 8px;
  text-align: left;
  cursor: pointer;
  transition: padding 0.25s cubic-bezier(0.25, 0.1, 0.25, 1),
              background 0.25s ease;
  font-family: inherit;
}

.house-card:hover,
.house-card.active {
  padding-left: 22px;
  background: color-mix(in srgb, var(--house) 12%, var(--color-paper));
}

.house-card.active {
  border-bottom-color: var(--house);
}

.house-card-index {
  flex-shrink: 0;
}

.index-no {
  font: 600 8px/1 var(--font-sans);
  letter-spacing: 0.12em;
  text-transform: uppercase;
}

.house-card-sigil {
  width: 40px;
  height: 40px;
  display: grid;
  place-items: center;
  color: #514d43;
  transition: color 0.25s ease, transform 0.25s ease;
}

.house-card:hover .house-card-sigil,
.house-card.active .house-card-sigil {
  color: var(--house);
  transform: scale(1.1);
}

.house-card-sigil svg {
  width: 20px;
  height: 20px;
}

.house-card-content {
  min-width: 0;
}

.house-card-header {
  display: flex;
  align-items: baseline;
  gap: 14px;
}

.house-card-name {
  font: 500 clamp(22px, 2.5vw, 36px) / 1 var(--font-serif);
  margin: 0;
  transition: color 0.25s ease;
}

.house-card:hover .house-card-name,
.house-card.active .house-card-name {
  color: var(--house);
}

.house-card-region {
  font: 500 8px/1 var(--font-sans);
  letter-spacing: 0.12em;
  text-transform: uppercase;
  color: #625d52;
}

.house-card-motto {
  font: italic 14px var(--font-serif);
  color: #5e594e;
  margin: 4px 0 0;
}

.house-card-meta {
  display: flex;
  flex-direction: column;
  align-items: flex-end;
  gap: 8px;
  flex-shrink: 0;
}

.house-card-members {
  font: 500 8px/1 var(--font-sans);
  letter-spacing: 0.1em;
  text-transform: uppercase;
  color: #625d52;
}

.house-card-arrow {
  font-size: 16px;
  color: #5c574d;
  transition: transform 0.25s ease, color 0.25s ease;
}

.house-card:hover .house-card-arrow {
  transform: translateX(4px);
  color: var(--house);
}

@media (max-width: 600px) {
  .house-card {
    grid-template-columns: 28px 24px 1fr auto;
    gap: 10px;
  }

  .house-card-sigil {
    width: 24px;
    height: 24px;
  }

  .house-card-sigil svg {
    width: 14px;
    height: 14px;
  }

  .house-card-region {
    display: none;
  }

  .house-card-motto {
    display: none;
  }

  .house-card-members {
    display: none;
  }

  .house-card-header {
    flex-direction: column;
    gap: 2px;
  }
}
</style>
