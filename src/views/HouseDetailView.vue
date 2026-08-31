<script setup lang="ts">
import { computed, watch } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useHouses } from '@/composables'
import { useTheme } from '@/composables'
import { padNumber } from '@/utils'
import InfoBox from '@/components/wiki/InfoBox.vue'
import CrossLink from '@/components/wiki/CrossLink.vue'
import SectionReveal from '@/components/ui/SectionReveal.vue'
import { Motion } from 'motion-v'
import {
  TreePine, Crown, Flame, Swords, Flower2, Anchor, Mountain, Waves, Shield,
} from 'lucide-vue-next'

const route = useRoute()
const router = useRouter()
const { getHouseBySlug } = useHouses()
const { activeHouseClass, setHouse } = useTheme()

const iconMap: Record<string, any> = {
  TreePine, Crown, Flame, Swords, Flower2, Anchor, Mountain, Waves,
}

const house = computed(() => {
  const slug = route.params.slug as string
  return getHouseBySlug(slug)
})

const houseIcon = computed(() => {
  if (!house.value) return Shield
  return iconMap[house.value.sigil] ?? Shield
})

const chapters = [
  'Identidad', 'Historia', 'Sangre', 'Miembros',
  'Política', 'Territorios', 'Acontecimientos', 'Referencias',
]

const infoboxRows = computed(() => {
  if (!house.value) return []
  return [
    { label: 'Región', value: house.value.region },
    { label: 'Sede', value: house.value.seat },
    { label: 'Fundación', value: house.value.founded },
    { label: 'Lema', value: `\"${house.value.motto}\"` },
    { label: 'Materia', value: house.value.material },
    { label: 'Miembros', value: house.value.members.length },
  ]
})

watch(
  () => house.value,
  (h) => {
    if (h) {
      document.title = `Casa ${h.name} — Archivo de Poniente`
      setHouse(h.id as any)
    }
  },
  { immediate: true }
)

function goToChapter(id: string) {
  document.getElementById(id)?.scrollIntoView({ behavior: 'smooth' })
}
</script>

<template>
  <div v-if="house" class="monograph">
    <!-- Hero -->
    <header class="monograph-hero">
      <Motion
        class="giant-mark"
        :initial="{ opacity: 0, scale: 0.85 }"
        :animate="{ opacity: 1, scale: 1 }"
        :transition="{ duration: 0.8, delay: 0.2, ease: [0.25, 0.1, 0.25, 1] }"
      >
        <component :is="houseIcon" />
      </Motion>
      <div>
        <Motion
          :initial="{ opacity: 0, y: 15 }"
          :animate="{ opacity: 1, y: 0 }"
          :transition="{ duration: 0.6, delay: 0.3 }"
        >
          <p>Archivo dinástico · {{ house.region }}</p>
        </Motion>
        <Motion
          :initial="{ opacity: 0, y: 20 }"
          :animate="{ opacity: 1, y: 0 }"
          :transition="{ duration: 0.7, delay: 0.45 }"
        >
          <h2>Casa<br />{{ house.name }}</h2>
        </Motion>
        <Motion
          :initial="{ opacity: 0 }"
          :animate="{ opacity: 1 }"
          :transition="{ duration: 0.6, delay: 0.65 }"
        >
          <blockquote>"{{ house.motto }}"</blockquote>
        </Motion>
      </div>
      <dl>
        <div><dt>Sede</dt><dd>{{ house.seat }}</dd></div>
        <div><dt>Origen</dt><dd>{{ house.founded }}</dd></div>
        <div><dt>Materia</dt><dd>{{ house.material }}</dd></div>
      </dl>
    </header>

    <!-- Chapter Nav -->
    <nav class="chapter-nav" aria-label="Capítulos del monográfico">
      <a
        v-for="(chapter, i) in chapters"
        :key="chapter"
        :href="`#chapter-${i + 1}`"
      >
        <b>{{ padNumber(i + 1) }}</b>
        {{ chapter }}
      </a>
    </nav>

    <!-- Sidebar + Content layout -->
    <div class="chapter-content-layout">
      <!-- Main content -->
      <div class="chapter-main">
        <!-- Chapter 01: Identidad -->
        <SectionReveal>
          <section id="chapter-1" class="chapter statement">
            <span>01</span>
            <div>
              <p class="label">Identidad</p>
              <h3>{{ house.summary }}</h3>
            </div>
          </section>
        </SectionReveal>

        <!-- Chapter 02: Historia -->
        <SectionReveal>
          <section id="chapter-2" class="chapter history">
            <aside>
              <p>Nota del archivero</p>
              <span>Las crónicas de una casa son también la versión que esa casa consiguió preservar.</span>
            </aside>
            <div>
              <p class="label">02 / Historia</p>
              <h3>Una soberanía escrita sobre piedra y sangre.</h3>
              <p><CrossLink :text="house.history" /></p>
              <p>Su lema actúa como doctrina pública: resume una promesa a vasallos y una advertencia a rivales.</p>
            </div>
          </section>
        </SectionReveal>

        <!-- Chapter 03: Sangre y sucesión -->
        <SectionReveal>
          <section id="chapter-3" class="chapter lineage">
            <div class="chapter-title">
              <p class="label">03 / Sangre y sucesión</p>
              <h3>Árbol del linaje</h3>
            </div>
            <div class="lineage-scroll">
              <div class="tree">
                <span>{{ house.members[0]?.name }}</span>
                <i />
                <div>
                  <span v-for="member in house.members.slice(1)" :key="member.name">
                    {{ member.name }}
                  </span>
                </div>
              </div>
            </div>
          </section>
        </SectionReveal>

        <!-- Chapter 04: Miembros -->
        <SectionReveal>
          <section id="chapter-4" class="chapter registry">
            <div class="chapter-title">
              <p class="label">04 / Miembros</p>
              <h3>Figuras registradas</h3>
            </div>
            <ol>
              <li v-for="(member, i) in house.members" :key="member.name">
                <b>{{ padNumber(i + 1) }}</b>
                <RouterLink :to="`/characters/${member.name.toLowerCase().replace(/\s+/g, '-')}`">
                  {{ member.name }}
                </RouterLink>
                <small>{{ i === 0 ? 'Cabeza o figura histórica' : member.title }}</small>
              </li>
            </ol>
          </section>
        </SectionReveal>

        <!-- Chapter 05: Política -->
        <SectionReveal>
          <section id="chapter-5" class="chapter politics">
            <div>
              <p class="label">05 / Red política</p>
              <h3>Juramentos y enemistades</h3>
            </div>
            <div class="political-list">
              <p>Aliados</p>
              <span v-for="ally in house.allies" :key="ally">+ {{ ally }}</span>
            </div>
            <div class="political-list rivals">
              <p>Rivales</p>
              <span v-for="rival in house.rivals" :key="rival">— {{ rival }}</span>
            </div>
          </section>
        </SectionReveal>

        <!-- Chapter 06: Territorios -->
        <SectionReveal>
          <section id="chapter-6" class="chapter territories">
            <div>
              <p class="label">06 / Territorios</p>
              <h3>Dominio y frontera</h3>
            </div>
            <div class="contour" aria-label="Carta territorial estilizada">
              <component :is="houseIcon" />
              <span
                v-for="(land, i) in house.lands"
                :key="land"
                :style="{ left: `${18 + i * 30}%`, top: `${65 - i * 18}%` }"
              >
                {{ land }}
              </span>
            </div>
          </section>
        </SectionReveal>

        <!-- Chapter 07: Acontecimientos -->
        <SectionReveal>
          <section id="chapter-7" class="chapter events">
            <div class="chapter-title">
              <p class="label">07 / Acontecimientos</p>
              <h3>Hechos que alteraron el linaje</h3>
            </div>
            <article v-for="(event, i) in house.events" :key="event">
              <time>{{ 298 + i }} d.C.</time>
              <h4>{{ event }}</h4>
              <p>Registro cruzado en las crónicas del reino y testimonios de sus contemporáneos.</p>
            </article>
          </section>
        </SectionReveal>

        <footer id="chapter-8" class="references">
          <p>08 / Referencias del archivo</p>
          <span>Crónicas dinásticas</span>
          <span>Registros de maestres</span>
          <span>Canciones y testimonios</span>
          <span>Correspondencia política</span>
        </footer>
      </div>

      <!-- Sidebar InfoBox -->
      <aside class="chapter-sidebar">
        <InfoBox :title="`Casa ${house.name}`" :rows="infoboxRows">
          <template #footer>
            <RouterLink to="/houses" class="back-link">
              ← Volver a Casas
            </RouterLink>
          </template>
        </InfoBox>
      </aside>
    </div>
  </div>

  <div v-else style="padding: 200px 40px; text-align: center; color: var(--color-muted-foreground);">
    <p>Casa no encontrada.</p>
    <button
      @click="router.push('/houses')"
      style="margin-top: 16px; border: 0; border-bottom: 1px solid var(--house); background: none; color: var(--color-foreground); cursor: pointer; text-transform: uppercase; letter-spacing: 0.14em; font-size: 8px;"
    >
      Volver a Casas
    </button>
  </div>
</template>

<style scoped>
.chapter-content-layout {
  display: grid;
  grid-template-columns: 1fr 340px;
  gap: 0;
}

.chapter-main {
  min-width: 0;
}

.chapter-sidebar {
  border-left: 1px solid var(--border);
  padding: 40px 30px;
  position: sticky;
  top: calc(var(--header-height) + 20px);
  align-self: start;
  max-height: calc(100vh - var(--header-height) - 40px);
  overflow-y: auto;
}

.back-link {
  display: block;
  text-align: center;
  color: var(--house);
  text-decoration: none;
  font: 600 8px/1 var(--font-sans);
  text-transform: uppercase;
  letter-spacing: 0.14em;
  padding: 12px 0;
  transition: opacity 0.2s ease;
}

.back-link:hover {
  opacity: 0.7;
  text-decoration: underline;
}

.registry ol li a {
  color: inherit;
  text-decoration: none;
  font: 27px var(--font-serif);
  transition: color 0.25s ease;
}

.registry ol li a:hover {
  color: var(--house);
}

@media (max-width: 1100px) {
  .chapter-content-layout {
    grid-template-columns: 1fr;
  }

  .chapter-sidebar {
    border-left: none;
    border-top: 1px solid var(--border);
    position: static;
    max-height: none;
    padding: 40px clamp(24px, 7vw, 110px);
  }
}
</style>
