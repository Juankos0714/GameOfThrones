<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { RouterLink, RouterView, useRoute, useRouter } from 'vue-router'
import { useUiStore } from '@/stores/ui'
import { useTimelineStore } from '@/stores/timeline'
import { useHouses, useTimeline } from '@/composables'
import { useTheme } from '@/composables'
import { cn } from '@/utils'
import HouseAtmosphere from '@/components/wiki/HouseAtmosphere.vue'
import DataSourceBadge from '@/components/ui/DataSourceBadge.vue'
import MotionProvider from '@/components/wiki/MotionProvider.vue'
import { AnimatePresence, Motion } from 'motion-v'
import {
  Shield,
  Menu,
  X,
  Search,
} from 'lucide-vue-next'

const route = useRoute()
const router = useRouter()
const { selectedHouse, fetchHouses, source } = useHouses()
const { activeHouseClass } = useTheme()

const menuOpen = useUiStore((s) => s.menuOpen)
const toggleMenu = useUiStore((s) => s.toggleMenu)
const closeMenu = useUiStore((s) => s.closeMenu)

const searchQuery = ref('')
const showSearch = ref(false)

const navLinks = [
  { label: 'casas', path: '/houses' },
  { label: 'personajes', path: '/characters' },
  { label: 'atlas', path: '/places' },
  { label: 'cronología', path: '/timeline' },
  { label: 'misterios', path: '/mysteries' },
  { label: 'libros', path: '/books' },
  { label: 'buscar', path: '/search' },
]

function scrollToSection(id: string) {
  document.getElementById(id)?.scrollIntoView({ behavior: 'smooth' })
  closeMenu()
}

function navigateTo(path: string) {
  router.push(path)
  closeMenu()
}

onMounted(async () => {
  document.documentElement.setAttribute('data-house', selectedHouse.value.id)
  // Fetch data from Supabase (falls back to hardcoded if not configured)
  await Promise.all([
    fetchHouses(),
    useTimelineStore.getState().fetchEvents(),
  ])
})
</script>

<template>
  <MotionProvider>
  <div :class="cn('archive-shell', activeHouseClass)">
    <div class="material-field" aria-hidden="true" />
    <HouseAtmosphere />

    <!-- Masthead -->
    <header class="masthead">
      <RouterLink to="/" class="brand" @click="closeMenu">
        <Shield />
        <span>
          Archivo de Poniente
          <small>Compendio de historia y sangre</small>
        </span>
      </RouterLink>

      <nav
        aria-label="Navegación principal"
        :class="cn('nav-main', menuOpen && 'open')"
      >
        <RouterLink
          v-for="link in navLinks"
          :key="link.label"
          :to="link.path"
          @click="closeMenu"
        >
          {{ link.label }}
        </RouterLink>
      </nav>

      <button
        class="menu"
        @click="toggleMenu()"
        :aria-expanded="menuOpen ? 'true' : 'false'"
        aria-label="Navegación"
      >
        <X v-if="menuOpen" />
        <Menu v-else />
      </button>
    </header>

    <!-- Main content -->
    <main>
      <RouterView v-slot="{ Component, route }">
        <AnimatePresence mode="wait">
          <Motion
            :key="route.path"
            :initial="{ opacity: 0, y: 12 }"
            :animate="{ opacity: 1, y: 0 }"
            :exit="{ opacity: 0, y: -8 }"
            :transition="{ duration: 0.4, ease: [0.25, 0.1, 0.25, 1] }"
          >
            <component :is="Component" />
          </Motion>
        </AnimatePresence>
      </RouterView>
    </main>

    <!-- Footer -->
    <footer class="site-footer">
      <Shield />
      <p>Archivo de Poniente</p>
      <span>La historia pertenece a quien conserva sus pruebas.</span>
      <DataSourceBadge :source="source" />
    </footer>
  </div>
  </MotionProvider>

</template>

<style scoped>
.nav-main {
  display: flex;
  gap: 30px;
}

.nav-main a {
  border: 0;
  background: none;
  color: var(--color-muted-foreground);
  font-size: 8px;
  letter-spacing: 0.17em;
  text-transform: uppercase;
  cursor: pointer;
  text-decoration: none;
  transition: color 0.2s;
}

.nav-main a:hover,
.nav-main a.router-link-active {
  color: var(--house);
}

@media (max-width: 900px) {
  .nav-main {
    position: absolute;
    top: 70px;
    left: 0;
    right: 0;
    background: #0b0c0c;
    display: none;
    flex-direction: column;
    padding: 25px;
    z-index: 10;
  }

  .nav-main.open {
    display: flex;
  }
}
</style>
