import { createRouter, createWebHistory } from 'vue-router'

const router = createRouter({
  history: createWebHistory(),
  scrollBehavior(_to, _from, savedPosition) {
    if (savedPosition) return savedPosition
    return { top: 0 }
  },
  routes: [
    {
      path: '/',
      name: 'home',
      component: () => import('@/views/HomeView.vue'),
      meta: { title: 'Archivo de Poniente | Inicio' },
    },
    {
      path: '/houses',
      name: 'houses',
      component: () => import('@/views/HousesView.vue'),
      meta: { title: 'Casas de Poniente' },
    },
    {
      path: '/houses/:slug',
      name: 'house-detail',
      component: () => import('@/views/HouseDetailView.vue'),
      meta: { title: 'Casa' },
    },
    {
      path: '/characters',
      name: 'characters',
      component: () => import('@/views/CharactersView.vue'),
      meta: { title: 'Personajes' },
    },
    {
      path: '/characters/:slug',
      name: 'character-detail',
      component: () => import('@/views/CharacterView.vue'),
      meta: { title: 'Personaje' },
    },
    {
      path: '/places',
      name: 'places',
      component: () => import('@/views/MapView.vue'),
      meta: { title: 'Atlas del Reino' },
    },
    {
      path: '/map',
      name: 'map',
      component: () => import('@/views/MapView.vue'),
      meta: { title: 'Mapa Interactivo' },
    },
    {
      path: '/books',
      name: 'books',
      component: () => import('@/views/BooksView.vue'),
      meta: { title: 'Los Cinco Libros' },
    },
    {
      path: '/books/:slug',
      name: 'book-detail',
      component: () => import('@/views/BookView.vue'),
      meta: { title: 'Libro' },
    },
    {
      path: '/timeline',
      name: 'timeline',
      component: () => import('@/views/TimelineView.vue'),
      meta: { title: 'Cronología' },
    },
    {
      path: '/battles',
      name: 'battles',
      component: () => import('@/views/BattlesView.vue'),
      meta: { title: 'Batallas' },
    },
    {
      path: '/genealogy',
      name: 'genealogy',
      component: () => import('@/views/GenealogyView.vue'),
      meta: { title: 'Genealogía' },
    },
    {
      path: '/search',
      name: 'search',
      component: () => import('@/views/SearchView.vue'),
      meta: { title: 'Búsqueda' },
    },
    {
      path: '/login',
      name: 'login',
      component: () => import('@/views/LoginView.vue'),
      meta: { title: 'Iniciar sesión' },
    },
    {
      path: '/moderation',
      name: 'moderation',
      component: () => import('@/views/ModerationView.vue'),
      meta: { title: 'Moderación' },
    },
    {
      path: '/mysteries',
      name: 'mysteries',
      component: () => import('@/views/MysteriesView.vue'),
      meta: { title: 'Misterios' },
    },
    {
      path: '/:pathMatch(.*)*',
      name: 'not-found',
      component: () => import('@/views/NotFoundView.vue'),
      meta: { title: 'Página no encontrada' },
    },
  ],
})

// Update document title on navigation
router.afterEach((to) => {
  document.title = (to.meta.title as string) ?? 'Archivo de Poniente'
})

export default router
