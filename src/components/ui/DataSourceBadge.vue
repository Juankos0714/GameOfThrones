<script setup lang="ts">
defineProps<{
  source: 'hardcoded' | 'supabase'
}>()
</script>

<template>
  <span
    class="data-source-badge"
    :class="`data-source-badge--${source}`"
    :title="source === 'supabase' ? 'Datos cargados desde Supabase' : 'Datos de prueba incluidos en el proyecto'"
  >
    <span class="data-source-badge__dot" />
    {{ source === 'supabase' ? 'Supabase' : 'Offline' }}
  </span>
</template>

<style scoped>
.data-source-badge {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  font-size: 7px;
  text-transform: uppercase;
  letter-spacing: 0.1em;
  padding: 4px 10px;
  border: 1px solid var(--border);
  color: var(--color-muted-foreground);
  white-space: nowrap;
}

.data-source-badge__dot {
  width: 6px;
  height: 6px;
  border-radius: 50%;
}

.data-source-badge--supabase .data-source-badge__dot {
  background: #5a8a5e;
  box-shadow: 0 0 6px #5a8a5e80;
}

.data-source-badge--supabase {
  border-color: #5a8a5e40;
  color: #5a8a5e;
}

.data-source-badge--hardcoded .data-source-badge__dot {
  background: #8a8a5a;
}

.data-source-badge--hardcoded {
  border-color: #8a8a5a40;
  color: #8a8a5a;
}
</style>
