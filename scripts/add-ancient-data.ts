import * as fs from 'fs'
import { fileURLToPath } from 'url'
import * as path from 'path'

const __filename = fileURLToPath(import.meta.url)
const __dirname = path.dirname(__filename)
const DATA_DIR = path.join(__dirname, '..', 'data', 'extracted')

// === CHARACTERS ===
const chars: any[] = JSON.parse(fs.readFileSync(path.join(DATA_DIR, 'characters.json'), 'utf8'))
const existingNames = new Set(chars.map((c: any) => c.nombre))

const newChars = [
  // LEGENDARY FOUNDERS
  {
    nombre: 'Brandon el Constructor', alias: ['Brandon the Builder'], casa: 'Stark', cultura: 'Primeros Hombres',
    estado: 'muerto', nacimiento: null, muerte: null, padre: null, madre: null,
    conyuges: [], hijos: [], hermanos: [],
    descripcion: 'El legendario fundador de Invernalia y constructor del Muro. Se dice que tuvo ayuda de los hijos del bosque y los gigantes para levantar las fortificaciones más impresionantes de Poniente.'
  },
  {
    nombre: 'Garth Manoverde', alias: ['Garth Mano Verde', 'Garth el Verde'], casa: 'Gardener', cultura: 'Primeros Hombres',
    estado: 'muerto', nacimiento: null, muerte: null, padre: null, madre: null,
    conyuges: [], hijos: [], hermanos: [],
    descripcion: 'El legendario antepasado de la casa Gardener y de todas las grandes casas del Dominio. Se le atribuye haber enseñado a los hombres a cultivar la tierra. Su bolsa de semillas nunca se agotaba.'
  },
  {
    nombre: 'Lann el Astuto', alias: ['Lann the Clever'], casa: 'Lannister', cultura: 'Primeros Hombres',
    estado: 'muerto', nacimiento: null, muerte: null, padre: null, madre: null,
    conyuges: [], hijos: [], hermanos: [],
    descripcion: 'El legendario fundador de la casa Lannister que engañó a los Casterly para hacerse con Roca Casterly. Se decía que podía colarse por cualquier cerradura.'
  },
  {
    nombre: 'Durran Pesardedioses', alias: ['Durran Godsgrief'], casa: null, cultura: 'Primeros Hombres',
    estado: 'muerto', nacimiento: null, muerte: null, padre: null, madre: null,
    conyuges: [], hijos: [], hermanos: [],
    descripcion: 'El legendario fundador de las Tierras de la Tormenta que luchó contra los dioses del mar para construir Bastión de Tormentas.'
  },
  // TARGARYEN PRE-CONQUEST
  {
    nombre: 'Aenar Targaryen', alias: ['Aenar el Exiliado'], casa: 'Targaryen', cultura: 'Valyrio',
    estado: 'muerto', nacimiento: null, muerte: null, padre: null, madre: null,
    conyuges: [], hijos: [], hermanos: [],
    descripcion: 'El patriarca que huyó de Valyria con toda su familia doce años antes de la Maldición, siguiendo las profecías de su hija Daenys la Soñadora.'
  },
  {
    nombre: 'Daenys la Soñadora', alias: ['Daenys the Dreamer'], casa: 'Targaryen', cultura: 'Valyrio',
    estado: 'muerto', nacimiento: null, muerte: null, padre: 'Aenar Targaryen', madre: null,
    conyuges: [], hijos: [], hermanos: [],
    descripcion: 'La hija de Aenar Targaryen cuyas visiones proféticas salvaron a su familia de la destrucción de Valyria.'
  },
  {
    nombre: 'Gaemon Targaryen', alias: ['Gaemon el Glorioso'], casa: 'Targaryen', cultura: 'Valyrio',
    estado: 'muerto', nacimiento: null, muerte: null, padre: null, madre: null,
    conyuges: ['Daenys la Soñadora'], hijos: [], hermanos: [],
    descripcion: 'Hermano y esposo de Daenys la Soñadora, sucedió a Aenar como señor de Rocadragón y fue conocido por su gloria.'
  },
  {
    nombre: 'Aerion Targaryen', alias: [], casa: 'Targaryen', cultura: 'Valyrio',
    estado: 'muerto', nacimiento: null, muerte: null, padre: null, madre: null,
    conyuges: [], hijos: ['Aegon Targaryen'], hermanos: [],
    descripcion: 'El padre de Aegon el Conquistador, señor de Rocadragón.'
  },
  // PRE-CONQUEST KINGS
  {
    nombre: 'Torrhen Stark', alias: ['Torrhen el Suplicante'], casa: 'Stark', cultura: 'Norteño',
    estado: 'muerto', nacimiento: null, muerte: null, padre: null, madre: null,
    conyuges: [], hijos: [], hermanos: [],
    descripcion: 'El último Rey del Invierno que se arrodilló ante Aegon el Conquistador en lugar de luchar, ganándose el apodo de El Suplicante.'
  },
  {
    nombre: 'Theon Stark', alias: ['Theon el Hambriento'], casa: 'Stark', cultura: 'Norteño',
    estado: 'muerto', nacimiento: null, muerte: null, padre: null, madre: null,
    conyuges: [], hijos: [], hermanos: [],
    descripcion: 'Un Rey del Invierno conocido por su crueldad y su campaña contra los ándalos que invadían el Norte.'
  },
  {
    nombre: 'Cregan Stark', alias: [], casa: 'Stark', cultura: 'Norteño',
    estado: 'muerto', nacimiento: null, muerte: null, padre: null, madre: null,
    conyuges: [], hijos: [], hermanos: [],
    descripcion: 'Un Rey del Invierno de larguísimo reinado durante el cual se escribieron importantes crónicas sobre los túmulos del Norte.'
  },
  {
    nombre: 'Brandon el Rompehielo', alias: ['Brandon the Breaker'], casa: 'Stark', cultura: 'Norteño',
    estado: 'muerto', nacimiento: null, muerte: null, padre: null, madre: null,
    conyuges: [], hijos: [], hermanos: [],
    descripcion: 'Un Rey del Invierno que derrotó a los Caminantes Blancos y selló la paz con los hijos del bosque.'
  },
  {
    nombre: 'Argilac el Arrogante', alias: ['Argilac Durrandon'], casa: 'Durrandon', cultura: 'Andal',
    estado: 'muerto', nacimiento: null, muerte: null, padre: null, madre: null,
    conyuges: [], hijos: [], hermanos: [],
    descripcion: 'El último Rey de la Tormenta de la casa Durrandon. Su rechazo a la oferta de matrimonio de Aegon y el envío de las manos cortadas a Orys Baratheon provocó la Conquista.'
  },
  {
    nombre: 'Harren el Negro', alias: ['Harrenhal'], casa: 'Hoare', cultura: 'Islas de Hierro',
    estado: 'muerto', nacimiento: null, muerte: null, padre: null, madre: null,
    conyuges: [], hijos: [], hermanos: [],
    descripcion: 'El último Rey de las Islas y los Ríos de la casa Hoare. Construyó Harrenhal, el castillo más grande de Poniente, y fue destruido por los dragones de Aegon.'
  },
  {
    nombre: 'Orys Baratheon', alias: [], casa: 'Baratheon', cultura: 'Valyrio',
    estado: 'muerto', nacimiento: null, muerte: null, padre: null, madre: null,
    conyuges: [], hijos: [], hermanos: [],
    descripcion: 'Campeón y amigo de Aegon el Conquistador, posiblemente su hermano ilegítimo. Fundó la casa Baratheon tras conquistar Bastión de Tormentas.'
  },
  {
    nombre: 'Harwyn Manodura', alias: ['Harwyn Hardhand'], casa: 'Hoare', cultura: 'Islas de Hierro',
    estado: 'muerto', nacimiento: null, muerte: null, padre: null, madre: null,
    conyuges: [], hijos: [], hermanos: [],
    descripcion: 'El abuelo de Harren el Negro que arrebató el Tridente a los Ríos con la fuerza de su mano.'
  },
  {
    nombre: 'Tristifer IV Mudd', alias: ['Tristifer el Martillo'], casa: 'Mudd', cultura: 'Primeros Hombres',
    estado: 'muerto', nacimiento: null, muerte: null, padre: null, madre: null,
    conyuges: [], hijos: [], hermanos: [],
    descripcion: 'El último gran rey de los Ríos de la casa Mudd que defendió sus tierras contra los ándalos.'
  },
  {
    nombre: 'Qhored I', alias: ['Qhored el Grande'], casa: 'Hoare', cultura: 'Islas de Hierro',
    estado: 'muerto', nacimiento: null, muerte: null, padre: null, madre: null,
    conyuges: [], hijos: [], hermanos: [],
    descripcion: 'El más legendario de los Reyes del Hierro que gobernó desde Old Wyk y extendió el poder de las Islas por todo Poniente.'
  },
  {
    nombre: 'Qhorwyn el Bueno', alias: ['Qhorwyn the Good'], casa: 'Hoare', cultura: 'Islas de Hierro',
    estado: 'muerto', nacimiento: null, muerte: null, padre: null, madre: null,
    conyuges: [], hijos: [], hermanos: [],
    descripcion: 'Un Rey del Hierro conocido por su prudencia y por acumular riquezas en lugar de lanzar conquistas.'
  },
  {
    nombre: 'Gendel', alias: [], casa: null, cultura: 'Salvaje',
    estado: 'muerto', nacimiento: null, muerte: null, padre: null, madre: null,
    conyuges: [], hijos: [], hermanos: ['Gorne'],
    descripcion: 'Un héroe salvaje legendario que junto a su hermano Gorne medió en una disputa entre los hijos del bosque y los gigantes.'
  },
  {
    nombre: 'Gorne', alias: [], casa: null, cultura: 'Salvaje',
    estado: 'muerto', nacimiento: null, muerte: null, padre: null, madre: null,
    conyuges: [], hijos: [], hermanos: ['Gendel'],
    descripcion: 'El hermano de Gendel, un héroe salvaje que descubrió un sistema de cuevas que pasaba bajo el Muro.'
  },
  {
    nombre: 'Nymeria de los Rhoynar', alias: ['Nymeria'], casa: 'Martell', cultura: 'Rhoynar',
    estado: 'muerto', nacimiento: null, muerte: null, padre: null, madre: null,
    conyuges: ['Mors Martell'], hijos: [], hermanos: [],
    descripcion: 'La princesa guerrera rhoynar que huyó de Valyria con diez mil naves y se asentó en Dorne con los Martell. Gobernó Dorne durante veintisiete años.'
  },
  {
    nombre: 'Mors Martell', alias: [], casa: 'Martell', cultura: 'Dorniense',
    estado: 'muerto', nacimiento: null, muerte: null, padre: null, madre: null,
    conyuges: ['Nymeria de los Rhoynar'], hijos: [], hermanos: [],
    descripcion: 'El señor dorniense que se casó con Nymeria y unificó Dorne mediante la fuerza y la diplomacia.'
  },
  {
    nombre: 'Arrec Durrandon', alias: [], casa: 'Durrandon', cultura: 'Andal',
    estado: 'muerto', nacimiento: null, muerte: null, padre: null, madre: null,
    conyuges: [], hijos: [], hermanos: [],
    descripcion: 'El abuelo de Argilac, un Rey de la Tormenta cuyos antepasados habían derrocado al último rey de los Ríos.'
  },
  {
    nombre: 'Garse VII Gardener', alias: [], casa: 'Gardener', cultura: 'Andal',
    estado: 'muerto', nacimiento: null, muerte: null, padre: null, madre: null,
    conyuges: [], hijos: [], hermanos: [],
    descripcion: 'El último Rey del Dominio de la casa Gardener, asesinado por Argilac en la Batalla de Campoestivo.'
  },
]

let charsAdded = 0
for (const nc of newChars) {
  if (!existingNames.has(nc.nombre)) {
    chars.push(nc)
    charsAdded++
  }
}
fs.writeFileSync(path.join(DATA_DIR, 'characters.json'), JSON.stringify(chars, null, 2), 'utf8')
console.log(`Characters: +${charsAdded} new, total: ${chars.length}`)

// === LOCATIONS ===
const locs: any[] = JSON.parse(fs.readFileSync(path.join(DATA_DIR, 'locations.json'), 'utf8'))
const existingLocNames = new Set(locs.map((l: any) => l.nombre))

const newLocs = [
  {
    nombre: 'Valyria', region: 'Essos',
    descripcion: 'La antigua península y civilización más poderosa del mundo conocido, hogar de los señores dragón. Fue destruida por la Maldición, un cataclismo que arrasó las Catorce Llamas y todo el Feudo Franco.'
  },
  {
    nombre: 'Antiguo Ghis', region: 'Essos',
    descripcion: 'La primera gran civilización del mundo conocido, basada en la trata de esclavos. Fundada por Grazdan el Grande, creó las primeras legiones disciplinadas antes de ser destruida por los dragones valyrios.'
  },
  {
    nombre: 'Oros', region: 'Essos',
    descripcion: 'Una ciudad valyria en las afueras de la península, ahora inhabitada y cursed por la Maldición de Valyria.'
  },
  {
    nombre: 'Tyria', region: 'Essos',
    descripcion: 'Una antigua ciudad valyria cuyos restos permanecen en las ruinas de la península maldita.'
  },
  {
    nombre: 'Mantarys', region: 'Essos',
    descripcion: 'Una ciudad en el camino del Demonio donde, según se dice, los hombres nacen retorcidos y monstruosos.'
  },
  {
    nombre: 'Tolos', region: 'Essos',
    descripcion: 'Una ciudad conocida por tener las mejores hondas del mundo, situada en la bahía de los Esclavos.'
  },
  {
    nombre: 'Elyria', region: 'Essos',
    descripcion: 'Una ciudad insular en la bahía de los Esclavos que estableció lazos con las ciudades ghiscarias.'
  },
  {
    nombre: 'Antigua', region: 'Essos',
    descripcion: 'La gran ciudad que alberga el septo Estrellado de la Fe, la Ciudadela de los maestres y el Faro, la torre más alta del mundo conocido. Centro de la civilización en Essos.'
  },
  {
    nombre: 'Rhoynar', region: 'Essos',
    descripcion: 'Las tierras a lo largo del río Rhoyne, hogar de una civilización avanzada que fue destruida por la expansión valyria. Los supervivientes huyeron con Nymeria a Dorne.'
  },
  {
    nombre: 'Chroyane', region: 'Essos',
    descripcion: 'La Ciudad Festiva del río Rhoyne, destruida durante la Larga Noche cuando las aguas se congelaron.'
  },
  {
    nombre: 'Andalia', region: 'Essos',
    descripcion: 'El antiguo reino de los ándalos en las tierras del Hacha, desde donde partieron para conquistar Poniente.'
  },
  {
    nombre: 'Isla del Ojo de Dioses', region: 'Westeros',
    descripcion: 'Una isla sagrada donde los primeros hombres y los hijos del bosque sellaron el Pacto que puso fin a la Era del Amanecer.'
  },
  {
    nombre: 'Nuevo Ghis', region: 'Essos',
    descripcion: 'Una ciudad ghiscaria pujante pero pequeña que aspira a ser el Antiguo Ghis renacido, con legiones de hierro formadas por hombres libres.'
  },
  {
    nombre: 'Sarnor', region: 'Essos',
    descripcion: 'Una confederación de ciudades que sobrevivió a la expansión valyria gracias a su enorme llanura, pero cayó ante los dothrakis tras la Maldición.'
  },
]

let locsAdded = 0
for (const nl of newLocs) {
  if (!existingLocNames.has(nl.nombre)) {
    locs.push(nl)
    locsAdded++
  }
}
fs.writeFileSync(path.join(DATA_DIR, 'locations.json'), JSON.stringify(locs, null, 2), 'utf8')
console.log(`Locations: +${locsAdded} new, total: ${locs.length}`)

// === EVENTS ===
const events: any[] = JSON.parse(fs.readFileSync(path.join(DATA_DIR, 'events.json'), 'utf8'))
const existingEventTitles = new Set(events.map((e: any) => e.titulo))

const newEvents = [
  {
    titulo: 'La Era del Amanecer', anio: '-40000 AC', lugar: null,
    personajes_involucrados: [],
    descripcion: 'La primera era del mundo, poblada por tribus bárbaras, gigantes y los hijos del bosque. Los hombres no conocían la escritura ni el metal.'
  },
  {
    titulo: 'La llegada de los Primeros Hombres', anio: '-8000 AC', lugar: 'Brazo Roto',
    personajes_involucrados: [],
    descripcion: 'Los Primeros Hombres cruzaron el mar Angosto por el Brazo Roto y comenzaron a establecerse en Poniente, entrando en guerra con los hijos del bosque.'
  },
  {
    titulo: 'El Pacto', anio: '-8000 AC', lugar: 'Isla del Ojo de Dioses',
    personajes_involucrados: [],
    descripcion: 'Los Primeros Hombres y los hijos del bosque sellaron la paz en la isla del Ojo de Dioses, poniendo fin a siglos de guerra. Los hijos renunciaron a todas las tierras salvo los bosques.'
  },
  {
    titulo: 'La Edad de los Héroes', anio: '-8000 AC', lugar: null,
    personajes_involucrados: ['Brandon el Constructor', 'Garth Manoverde', 'Lann el Astuto', 'Durran Pesardedioses'],
    descripcion: 'Una era de miles de años durante la cual surgieron y desaparecieron reinos, se fundaron casas nobles y se realizaron grandes hazañas. Los nombres de sus reyes están envueltos en leyendas.'
  },
  {
    titulo: 'La Larga Noche', anio: '-8000 AC', lugar: null,
    personajes_involucrados: [],
    descripcion: 'Un invierno que duró toda una generación, oscuro y letal. Los Otros surgieron de las Tierras del Eterno Invierno y amenazaron con extinguir toda luz y calor.'
  },
  {
    titulo: 'La Batalla por el Amanecer', anio: '-8000 AC', lugar: null,
    personajes_involucrados: [],
    descripcion: 'El combate decisivo en el que los Primeros Hombres y los hijos del bosque unieron fuerzas para derrotar a los Otros y acabar con la Larga Noche.'
  },
  {
    titulo: 'La llegada de los Ándalos', anio: '-6000 AC', lugar: 'Brazo Roto',
    personajes_involucrados: [],
    descripcion: 'Los ándalos cruzaron el mar Angosto desde Andalia y conquistaron gran parte de Poniente, traendo la Fe de los Siete y las armas de hierro.'
  },
  {
    titulo: 'La llegada de los Rhoynar', anio: '-700 AC', lugar: 'Dorne',
    personajes_involucrados: ['Nymeria de los Rhoynar', 'Mors Martell'],
    descripcion: 'La princesa Nymeria huyó de Valyria con diez mil naves y se asentó en Dorne con los Martell, unificando la región.'
  },
  {
    titulo: 'La Maldición de Valyria', anio: '-114 AC', lugar: 'Valyria',
    personajes_involucrados: [],
    descripcion: 'Un cataclismo destruyó el Feudo Franco de Valyria y todo su imperio. Las Catorce Llamas erupcionaron simultáneamente, arrasando ciudades, palacios y dragones.'
  },
  {
    titulo: 'La Conquista de los Siete Reinos', anio: '0 AC', lugar: 'Desembarco del Rey',
    personajes_involucrados: ['Aegon Targaryen', 'Orys Baratheon', 'Argilac el Arrogante', 'Harren el Negro'],
    descripcion: 'Aegon Targaryen desembarcó en Poniente con sus tres dragones y en dos años conquistó seis de los siete reinos, excepto Dorne.'
  },
  {
    titulo: 'La Batalla de Campoestivo', anio: '-1 AC', lugar: null,
    personajes_involucrados: ['Argilac el Arrogante', 'Garse VII Gardener'],
    descripcion: 'Argilac el Arrogante derrotó y mató a Garse VII Gardener, eliminando la casa Gardener del Dominio.'
  },
  {
    titulo: 'El Torneo de Harrenhal', anio: '281 AC', lugar: 'Harrenhal',
    personajes_involucrados: ['Rhaegar Targaryen', 'Lyanna Stark', 'Robert Baratheon', 'Eddard Stark', 'Jaime Lannister', 'Aerys II Targaryen'],
    descripcion: 'El gran torneo donde Rhaegar coronó a Lyanna como reina del amor y la belleza, desencadenando los eventos que llevaron a la rebelión de Robert.'
  },
  {
    titulo: 'La Rebelión de Robert', anio: '282-283 AC', lugar: null,
    personajes_involucrados: ['Robert Baratheon', 'Eddard Stark', 'Aerys II Targaryen', 'Rhaegar Targaryen'],
    descripcion: 'La guerra que puso fin a casi trescientos años de gobierno Targaryen. Robert Baratheon derrotó a los Targaryen y se coronó rey.'
  },
  {
    titulo: 'La Batalla del Tridente', anio: '283 AC', lugar: 'Vado Rubí',
    personajes_involucrados: ['Robert Baratheon', 'Rhaegar Targaryen', 'Barristan Selmy'],
    descripcion: 'La batalla decisiva de la rebelión de Robert donde Rhaegar Targaryen murió a manos de Robert con un martillo en el Vado Rubí.'
  },
  {
    titulo: 'El Saqueo de Desembarco del Rey', anio: '283 AC', lugar: 'Desembarco del Rey',
    personajes_involucrados: ['Tywin Lannister', 'Aerys II Targaryen', 'Jaime Lannister'],
    descripcion: 'El ejército de Tywin Lannister saqueó Desembarco del Rey. Jaime Lannister mató al rey Aerys, ganándose el apodo de Matador de Reyes.'
  },
  {
    titulo: 'La Conquista de Dorne', anio: '1-13 AC', lugar: 'Dorne',
    personajes_involucrados: ['Aegon Targaryen'],
    descripcion: 'Los repetidos intentos de Aegon y sus hijos por integrar Dorne al reino, que permaneció independiente mediante guerrilla.'
  },
  {
    titulo: 'El Siglo Sangriento', anio: '-100 AC', lugar: null,
    personajes_involucrados: [],
    descripcion: 'El período de caos tras la Maldición de Valyria, cuando las ciudades libres luchaban entre sí y los señores dragón supervivientes eran asesinados.'
  },
]

let eventsAdded = 0
for (const ne of newEvents) {
  if (!existingEventTitles.has(ne.titulo)) {
    events.push(ne)
    eventsAdded++
  }
}
fs.writeFileSync(path.join(DATA_DIR, 'events.json'), JSON.stringify(events, null, 2), 'utf8')
console.log(`Events: +${eventsAdded} new, total: ${events.length}`)

// Summary
console.log('\n=== FINAL SUMMARY ===')
console.log(`Characters: ${chars.length}`)
console.log(`Locations: ${locs.length}`)
console.log(`Events: ${events.length}`)
