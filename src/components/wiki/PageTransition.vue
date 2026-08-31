<script setup lang="ts">
/**
 * PageTransition — wraps route views with consistent enter/exit animations.
 * Uses Motion from motion-v for smooth, physical transitions.
 */
import { AnimatePresence, Motion } from 'motion-v'
import { useRoute } from 'vue-router'

const route = useRoute()
</script>

<template>
  <RouterView v-slot="{ Component, route: r }">
    <AnimatePresence mode="wait">
      <Motion
        :key="r.path"
        :initial="{ opacity: 0, y: 14 }"
        :animate="{ opacity: 1, y: 0 }"
        :exit="{ opacity: 0, y: -10 }"
        :transition="{
          duration: 0.45,
          ease: [0.25, 0.1, 0.25, 1],
          layout: { duration: 0.35 }
        }"
      >
        <component :is="Component" />
      </Motion>
    </AnimatePresence>
  </RouterView>
</template>
