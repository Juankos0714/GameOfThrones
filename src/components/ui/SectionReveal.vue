<script setup lang="ts">
/**
 * SectionReveal — reveals content with a subtle animation as it enters the viewport.
 * Respects prefers-reduced-motion.
 */
import { Motion } from 'motion-v'

defineProps<{
  delay?: number
  direction?: 'up' | 'down' | 'left' | 'right'
}>()

const directionOffsets = {
  up: { initial: { opacity: 0, y: 30 }, animate: { opacity: 1, y: 0 } },
  down: { initial: { opacity: 0, y: -30 }, animate: { opacity: 1, y: 0 } },
  left: { initial: { opacity: 0, x: 30 }, animate: { opacity: 1, x: 0 } },
  right: { initial: { opacity: 0, x: -30 }, animate: { opacity: 1, x: 0 } },
}
</script>

<template>
  <Motion
    :initial="directionOffsets[direction ?? 'up'].initial"
    :whileInView="directionOffsets[direction ?? 'up'].animate"
    :transition="{
      duration: 0.7,
      delay: delay ?? 0,
      ease: [0.25, 0.1, 0.25, 1],
    }"
    :viewport="{ once: true, margin: '-80px' }"
  >
    <slot />
  </Motion>
</template>
