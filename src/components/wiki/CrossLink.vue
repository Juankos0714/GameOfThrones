<script setup lang="ts">
/**
 * CrossLink — renders text with automatic cross-references to houses,
 * characters, and places. Mentions are detected by name and turned into
 * RouterLinks.
 *
 * Usage:
 *   <CrossLink text="Eddard Stark era el señor de Casa Stark en Invernalia." />
 */
import { computed } from 'vue'
import { useHouses } from '@/composables'

const props = defineProps<{
  text: string
}>()

const { houses } = useHouses()

interface Segment {
  text: string
  link?: string
}

const segments = computed<Segment[]>(() => {
  const result: Segment[] = []
  let remaining = props.text

  // Build lookup of known names
  const knownNames: Array<{ name: string; link: string }> = []

  houses.value.forEach((house) => {
    // House names
    knownNames.push({ name: `Casa ${house.name}`, link: `/houses/${house.slug}` })
    knownNames.push({ name: house.name, link: `/houses/${house.slug}` })

    // House seats
    if (house.seat) {
      knownNames.push({ name: house.seat, link: `/houses/${house.slug}` })
    }

    // Member names
    house.members.forEach((member) => {
      const slug = member.name.toLowerCase().replace(/\s+/g, '-')
      knownNames.push({ name: member.name, link: `/characters/${slug}` })
    })
  })

  // Sort by length (longest first) to match more specific names first
  knownNames.sort((a, b) => b.name.length - a.name.length)

  while (remaining.length > 0) {
    let earliestIndex = remaining.length
    let earliestMatch: typeof knownNames[0] | null = null

    for (const known of knownNames) {
      const idx = remaining.indexOf(known.name)
      if (idx !== -1 && idx < earliestIndex) {
        // Avoid matching partial words (check boundaries)
        const before = idx === 0 ? ' ' : remaining[idx - 1]
        const after = idx + known.name.length >= remaining.length ? ' ' : remaining[idx + known.name.length]
        const isWordBoundary = /[\s,.\-;:!?¡¿]/.test(before) && /[\s,.\-;:!?¡¿]/.test(after)

        if (isWordBoundary) {
          earliestIndex = idx
          earliestMatch = known
        }
      }
    }

    if (earliestMatch && earliestIndex < remaining.length) {
      // Add text before the match
      if (earliestIndex > 0) {
        result.push({ text: remaining.slice(0, earliestIndex) })
      }
      // Add the linked segment
      result.push({
        text: remaining.slice(earliestIndex, earliestIndex + earliestMatch.name.length),
        link: earliestMatch.link,
      })
      remaining = remaining.slice(earliestIndex + earliestMatch.name.length)
    } else {
      // No more matches, add the rest
      result.push({ text: remaining })
      break
    }
  }

  return result
})
</script>

<template>
  <span class="crosslink">
    <template v-for="(segment, i) in segments" :key="i">
      <RouterLink v-if="segment.link" :to="segment.link" class="crosslink-link">
        {{ segment.text }}
      </RouterLink>
      <template v-else>{{ segment.text }}</template>
    </template>
  </span>
</template>

<style scoped>
.crosslink-link {
  color: var(--house);
  text-decoration: none;
  border-bottom: 1px solid transparent;
  transition: border-color 0.2s;
}

.crosslink-link:hover {
  border-bottom-color: var(--house);
}
</style>
