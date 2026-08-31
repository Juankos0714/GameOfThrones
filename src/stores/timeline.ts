import { create } from 'vue-zustand'
import type { TimelineEvent } from '@/types'
import { fetchEventsFromSupabase } from '@/services/data'

const TIMELINE_EVENTS: TimelineEvent[] = [
  {
    id: '1', title: 'La Conquista de los Siete Reinos',
    description: 'Aegon Targaryen y sus dragones unificaron seis reinos bajo una sola corona.',
    date: 0,
  },
  {
    id: '2', title: 'La Perdición de Valyria',
    description: 'La destrucción de la antigua Valyria, una civilización de dragones y magia.',
    date: -100,
  },
  {
    id: '3', title: 'El Torneo de Harrenhal',
    description: 'El gran torneo donde Rhaegar coronó a Lyanna como reina del amor y la belleza.',
    date: 281,
  },
  {
    id: '4', title: 'La Rebelión de Robert',
    description: 'La fuga de Rhaegar con Lyanna Stark desencadenó una guerra que derrocó a los Targaryen.',
    date: 282,
  },
  {
    id: '5', title: 'La Batalla del Tridente',
    description: 'La batalla decisiva de la rebelión donde Robert mató a Rhaegar.',
    date: 283,
  },
  {
    id: '6', title: 'El Saqueo de Desembarco del Rey',
    description: 'Las fuerzas Lannister entraron en la capital y saquearon la ciudad.',
    date: 283,
  },
  {
    id: '7', title: 'La Rebelión Greyjoy',
    description: 'Balon Greyjoy se rebeló contra el trono y fue aplastado.',
    date: 289,
  },
  {
    id: '8', title: 'La Batalla de Fair Isle',
    description: 'La batalla naval que destruyó la flota Greyjoy durante la rebelión.',
    date: 289,
  },
  {
    id: '9', title: 'La Batalla de los Campamentos',
    description: 'Robb Stark derrotó a las fuerzas Lannister y capturó a Jaime.',
    date: 299,
  },
  {
    id: '10', title: 'La Batalla de los Vados',
    description: 'Edmure Tully intentó detener el avance Lannister pero fue derrotado.',
    date: 299,
  },
  {
    id: '11', title: 'La Boda Roja',
    description: 'La traición más famosa de Poniente. Walder Frey y Roose Bolton masacraron a Robb Stark.',
    date: 299,
  },
  {
    id: '12', title: 'La Batalla del Aguas Negras',
    description: 'Stannis atacó Desembarco del Rey por mar y tierra.',
    date: 299,
  },
  {
    id: '13', title: 'La Danza de los Dragones',
    description: 'La guerra civil que destruyó la dinastía Targaryen.',
    date: 129,
  },
  {
    id: '14', title: 'El Campo de Fuego',
    description: 'Los dragones de Aegon destruyeron los ejércitos de los Reyes de la Roca y de la Tormenta.',
    date: 1,
  },
  {
    id: '15', title: 'La Conquista de Dorne',
    description: 'Dorne fue la única región que resistió la conquista Targaryen mediante guerrilla.',
    date: 13,
  },
  {
    id: '16', title: 'La Guerra de los Cinco Reyes',
    description: 'La guerra civil que siguió a la muerte de Robert.',
    date: 298,
  },
  {
    id: '17', title: 'La Caída de Invernalia',
    description: 'Theon Greyjoy capturó Invernalia en nombre de su padre.',
    date: 300,
  },
  {
    id: '18', title: 'La Destrucción del Septo de Baelor',
    description: 'Cersei destruyó el Septo de Baelor con fuego valyrio.',
    date: 300,
  },
  {
    id: '19', title: 'La Batalla de los Bastardos',
    description: 'Jon Nieve recuperó Invernalia de manos de Ramsay Bolton.',
    date: 300,
  },
  {
    id: '20', title: 'El Asedio de Bastión de Tormentas',
    description: 'Stannis defendió Bastión de Tormentas durante un asedio largo.',
    date: 282,
  },
  {
    id: '21', title: 'El Saqueo de Invernalia',
    description: 'Las fuerzas Bolton saquearon Invernalia después de recuperarla.',
    date: 300,
  },
  {
    id: '22', title: 'La Batalla del Castillo Negro',
    description: 'Jon Nieve defendió el Castillo Negro contra las fuerzas salvajes.',
    date: 300,
  },
]

interface TimelineState {
  events: TimelineEvent[]
  loading: boolean
  filterYear: number | null
  source: 'hardcoded' | 'supabase'
  setFilterYear: (year: number | null) => void
  fetchEvents: () => Promise<void>
}

export const useTimelineStore = create<TimelineState>((set) => ({
  events: TIMELINE_EVENTS,
  loading: false,
  filterYear: null,
  source: 'hardcoded',

  setFilterYear: (year: number | null) => set({ filterYear: year }),

  fetchEvents: async () => {
    set({ loading: true })
    try {
      const supabaseEvents = await fetchEventsFromSupabase()
      if (supabaseEvents && supabaseEvents.length > 0) {
        set({ events: supabaseEvents, source: 'supabase' })
        console.log(`[data] Loaded ${supabaseEvents.length} events from Supabase`)
      } else {
        set({ events: TIMELINE_EVENTS, source: 'hardcoded' })
        console.log('[data] Using hardcoded timeline data (Supabase not available)')
      }
    } catch {
      set({ events: TIMELINE_EVENTS, source: 'hardcoded' })
    } finally {
      set({ loading: false })
    }
  },
}))
