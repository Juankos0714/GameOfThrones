<script setup lang="ts">
/**
 * InfoBox — sidebar card used on house and character detail pages.
 * Renders a list of key/value pairs with optional slot for custom content.
 */
defineProps<{
  title: string
  rows: Array<{ label: string; value: string | number; link?: string }>
}>()
</script>

<template>
  <aside class="infobox" aria-label="Información rápida">
    <header class="infobox-header">
      <slot name="header">
        <h3>{{ title }}</h3>
      </slot>
    </header>

    <dl class="infobox-body">
      <div v-for="row in rows" :key="row.label" class="infobox-row">
        <dt>{{ row.label }}</dt>
        <dd>
          <RouterLink v-if="row.link" :to="row.link">{{ row.value }}</RouterLink>
          <span v-else>{{ row.value }}</span>
        </dd>
      </div>
    </dl>

    <footer v-if="$slots.footer" class="infobox-footer">
      <slot name="footer" />
    </footer>
  </aside>
</template>

<style scoped>
.infobox {
  border: 1px solid var(--border);
  background: color-mix(in srgb, var(--house-deep) 50%, var(--color-background));
}

.infobox-header {
  border-bottom: 1px solid var(--border);
  padding: 18px 24px;
  background: color-mix(in srgb, var(--house) 8%, transparent);
}

.infobox-header h3 {
  margin: 0;
  font: 600 14px/1 var(--font-serif);
  color: var(--house);
  text-transform: uppercase;
  letter-spacing: 0.12em;
}

.infobox-body {
  padding: 0;
  margin: 0;
}

.infobox-row {
  display: flex;
  justify-content: space-between;
  align-items: baseline;
  padding: 14px 24px;
  border-bottom: 1px solid var(--border);
}

.infobox-row:last-child {
  border-bottom: none;
}

.infobox-row dt {
  font-size: 8px;
  text-transform: uppercase;
  letter-spacing: 0.12em;
  color: var(--color-muted-foreground);
  flex-shrink: 0;
}

.infobox-row dd {
  margin: 0;
  font: 500 15px/1 var(--font-serif);
  text-align: right;
}

.infobox-row dd a {
  color: var(--house);
  text-decoration: none;
  border-bottom: 1px solid transparent;
  transition: border-color 0.2s;
}

.infobox-row dd a:hover {
  border-bottom-color: var(--house);
}

.infobox-footer {
  padding: 16px 24px;
  border-top: 1px solid var(--border);
}
</style>
