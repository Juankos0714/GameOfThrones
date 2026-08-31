<script setup lang="ts">
import { useHouses, useTheme, useBooks, useTimeline } from '@/composables'
import { useUiStore } from '@/stores/ui'
import { cn, padNumber } from '@/utils'
import { ref, computed } from 'vue'
import { Motion } from 'motion-v'
import {
  Shield,
  Crown,
  Flame,
  TreePine,
  Waves,
  Mountain,
  Anchor,
  Flower2,
  Swords,
  ChevronDown,
  BookOpen,
} from 'lucide-vue-next'

const { houses, selectedHouse, selectHouse } = useHouses()
const { activeHouseClass } = useTheme()
const { sortedBooks } = useBooks()
const { events: timelineEvents } = useTimeline()
const uiStore = useUiStore()

const chapters = [
  'Identidad',
  'Historia',
  'Sangre',
  'Miembros',
  'Política',
  'Territorios',
  'Acontecimientos',
  'Referencias',
]

const iconMap: Record<string, any> = {
  TreePine,
  Crown,
  Flame,
  Swords,
  Flower2,
  Anchor,
  Mountain,
  Waves,
}

function getIcon(sigil: string) {
  return iconMap[sigil] ?? Shield
}

function goTo(id: string) {
  document.getElementById(id)?.scrollIntoView({ behavior: 'smooth' })
}

const memberCount = computed(() => {
  return selectedHouse.value?.members.length ?? 0
})

const activeIcon = computed(() => getIcon(selectedHouse.value.sigil))

const houseIndex = computed(() =>
  houses.value.map((h, i) => ({
    ...h,
    index: String(i + 1).padStart(2, '0'),
    Icon: getIcon(h.sigil),
  }))
)
</script>

<template>
  <div>
    <!-- OPENING / HERO -->
    <section id="inicio" class="opening">
      <Motion
        :initial="{ opacity: 0 }"
        :animate="{ opacity: 1 }"
        :transition="{ duration: 0.8, delay: 0.1 }"
        class="folio"
      >FOL. I — EDICIÓN DEL MAESTRE</Motion>

      <div class="opening-title">
        <Motion
          :initial="{ opacity: 0, y: 20 }"
          :animate="{ opacity: 1, y: 0 }"
          :transition="{ duration: 0.7, delay: 0.2, ease: [0.25, 0.1, 0.25, 1] }"
        >
          <p>Crónicas de los Siete Reinos</p>
        </Motion>
        <Motion
          :initial="{ opacity: 0, y: 30 }"
          :animate="{ opacity: 1, y: 0 }"
          :transition="{ duration: 0.9, delay: 0.4, ease: [0.25, 0.1, 0.25, 1] }"
        >
          <h1>
            La memoria<br />
            es el último<br />
            <em>reino.</em>
          </h1>
        </Motion>
      </div>

      <Motion
        :initial="{ opacity: 0, y: 15 }"
        :animate="{ opacity: 1, y: 0 }"
        :transition="{ duration: 0.7, delay: 0.7 }"
        class="opening-note"
      >
        <span>I</span>
        <p>
          Un archivo crítico de linajes, territorios, juramentos y guerras.
          Ningún relato es inocente; toda historia tiene un heredero.
        </p>
        <button @click="goTo('casas')">
          Abrir el códice
          <ChevronDown />
        </button>
      </Motion>

      <Motion
        :initial="{ opacity: 0, scale: 0.9 }"
        :animate="{ opacity: 1, scale: 1 }"
        :transition="{ duration: 1, delay: 0.9 }"
        class="opening-seal"
      >
        <Shield />
        <span>298–300 d.C.</span>
      </Motion>
    </section>

    <!-- CATALOGUE / HOUSES -->
    <section id="casas" class="catalogue">
      <Motion
        as="header"
        class="editorial-head"
        :initial="{ opacity: 0, y: 25 }"
        :whileInView="{ opacity: 1, y: 0 }"
        :transition="{ duration: 0.6 }"
        :viewport="{ once: true, margin: '-80px' }"
      >
        <span>01 / Los grandes linajes</span>
        <h2>
          Casas de<br />
          Poniente
        </h2>
        <p>
          Nueve archivos dinásticos. Seleccione un nombre para alterar la
          materia del códice y consultar su monografía.
        </p>
      </Motion>

      <div class="house-index" role="list">
        <Motion
          v-for="house in houseIndex"
          :key="house.id"
          as="button"
          role="listitem"
          layout
          :class="cn(house.id === selectedHouse.id && 'active')"
          :aria-pressed="house.id === selectedHouse.id"
          :whileHover="{ x: 14 }"
          :whileTap="{ scale: 0.995 }"
          :transition="{ layout: { type: 'tween', duration: 0.3 }, default: { type: 'tween', duration: 0.2 } }"
          @click="selectHouse(house.id)"
        >
          <span class="index-no">{{ house.index }}</span>
          <component :is="house.Icon" />
          <span class="index-name">{{ house.name }}</span>
          <span class="index-region">{{ house.region }}</span>
          <span class="index-words">"{{ house.motto }}"</span>
          <span class="arrow" aria-hidden="true">→</span>
        </Motion>
      </div>
    </section>

    <!-- MONOGRAPH (Selected house detail) -->
    <article class="monograph" aria-live="polite">
      <!-- Hero -->
      <header class="monograph-hero">
        <Motion
          class="giant-mark"
          :initial="{ opacity: 0, scale: 0.85 }"
          :animate="{ opacity: 1, scale: 1 }"
          :transition="{ duration: 0.8, delay: 0.2, ease: [0.25, 0.1, 0.25, 1] }"
        >
          <component :is="activeIcon" />
        </Motion>
        <div>
          <Motion
            :initial="{ opacity: 0, y: 15 }"
            :animate="{ opacity: 1, y: 0 }"
            :transition="{ duration: 0.6, delay: 0.3 }"
          >
            <p>Archivo dinástico · {{ selectedHouse.region }}</p>
          </Motion>
          <Motion
            :initial="{ opacity: 0, y: 20 }"
            :animate="{ opacity: 1, y: 0 }"
            :transition="{ duration: 0.7, delay: 0.45 }"
          >
            <h2>
              Casa<br />
              {{ selectedHouse.name }}
            </h2>
          </Motion>
          <Motion
            :initial="{ opacity: 0 }"
            :animate="{ opacity: 1 }"
            :transition="{ duration: 0.6, delay: 0.65 }"
          >
            <blockquote>"{{ selectedHouse.motto }}"</blockquote>
          </Motion>
        </div>
        <dl>
          <div>
            <dt>Sede</dt>
            <dd>{{ selectedHouse.seat }}</dd>
          </div>
          <div>
            <dt>Origen</dt>
            <dd>{{ selectedHouse.founded }}</dd>
          </div>
          <div>
            <dt>Materia</dt>
            <dd>{{ selectedHouse.material }}</dd>
          </div>
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

      <!-- Chapter 01: Identidad -->
      <section id="chapter-1" class="chapter statement">
        <span>01</span>
        <div>
          <p class="label">Identidad</p>
          <h3>{{ selectedHouse.summary }}</h3>
        </div>
      </section>

      <!-- Chapter 02: Historia -->
      <section id="chapter-2" class="chapter history">
        <aside>
          <p>Nota del archivero</p>
          <span>
            Las crónicas de una casa son también la versión que esa casa
            consiguió preservar.
          </span>
        </aside>
        <div>
          <p class="label">02 / Historia</p>
          <h3>Una soberanía escrita sobre piedra y sangre.</h3>
          <p>{{ selectedHouse.history }}</p>
          <p>
            Su lema actúa como doctrina pública: resume una promesa a vasallos y
            una advertencia a rivales.
          </p>
        </div>
      </section>

      <!-- Chapter 03: Sangre y sucesión -->
      <section id="chapter-3" class="chapter lineage">
        <div class="chapter-title">
          <p class="label">03 / Sangre y sucesión</p>
          <h3>Árbol del linaje</h3>
        </div>
        <div class="lineage-scroll">
          <div class="tree">
            <span>{{ selectedHouse.members[0]?.name }}</span>
            <i />
            <div>
              <span
                v-for="member in selectedHouse.members.slice(1)"
                :key="member.name"
              >
                {{ member.name }}
              </span>
            </div>
          </div>
        </div>
      </section>

      <!-- Chapter 04: Miembros -->
      <section id="chapter-4" class="chapter registry">
        <div class="chapter-title">
          <p class="label">04 / Miembros</p>
          <h3>Figuras registradas</h3>
        </div>
        <ol>
          <li v-for="(member, i) in selectedHouse.members" :key="member.name">
            <b>{{ padNumber(i + 1) }}</b>
            <span>{{ member.name }}</span>
            <small>{{
              i === 0 ? 'Cabeza o figura histórica' : member.title
            }}</small>
          </li>
        </ol>
      </section>

      <!-- Chapter 05: Política -->
      <section id="chapter-5" class="chapter politics">
        <div>
          <p class="label">05 / Red política</p>
          <h3>Juramentos y enemistades</h3>
        </div>
        <div class="political-list">
          <p>Aliados</p>
          <span v-for="ally in selectedHouse.allies" :key="ally">
            + {{ ally }}
          </span>
        </div>
        <div class="political-list rivals">
          <p>Rivales</p>
          <span v-for="rival in selectedHouse.rivals" :key="rival">
            — {{ rival }}
          </span>
        </div>
      </section>

      <!-- Chapter 06: Territorios -->
      <section id="chapter-6" class="chapter territories">
        <div>
          <p class="label">06 / Territorios</p>
          <h3>Dominio y frontera</h3>
        </div>
        <div class="contour" aria-label="Carta territorial estilizada">
          <component :is="activeIcon" />
          <span
            v-for="(land, i) in selectedHouse.lands"
            :key="land"
            :style="{
              left: `${18 + i * 30}%`,
              top: `${65 - i * 18}%`,
            }"
          >
            {{ land }}
          </span>
        </div>
      </section>

      <!-- Chapter 07: Acontecimientos -->
      <section id="chapter-7" class="chapter events">
        <div class="chapter-title">
          <p class="label">07 / Acontecimientos</p>
          <h3>Hechos que alteraron el linaje</h3>
        </div>
        <article v-for="(event, i) in selectedHouse.events" :key="event">
          <time>{{ 298 + i }} d.C.</time>
          <h4>{{ event }}</h4>
          <p>
            Registro cruzado en las crónicas del reino y testimonios de sus
            contemporáneos.
          </p>
        </article>
      </section>

      <!-- Chapter 08: Referencias -->
      <footer id="chapter-8" class="references">
        <p>08 / Referencias del archivo</p>
        <span>Crónicas dinásticas</span>
        <span>Registros de maestres</span>
        <span>Canciones y testimonios</span>
        <span>Correspondencia política</span>
      </footer>
    </article>

    <!-- ATLAS -->
    <section id="atlas" class="atlas">
      <Motion
        as="header"
        class="editorial-head inverse"
        :initial="{ opacity: 0, y: 25 }"
        :whileInView="{ opacity: 1, y: 0 }"
        :transition="{ duration: 0.6 }"
        :viewport="{ once: true, margin: '-80px' }"
      >
        <span>02 / Atlas del reino</span>
        <h2>
          Todo está<br />
          conectado
        </h2>
        <p>Personas, lugares y sangre forman una sola cartografía política.</p>
      </Motion>

      <div class="atlas-grid">
        <article>
          <Crown />
          <p>Personajes</p>
          <h3>Vidas bajo escrutinio</h3>
          <span>{{ memberCount * 10 + 6 }} expedientes indexados</span>
        </article>
        <article>
          <Mountain />
          <p>Cartografía</p>
          <h3>El reino medido</h3>
          <span>9 regiones · 34 fortalezas</span>
        </article>
        <article>
          <Waves />
          <p>Genealogías</p>
          <h3>La sangre recuerda</h3>
          <span>17 líneas de sucesión</span>
        </article>
      </div>
    </section>

    <!-- CHRONOLOGY -->
    <Motion
      as="section"
      id="cronologia"
      class="chronology"
      :initial="{ opacity: 0, y: 25 }"
      :whileInView="{ opacity: 1, y: 0 }"
      :transition="{ duration: 0.6 }"
      :viewport="{ once: true, margin: '-80px' }"
    >
      <p class="label">03 / Cronología comparada</p>
      <h2>
        Antes y después<br />
        de la corona
      </h2>
      <div class="timeline-scroll">
        <article v-for="event in timelineEvents" :key="event.id">
          <time>{{ event.date }} d.C.</time>
          <i />
          <p>{{ event.title }}</p>
        </article>
      </div>
    </Motion>

    <!-- MYSTERIES / FORBIDDEN -->
    <section id="misterios" class="forbidden">
      <div class="forbidden-mark">?</div>
      <div>
        <p class="label">04 / Cámara restringida</p>
        <h2>
          Lo que los maestres<br />
          <em>no pueden probar.</em>
        </h2>
        <p>
          Profecías, identidades veladas y relatos contradictorios. Cada ficha
          separa documento, evidencia, interpretación y teoría.
        </p>
        <div class="evidence-key">
          <span>Canon</span>
          <span>Evidencia</span>
          <span>Interpretación</span>
          <span>Teoría</span>
          <span>Sin resolver</span>
        </div>
      </div>
    </section>

    <!-- VOLUMES / BOOKS -->
    <section id="libros" class="volumes">
      <header>
        <p class="label">05 / Fuentes primarias</p>
        <h2>Los cinco volúmenes</h2>
      </header>
      <div>
        <article v-for="(book, i) in sortedBooks" :key="book.id">
          <span>{{ padNumber(i + 1) }}</span>
          <BookOpen />
          <h3>{{ book.title }}</h3>
          <p>Capítulos · POV · lugares · hechos</p>
        </article>
      </div>
    </section>
  </div>
</template>
