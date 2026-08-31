import { create } from 'vue-zustand'
import type { TimelineEvent } from '@/types'

const TIMELINE_EVENTS: TimelineEvent[] = [
  {
    id: '1',
    title: 'La Conquista de los Siete Reinos',
    description: 'Aegon Targaryen y sus dragones unificaron seis reinos bajo una sola corona. La Conquista alteró el calendario político de Poniente y estableció la dinastía que gobernaría durante siglos.',
    date: 0,
  },
  {
    id: '2',
    title: 'La Perdición de Valyria',
    description: 'La destrucción de la antigua Valyria, una civilización de dragones y magia. El evento dejó cicatrices en todo el mundo conocido.',
    date: -100,
  },
  {
    id: '3',
    title: 'El Torneo de Harrenhal',
    description: 'El gran torneo donde Rhaegar coronó a Lyanna como reina del amor y la belleza en lugar de a su esposa. Este acto fue el inicio de la rebelión.',
    date: 281,
  },
  {
    id: '4',
    title: 'La Rebelión de Robert',
    description: 'La fuga de Rhaegar con Lyanna Stark desencadenó una guerra que derrocó a la dinastía Targaryen. Robert Baratheon ascendió al trono tras la muerte del rey loco.',
    date: 282,
  },
  {
    id: '5',
    title: 'La Batalla del Tridente',
    description: 'La batalla decisiva de la rebelión donde Robert mató a Rhaegar. Su martillo destrozó el pecho del príncipe y terminó con la esperanza Targaryen.',
    date: 283,
  },
  {
    id: '6',
    title: 'El Saqueo de Desembarco del Rey',
    description: 'Las fuerzas Lannister entraron en la capital y saquearon la ciudad. La princesa Elia y sus hijos fueron asesinados.',
    date: 283,
  },
  {
    id: '7',
    title: 'La Rebelión Greyjoy',
    description: 'Balon Greyjoy se rebeló contra el trono y fue aplastado. Su hijo Theon fue enviado a Invernalia como rehén.',
    date: 289,
  },
  {
    id: '8',
    title: 'La Batalla de Fair Isle',
    description: 'La batalla naval que destruyó la flota Greyjoy durante la rebelión.',
    date: 289,
  },
  {
    id: '9',
    title: 'La Batalla de los Campamentos',
    description: 'Robb Stark derrotó a las fuerzas Lannister y capturó a Jaime.',
    date: 299,
  },
  {
    id: '10',
    title: 'La Batalla de los Vados',
    description: 'Edmure Tully intentó detener el avance Lannister pero fue derrotado.',
    date: 299,
  },
  {
    id: '11',
    title: 'La Boda Roja',
    description: 'La traición más famosa de Poniente. Walder Frey y Roose Bolton masacraron a Robb Stark, a su madre y a sus hombres durante una boda que debía ser de celebración.',
    date: 299,
  },
  {
    id: '12',
    title: 'La Batalla del Aguas Negras',
    description: 'Stannis atacó Desembarco del Rey por mar y tierra. Tyrion lideró la defensa con fuego griego y la llegada de los Tyrell cambió el curso de la batalla.',
    date: 299,
  },
  {
    id: '13',
    title: 'La Danza de los Dragones',
    description: 'La guerra civil que destruyó la dinastía Targaryen. Dos bandos de la misma familia se enfrentaron por el trono con dragones.',
    date: 129,
  },
  {
    id: '14',
    title: 'El Campo de Fuego',
    description: 'La batalla donde los dragones de Aegon destruyeron los ejércitos de los Reyes de la Roca y de la Tormenta. Fue el fin de la resistencia a la Conquista.',
    date: 1,
  },
  {
    id: '15',
    title: 'La Conquista de Dorne',
    description: 'Dorne fue la única región que resistió la conquista Targaryen mediante guerrilla. Finalmente se unió por matrimonio.',
    date: 13,
  },
  {
    id: '16',
    title: 'La Guerra de los Cinco Reyes',
    description: 'La guerra civil que siguió a la muerte de Robert. Cinco reyes se disputaron el trono, pero solo uno sobrevivió.',
    date: 298,
  },
  {
    id: '17',
    title: 'La Caída de Invernalia',
    description: 'Theon Greyjoy capturó Invernalia en nombre de su padre, pero Ramsay Bolton la recuperó y la destruyó.',
    date: 300,
  },
  {
    id: '18',
    title: 'La Destrucción del Septo de Baelor',
    description: 'Cersei destruyó el Septo de Baelor con fuego valyrio para eliminar a sus enemigos. Margaery, Loras y miles de personas murieron.',
    date: 300,
  },
  {
    id: '19',
    title: 'La Batalla de los Bastardos',
    description: 'Jon Nieve recuperó Invernalia de manos de Ramsay Bolton con la ayuda de los Vale. La batalla fue sangrienta pero decisiva.',
    date: 300,
  },
  {
    id: '20',
    title: 'El Asedio de Bastión de Tormentas',
    description: 'Stannis defendió Bastión de Tormentas durante un asedio largo y hambriento. La llegada de Ned Stark alivió el asedio.',
    date: 282,
  },
  {
    id: '21',
    title: 'El Saqueo de Invernalia',
    description: 'Las fuerzas Bolton saquearon Invernalia después de recuperarla de los Greyjoy.',
    date: 300,
  },
  {
    id: '22',
    title: 'La Batalla del Castillo Negro',
    description: 'Jon Nieve defendió el Castillo Negro contra las fuerzas salvajes mientras Stannis llegaba como refuerzo.',
    date: 300,
  },
]

interface TimelineState {
  events: TimelineEvent[]
  loading: boolean
  filterYear: number | null
  setFilterYear: (year: number | null) => void
}

export const useTimelineStore = create<TimelineState>((set) => ({
  events: TIMELINE_EVENTS,

  loading: false,
  filterYear: null,

  setFilterYear: (year: number | null) => set({ filterYear: year }),
}))
