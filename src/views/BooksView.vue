<script setup lang="ts">
import { useBooks } from '@/composables'
import { RouterLink } from 'vue-router'
import { BookOpen } from 'lucide-vue-next'
import { padNumber } from '@/utils'

const { sortedBooks } = useBooks()
</script>

<template>
  <div>
    <section class="volumes">
      <header>
        <p class="label">Fuentes primarias</p>
        <h2>Los cinco volúmenes</h2>
      </header>
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
          <p>{{ book.description }}</p>
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
  transition: background 0.2s;
}

.book-article:hover {
  background: color-mix(in srgb, var(--house) 8%, var(--color-paper));
}

.book-article:last-child {
  border-right: none;
}

.book-article > span {
  font-size: 8px;
  color: var(--color-ink);
}

.book-article svg {
  width: 34px;
  margin: auto;
  color: #666052;
}

.book-article h3 {
  font: 25px/1 var(--font-serif);
  margin: 0 0 15px;
  color: var(--color-ink);
}

.book-article p {
  font-size: 10px;
  line-height: 1.7;
  color: #625d52;
  margin: 0;
}

.book-meta {
  font-size: 7px !important;
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
}
</style>
