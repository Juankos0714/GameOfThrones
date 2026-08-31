<script setup lang="ts">
defineProps<{
  width?: string
  height?: string
  rounded?: boolean
}>()
</script>

<template>
  <div
    class="skeleton"
    :class="{ 'skeleton--rounded': rounded }"
    :style="{
      width: width ?? '100%',
      height: height ?? '1em',
    }"
    aria-hidden="true"
  />
</template>

<style scoped>
.skeleton {
  background: linear-gradient(
    90deg,
    color-mix(in srgb, var(--house) 8%, var(--color-paper)) 25%,
    color-mix(in srgb, var(--house) 15%, var(--color-paper)) 50%,
    color-mix(in srgb, var(--house) 8%, var(--color-paper)) 75%
  );
  background-size: 200% 100%;
  animation: skeleton-shimmer 1.5s ease-in-out infinite;
  border: 1px solid color-mix(in srgb, var(--house) 12%, var(--border));
}

.skeleton--rounded {
  border-radius: 50%;
}

@keyframes skeleton-shimmer {
  0% { background-position: 200% 0; }
  100% { background-position: -200% 0; }
}
</style>
