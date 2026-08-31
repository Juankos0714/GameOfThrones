<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { RouterLink, useRoute, useRouter } from 'vue-router'
import { useUiStore } from '@/stores/ui'
import { useTimelineStore } from '@/stores/timeline'
import { useHouses } from '@/composables'
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
  MapPin,
  Scroll,
  Users,
  BookOpen,
  HelpCircle,
  Search,
  Landmark,
  Swords,
  GitBranch,
} from 'lucide-vue-next'

const route = useRoute()
const router = useRouter()
const { selectedHouse, fetchHouses, source } = useHouses()
const { activeHouseClass } = useTheme()

const menuOpen = useUiStore((s) => s.menuOpen)
const toggleMenu = useUiStore((s) => s.toggleMenu)
const closeMenu = useUiStore((s) => s.closeMenu)

const navLinks = [
  { label: 'Casas', path: '/houses', icon: Landmark },
  { label: 'Personajes', path: '/characters', icon: Users },
  { label: 'Atlas', path: '/places', icon: MapPin },
  { label: 'Cronología', path: '/timeline', icon: Scroll },
  { label: 'Genealogía', path: '/genealogy', icon: GitBranch },
  { label: 'Batallas', path: '/battles', icon: Swords },
  { label: 'Misterios', path: '/mysteries', icon: HelpCircle },
  { label: 'Libros', path: '/books', icon: BookOpen },
  { label: 'Buscar', path: '/search', icon: Search },
]

function navigateTo(path: string) {
  router.push(path)
  closeMenu()
}

onMounted(async () => {
  document.documentElement.setAttribute('data-house', selectedHouse.value.id)
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
        <X v-if="menuOpen" :size="20" />
        <Menu v-else :size="20" />
      </button>
    </header>

    <!-- Main content -->
    <main>
      <RouterView v-slot="{ Component, route: r }">
        <AnimatePresence mode="wait">
          <Motion
            :key="r.path"
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
  gap: 28px;
}

.nav-main a {
  border: 0;
  background: none;
  color: var(--color-muted-foreground);
  font: 500 8px/1 var(--font-sans);
  letter-spacing: 0.18em;
  text-transform: uppercase;
  cursor: pointer;
  text-decoration: none;
  padding: 6px 0;
  position: relative;
  transition: color 0.25s ease;
}

.nav-main a::after {
  content: "";
  position: absolute;
  bottom: -2px;
  left: 0;
  width: 0;
  height: 1px;
  background: var(--house);
  transition: width 0.25s cubic-bezier(0.25, 0.1, 0.25, 1);
}

.nav-main a:hover,
.nav-main a.router-link-active {
  color: var(--house);
}

.nav-main a:hover::after,
.nav-main a.router-link-active::after {
  width: 100%;
}

@media (max-width: 900px) {
  .nav-main {
    position: absolute;
    top: 64px;
    left: 0;
    right: 0;
    background: rgb(10 11 11 / 0.98);
    backdrop-filter: blur(20px);
    -webkit-backdrop-filter: blur(20px);
    display: none;
    flex-direction: column;
    padding: 20px 28px;
    z-index: 10;
    border-bottom: 1px solid var(--border);
    gap: 0;
  }

  .nav-main.open {
    display: flex;
    animation: slideDown 0.3s cubic-bezier(0.25, 0.1, 0.25, 1);
  }

  .nav-main a {
    padding: 14px 0;
    font-size: 9px;
    border-bottom: 1px solid rgba(56, 55, 47, 0.3);
  }

  .nav-main a:last-child {
    border-bottom: none;
  }

  @keyframes slideDown {
    from { opacity: 0; transform: translateY(-8px); }
    to { opacity: 1; transform: translateY(0); }
  }
}
</style>
