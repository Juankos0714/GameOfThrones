<script setup lang="ts">
import { computed } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useBooks } from '@/composables'
import { BookOpen } from 'lucide-vue-next'

const route = useRoute()
const router = useRouter()
const { books } = useBooks()

const book = computed(() => {
  const slug = route.params.slug as string
  return books.value.find((b) => b.slug === slug)
})

document.title = book.value
  ? `${book.value.title} — Archivo de Poniente`
  : 'Libro — Archivo de Poniente'
</script>

<template>
  <div v-if="book" class="book-detail">
    <section class="book-hero">
      <div class="book-cover">
        <BookOpen />
      </div>
      <div class="book-info">
        <p class="label">Vol. {{ book.order }}</p>
        <h1>{{ book.title }}</h1>
        <p class="book-desc">{{ book.description }}</p>
      </div>
    </section>

    <section class="book-body">
      <div class="detail-section">
        <h3>Contenido</h3>
        <p>Capítulos · POV · lugares · hechos</p>
      </div>
      <div class="detail-section">
        <h3>Cronología</h3>
        <p>Los eventos de este volumen abarcan aproximadamente un año.</p>
      </div>
      <div class="detail-section">
        <h3>Puntos de vista</h3>
        <p>Múltiples narradores dan cuenta de los hechos desde distintas troneras.</p>
      </div>
    </section>

    <div class="book-nav">
      <button @click="router.push('/books')">← Volver a Libros</button>
    </div>
  </div>

  <div v-else style="padding: 200px 40px; text-align: center; color: var(--color-muted-foreground);">
    <p>Libro no encontrado.</p>
    <button
      @click="router.push('/books')"
      style="margin-top: 16px; border: 0; border-bottom: 1px solid var(--house); background: none; color: var(--color-foreground); cursor: pointer; text-transform: uppercase; letter-spacing: 0.14em; font-size: 8px;"
    >
      Volver a Libros
    </button>
  </div>
</template>

<style scoped>
.book-hero {
  padding: 140px clamp(24px, 7vw, 110px) 80px;
  display: grid;
  grid-template-columns: auto 1fr;
  gap: 60px;
  align-items: center;
  border-bottom: 1px solid var(--border);
}

.book-cover {
  width: 160px;
  height: 220px;
  border: 1px solid var(--border);
  display: grid;
  place-items: center;
  color: var(--house);
  background: color-mix(in srgb, var(--house-deep) 68%, #0b0c0c);
}

.book-cover svg {
  width: 50px;
}

.book-info h1 {
  font: 500 clamp(40px, 6vw, 80px) / 0.85 var(--font-serif);
  margin: 12px 0;
  letter-spacing: -0.04em;
}

.book-desc {
  font: italic 18px var(--font-serif);
  color: var(--color-muted-foreground);
  max-width: 600px;
}

.book-body {
  padding: 80px clamp(24px, 7vw, 110px);
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 50px;
  border-bottom: 1px solid var(--border);
}

.detail-section h3 {
  font-size: 8px;
  text-transform: uppercase;
  letter-spacing: 0.15em;
  color: var(--house);
  margin: 0 0 12px;
}

.detail-section p {
  font: 16px/1.6 var(--font-serif);
  margin: 0;
  color: var(--color-muted-foreground);
}

.book-nav {
  padding: 40px clamp(24px, 7vw, 110px);
}

.book-nav button {
  border: 0;
  border-bottom: 1px solid var(--house);
  background: none;
  color: var(--color-foreground);
  cursor: pointer;
  text-transform: uppercase;
  letter-spacing: 0.14em;
  font-size: 8px;
  padding: 0 0 8px;
}

@media (max-width: 900px) {
  .book-hero {
    grid-template-columns: 1fr;
    text-align: center;
  }

  .book-cover {
    margin: 0 auto;
  }

  .book-body {
    grid-template-columns: 1fr;
    gap: 35px;
  }
}
</style>
