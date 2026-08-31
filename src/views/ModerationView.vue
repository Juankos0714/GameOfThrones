<script setup lang="ts">
import ModerationQueue from '@/components/wiki/ModerationQueue.vue'
</script>

<template>
  <div>
    <section class="catalogue" style="min-height: 60vh">
      <header class="editorial-head">
        <span>Administración</span>
        <h2>Cola de<br />moderación</h2>
        <p>
          Revisiones propuestas por editores. Arrastre para aprobar o rechazar.
        </p>
      </header>

      <ModerationQueue />
    </section>
  </div>
</template>
