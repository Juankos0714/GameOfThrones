import { create } from 'vue-zustand'
import type { House } from '@/types'
import { fetchHousesFromSupabase } from '@/services/data'

const HOUSES_DATA: House[] = [
  {
    id: 'stark', slug: 'stark', name: 'Stark', motto: 'Se acerca el invierno',
    sigil: 'TreePine', region: 'El Norte', seat: 'Invernalia', founded: 'Edad de los Héroes',
    material: 'Hielo · piedra · memoria',
    summary: 'Una estirpe antigua que gobernó el Norte como Reyes del Invierno antes de inclinarse ante el dragón.',
    history: 'Su autoridad nace de una continuidad casi geológica: criptas, arcianos y juramentos conservan una memoria que precede a los Siete Reinos.',
    palette: { primary: '#9eb5c0', deep: '#111b20' },
    members: [
      { name: 'Eddard Stark', title: 'Cabeza de casa', status: 'deceased' },
      { name: 'Catelyn Stark', title: 'Señora de Invernalia', status: 'deceased' },
      { name: 'Sansa Stark', title: 'Reina del Norte', status: 'alive' },
      { name: 'Arya Stark', title: 'Princesa', status: 'alive' },
      { name: 'Bran Stark', title: 'Rey del Reino de los Seis', status: 'alive' },
      { name: 'Jon Nieve', title: 'Lord Comandante', status: 'alive' },
    ],
    allies: ['Mormont', 'Manderly', 'Reed'], rivals: ['Bolton', 'Lannister', 'Frey'],
    lands: ['Invernalia', 'El Muro', 'Bosque de los Lobos'],
    events: ['La llegada del rey', 'Guerra de los Cinco Reyes', 'La Boda Roja'],
  },
  {
    id: 'lannister', slug: 'lannister', name: 'Lannister', motto: 'Oye mi rugido',
    sigil: 'Crown', region: 'Tierras del Oeste', seat: 'Roca Casterly', founded: 'Edad de los Héroes',
    material: 'Oro · pergamino · deuda',
    summary: 'Una dinastía cuya riqueza mineral sostiene una maquinaria de alianzas, préstamos y silencios calculados.',
    history: 'De Lann el Astuto a Tywin, la casa convirtió la reputación en moneda y el matrimonio en una extensión de la guerra.',
    palette: { primary: '#b79b5e', deep: '#24140d' },
    members: [
      { name: 'Tywin Lannister', title: 'Cabeza de casa', status: 'deceased' },
      { name: 'Cersei Lannister', title: 'Reina', status: 'deceased' },
      { name: 'Jaime Lannister', title: 'Reylorente', status: 'deceased' },
      { name: 'Tyrion Lannister', title: 'Mano del Rey', status: 'alive' },
      { name: 'Kevan Lannister', title: 'Regente', status: 'deceased' },
    ],
    allies: ['Lefford', 'Marbrand', 'Crakehall'], rivals: ['Stark', 'Tully', 'Martell'],
    lands: ['Roca Casterly', 'Lannisport', 'Colmillo Dorado'],
    events: ['Saqueo de Desembarco', 'Muerte de Robert', 'Batalla del Aguasnegras'],
  },
  {
    id: 'targaryen', slug: 'targaryen', name: 'Targaryen', motto: 'Fuego y sangre',
    sigil: 'Flame', region: 'Rocadragón', seat: 'Rocadragón', founded: 'Antigua Valyria',
    material: 'Obsidiana · ceniza · sangre',
    summary: 'La última gran sangre de Valyria unificó seis reinos mediante dragones y dejó una corona marcada por profecía y ruina.',
    history: 'La Conquista alteró el calendario político de Poniente; la Danza y la Rebelión mostraron el precio de una soberanía ligada al fuego.',
    palette: { primary: '#a84a40', deep: '#230d0b' },
    members: [
      { name: 'Daenerys Targaryen', title: 'Madre de Dragones', status: 'deceased' },
      { name: 'Viserys Targaryen', title: 'Rey mendicante', status: 'deceased' },
      { name: 'Rhaegar Targaryen', title: 'Príncipe de Rocadragón', status: 'deceased' },
      { name: 'Aegon I', title: 'El Conquistador', status: 'deceased' },
      { name: 'Aemon Targaryen', title: 'Maestre del Cuervo', status: 'deceased' },
    ],
    allies: ['Velaryon', 'Mormont', 'Sangre de dragón'], rivals: ['Baratheon', 'Lannister', 'Usurpadores'],
    lands: ['Rocadragón', 'Desembarco del Rey', 'Bahía de los Esclavos'],
    events: ['La Conquista', 'Danza de los Dragones', 'Rebelión de Robert'],
  },
  {
    id: 'baratheon', slug: 'baratheon', name: 'Baratheon', motto: 'Nuestra es la furia',
    sigil: 'Swords', region: 'Tierras de la Tormenta', seat: 'Bastión de Tormentas', founded: 'La Conquista',
    material: 'Hierro · lluvia · trueno',
    summary: 'Forjada entre la tormenta y la conquista, su línea convirtió una rebelión victoriosa en una dinastía fracturada.',
    history: 'Orys Baratheon fundó la casa sobre la herencia Durrandon. Siglos después, Robert tomó el Trono de Hierro y sus hermanos disputaron sus restos.',
    palette: { primary: '#b29a55', deep: '#15191b' },
    members: [
      { name: 'Robert Baratheon', title: 'Rey de los Siete Reinos', status: 'deceased' },
      { name: 'Stannis Baratheon', title: 'Rey de Poniente', status: 'deceased' },
      { name: 'Renly Baratheon', title: 'Señor de Bastión de Tormentas', status: 'deceased' },
      { name: 'Shireen Baratheon', title: 'Princesa', status: 'deceased' },
    ],
    allies: ['Estermont', 'Florent', 'Tarth'], rivals: ['Targaryen', 'Lannister', 'Tyrell'],
    lands: ['Bastión de Tormentas', 'Rocadragón', 'Bosque Real'],
    events: ['Rebelión de Robert', 'Muerte del rey', 'Batalla del Aguasnegras'],
  },
  {
    id: 'tyrell', slug: 'tyrell', name: 'Tyrell', motto: 'Crecer fuerte',
    sigil: 'Flower2', region: 'El Dominio', seat: 'Altojardín', founded: 'La Conquista',
    material: 'Vitela · espino · perfume',
    summary: 'Administradores elevados a grandes señores, transformaron cosechas, cortesía y belleza en instrumentos de poder.',
    history: 'Su ascenso tras la caída de los Gardener alimentó una política flexible: alimentar al reino significaba poder cerrarle el granero.',
    palette: { primary: '#859b6b', deep: '#11190f' },
    members: [
      { name: 'Olenna Tyrell', title: 'Viuda Roja', status: 'deceased' },
      { name: 'Mace Tyrell', title: 'Cabeza de casa', status: 'deceased' },
      { name: 'Margaery Tyrell', title: 'Reina', status: 'deceased' },
      { name: 'Loras Tyrell', title: 'Caballero de las Flores', status: 'deceased' },
    ],
    allies: ['Redwyne', 'Hightower', 'Tarly'], rivals: ['Martell', 'Lannister', 'Florent'],
    lands: ['Altojardín', 'Antigua', 'El Rejo'],
    events: ['Torneo de Renly', 'Alianza real', 'Boda Púrpura'],
  },
  {
    id: 'martell', slug: 'martell', name: 'Martell', motto: 'Nunca doblegado, nunca roto',
    sigil: 'Flame', region: 'Dorne', seat: 'Lanza del Sol', founded: 'Hace mil años',
    material: 'Arenisca · cobre · sol',
    summary: 'Dorne resistió la conquista por dragón y entró en los Siete Reinos mediante matrimonio, no rendición.',
    history: 'La unión de Nymeria y Mors Martell creó una cultura política singular, donde hereda el primogénito sin distinción de sexo.',
    palette: { primary: '#b9794f', deep: '#25150d' },
    members: [
      { name: 'Doran Martell', title: 'Príncipe de Dorne', status: 'deceased' },
      { name: 'Oberyn Martell', title: 'La Víbora Roja', status: 'deceased' },
      { name: 'Arianne Martell', title: 'Heredera de Dorne', status: 'alive' },
      { name: 'Quentyn Martell', title: 'Príncipe', status: 'deceased' },
    ],
    allies: ['Yronwood', 'Dayne', 'Sangreverde'], rivals: ['Tyrell', 'Lannister', 'Gregor Clegane'],
    lands: ['Lanza del Sol', 'Jardines del Agua', 'Campoestrella'],
    events: ['Guerra de Nymeria', 'Saqueo de Desembarco', 'Juicio de Tyrion'],
  },
  {
    id: 'greyjoy', slug: 'greyjoy', name: 'Greyjoy', motto: 'Nosotros no sembramos',
    sigil: 'Anchor', region: 'Islas del Hierro', seat: 'Pyke', founded: 'Edad de los Héroes',
    material: 'Sal · hierro · carta náutica',
    summary: 'Señores de un archipiélago severo cuya antigua costumbre mide la riqueza por aquello que puede tomarse.',
    history: 'Elegidos tras la caída de Harren, los Greyjoy preservaron la memoria de reyes de sal y roca en repetidas rebeliones.',
    palette: { primary: '#76959e', deep: '#0e191c' },
    members: [
      { name: 'Balon Greyjoy', title: 'Rey de las Islas del Hierro', status: 'deceased' },
      { name: 'Asha Greyjoy', title: 'Princesa', status: 'alive' },
      { name: 'Theon Greyjoy', title: 'Señor de Pyke', status: 'alive' },
      { name: 'Euron Greyjoy', title: 'Rey de los Hierro', status: 'deceased' },
      { name: 'Victarion Greyjoy', title: 'Almirante', status: 'alive' },
    ],
    allies: ['Harlaw', 'Botley', 'Goodbrother'], rivals: ['Stark', 'Lannister', 'Redwyne'],
    lands: ['Pyke', 'Gran Wyk', 'Viejo Wyk'],
    events: ['Rebelión Greyjoy', 'Ataque a Invernalia', 'Asamblea de Sucesión'],
  },
  {
    id: 'arryn', slug: 'arryn', name: 'Arryn', motto: 'Tan alto como el honor',
    sigil: 'Mountain', region: 'El Valle', seat: 'Nido de Águilas', founded: 'Invasión ándala',
    material: 'Mármol · viento · altitud',
    summary: 'Una línea ándala protegida por pasos de montaña y una fortaleza que convierte el aislamiento en doctrina.',
    history: 'Los Arryn reinaron en Montaña y Valle antes de la Conquista. Jon Arryn hizo del pupilaje una alianza que derribó una dinastía.',
    palette: { primary: '#a9bbc3', deep: '#121a1e' },
    members: [
      { name: 'Jon Arryn', title: 'Señor del Nido de Águilas', status: 'deceased' },
      { name: 'Lysa Arryn', title: 'Señora del Valle', status: 'deceased' },
      { name: 'Robert Arryn', title: 'Señor del Valle', status: 'alive' },
      { name: 'Harrold Hardyng', title: 'Heredero', status: 'alive' },
    ],
    allies: ['Royce', 'Waynwood', 'Corbray'], rivals: ['Clanes de la montaña', 'Baelish', 'Targaryen'],
    lands: ['Nido de Águilas', 'Puertas de la Luna', 'Puerto Gaviota'],
    events: ['Rebelión de Robert', 'Muerte de Jon Arryn', 'Regencia del Valle'],
  },
  {
    id: 'tully', slug: 'tully', name: 'Tully', motto: 'Familia, deber, honor',
    sigil: 'Waves', region: 'Tierras de los Ríos', seat: 'Aguasdulces', founded: 'Edad de los Héroes',
    material: 'Tinta · agua · frontera',
    summary: 'Una casa central en una región sin defensas naturales, obligada a convertir parentesco y deber en murallas.',
    history: 'Elevados por Aegon tras rebelarse contra Harren, los Tully quedaron unidos a Stark y Arryn por la alianza matrimonial de Robert.',
    palette: { primary: '#7794a5', deep: '#111a20' },
    members: [
      { name: 'Hoster Tully', title: 'Cabeza de casa', status: 'deceased' },
      { name: 'Catelyn Stark', title: 'Señora de Invernalia', status: 'deceased' },
      { name: 'Edmure Tully', title: 'Señor de Aguasdulces', status: 'alive' },
      { name: 'Brynden Tully', title: 'El Pez Negro', status: 'deceased' },
    ],
    allies: ['Stark', 'Arryn', 'Mallister'], rivals: ['Frey', 'Lannister', 'Harrenhal'],
    lands: ['Aguasdulces', 'Los Gemelos', 'Forca Roja'],
    events: ['Alianza de Aguasdulces', 'Guerra de los Cinco Reyes', 'La Boda Roja'],
  },
]

interface HousesState {
  houses: House[]
  selectedId: string
  loading: boolean
  error: string | null
  source: 'hardcoded' | 'supabase'
  setSelectedHouse: (id: string) => void
  fetchHouses: () => Promise<void>
}

export const useHousesStore = create<HousesState>((set, _get) => ({
  houses: HOUSES_DATA,
  selectedId: 'stark',
  loading: false,
  error: null,
  source: 'hardcoded',

  setSelectedHouse: (id: string) => set({ selectedId: id }),

  fetchHouses: async () => {
    set({ loading: true, error: null })
    try {
      const supabaseHouses = await fetchHousesFromSupabase()
      if (supabaseHouses && supabaseHouses.length > 0) {
        set({ houses: supabaseHouses, source: 'supabase' })
        console.log(`[data] Loaded ${supabaseHouses.length} houses from Supabase`)
      } else {
        set({ houses: HOUSES_DATA, source: 'hardcoded' })
        console.log('[data] Using hardcoded house data (Supabase not available)')
      }
    } catch (e: unknown) {
      set({ houses: HOUSES_DATA, source: 'hardcoded', error: e instanceof Error ? e.message : 'Error fetching houses' })
    } finally {
      set({ loading: false })
    }
  },
}))
