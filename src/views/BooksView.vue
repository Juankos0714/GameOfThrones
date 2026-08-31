<script setup lang="ts">
import { useBooks } from '@/composables'
import { RouterLink } from 'vue-router'
import { BookOpen } from 'lucide-vue-next'
import { padNumber } from '@/utils'
import SectionReveal from '@/components/ui/SectionReveal.vue'

const { sortedBooks } = useBooks()
</script>

<template>
  <div>
    <section class="volumes">
      <SectionReveal>
        <header>
          <p class="label">Fuentes primarias</p>
          <h2>Los cinco volúmenes</h2>
        </header>
      </SectionReveal>
      <div>
        <RouterLink
          v-for="(book, i) in sortedBooks"
          :key="book.id"
          :to="`/books/${book.slug}`"
          class="book-article"
        >
          <span>{{ padNumber(i + 1) }}</span>
          <BookOpen />
          <h3>{{ book.title }}</h3>
          <p class="book-desc">{{ book.description }}</p>
          <p class="book-meta">Capítulos · POV · lugares · hechos</p>
        </RouterLink>
      </div>
    </section>
  </div>
</template>

<style scoped>
.book-article {
  min-height: 310px;
  padding: 24px;
  border-right: 1px solid #8f8675;
  display: flex;
  flex-direction: column;
  text-decoration: none;
  color: inherit;
  transition: background 0.25s ease;
}

.book-article:hover {
  background: color-mix(in srgb, var(--house) 6%, var(--color-paper));
}

.book-article:last-child {
  border-right: none;
}

.book-article > span {
  font: 600 8px/1 var(--font-sans);
  color: var(--color-ink);
}

.book-article svg {
  width: 34px;
  margin: auto;
  color: #666052;
  transition: color 0.25s ease;
}

.book-article:hover svg {
  color: var(--house);
}

.book-article h3 {
  font: 25px/1 var(--font-serif);
  margin: 0 0 12px;
  color: var(--color-ink);
  transition: color 0.25s ease;
}

.book-article:hover h3 {
  color: var(--house);
}

.book-desc {
  font-size: 10px;
  line-height: 1.7;
  color: #625d52;
  margin: 0;
}

.book-meta {
  font: 500 7px/1 var(--font-sans) !important;
  text-transform: uppercase;
  letter-spacing: 0.1em;
  margin-top: 10px !important;
}

@media (max-width: 900px) {
  .volumes > div {
    grid-template-columns: repeat(3, 1fr);
  }
}

@media (max-width: 600px) {
  .volumes > div {
    grid-template-columns: 1fr;
  }

  .book-article {
    border-right: none;
    border-bottom: 1px solid #8f8675;
    min-height: auto;
    padding: 20px;
  }
}
</style>
