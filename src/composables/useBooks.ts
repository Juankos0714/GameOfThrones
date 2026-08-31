import { ref, computed } from 'vue'
import type { Book } from '@/types'

const BOOKS_DATA: Book[] = [
  {
    id: '1', slug: 'juego-de-tronos', title: 'Juego de tronos',
    description: 'El viaje de Ned Stark a Desembarco del Rey y el inicio de la guerra por el Trono de Hierro.',
    cover: null, order: 1,
  },
  {
    id: '2', slug: 'choque-de-reyes', title: 'Choque de reyes',
    description: 'La guerra se extiende por toda Poniente mientras Daenerys busca su camino de vuelta.',
    cover: null, order: 2,
  },
  {
    id: '3', slug: 'tormenta-de-espadas', title: 'Tormenta de espadas',
    description: 'La Boda Roja, la Batalla del Puente Rojo y los sacrificios de la guerra.',
    cover: null, order: 3,
  },
  {
    id: '4', slug: 'festin-de-cuervos', title: 'Festín de cuervos',
    description: 'Los hilos políticos se enredan en Desembarco y Dorne mientras Jon Nieve gobierna el Muro.',
    cover: null, order: 4,
  },
  {
    id: '5', slug: 'danza-de-dragones', title: 'Danza de dragones',
    description: 'Daenerys enfrenta la rebelión de Meereen y el retorno de los dragones a Poniente.',
    cover: null, order: 5,
  },
]

export function useBooks() {
  const books = ref<Book[]>(BOOKS_DATA)
  const loading = ref(false)
  const selectedSlug = ref<string | null>(null)

  const selectedBook = computed(() =>
    books.value.find((b) => b.slug === selectedSlug.value)
  )

  const sortedBooks = computed(() =>
    [...books.value].sort((a, b) => a.order - b.order)
  )

  function selectBook(slug: string) {
    selectedSlug.value = slug
  }

  return {
    books,
    sortedBooks,
    selectedBook,
    loading,
    selectBook,
  }
}
