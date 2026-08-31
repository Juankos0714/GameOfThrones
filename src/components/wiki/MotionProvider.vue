<script setup lang="ts">
/**
 * MotionProvider — wraps the app with MotionConfig.
 * Defines global motion tokens: duration, easing, reduced motion.
 */
import { MotionConfig } from 'motion-v'
</script>

<template>
  <MotionConfig
    :transition="{
      duration: 0.5,
      ease: [0.25, 0.1, 0.25, 1],
    }"
    :reducedMotion="'user'"
  >
    <slot />
  </MotionConfig>
</template>
