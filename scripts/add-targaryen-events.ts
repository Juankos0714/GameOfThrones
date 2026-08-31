import * as fs from 'fs'
import { fileURLToPath } from 'url'
import * as path from 'path'

const __filename = fileURLToPath(import.meta.url)
const __dirname = path.dirname(__filename)
const DATA_DIR = path.join(__dirname, '..', 'data', 'extracted')

// === CHARACTERS - Dance of the Dragons & Blackfyre ===
const chars: any[] = JSON.parse(fs.readFileSync(path.join(DATA_DIR, 'characters.json'), 'utf8'))
const existingNames = new Set(chars.map((c: any) => c.nombre))

const newChars = [
  // DANCE OF THE DRAGONS
  {
    nombre: 'Alicent Hightower', alias: ['La Reina Verde'], casa: 'Hightower', cultura: 'Andal',
    estado: 'muerto', nacimiento: null, muerte: null, padre: 'Otto Hightower', madre: null,
    conyuges: ['Viserys I Targaryen'], hijos: ['Aegon II Targaryen', 'Helaena Targaryen'],
    hermanos: [], descripcion: 'La segunda esposa de Viserys I y madre de Aegon II. Su disputa con Rhaenyra por la sucesión desencadenó la Danza de los Dragones.'
  },
  {
    nombre: 'Daemon Targaryen', alias: ['El Príncipe de la Ciudad', 'Rey del Mar Angosto'], casa: 'Targaryen', cultura: 'Valyrio',
    estado: 'muerto', nacimiento: null, muerte: null, padre: null, madre: null,
    conyuges: ['Rhaenyra Targaryen'], hijos: [], hermanos: [],
    descripcion: 'El hermano menor de Viserys I, un príncipe audaz y tempestuoso. Luchó en la Danza de los Dragones montando a Caraxes y murió en duelo contra Aemond sobre el Ojo de Dioses.'
  },
  {
    nombre: 'Rhaenyra Targaryen', alias: ['La Reina del Medio Año', 'La Delicia del Reino'], casa: 'Targaryen', cultura: 'Valyrio',
    estado: 'muerto', nacimiento: null, muerte: null, padre: 'Viserys I Targaryen', madre: null,
    conyuges: ['Daemon Targaryen'], hijos: [], hermanos: [],
    descripcion: 'La hija de Viserys I que fue proclamada reina por sus partidarios. Montaba a Syrax. Fue devorada por el dragón de Aegon II tras la caída de Desembarco del Rey.'
  },
  {
    nombre: 'Aegon II Targaryen', alias: ['El Rey Usurpador'], casa: 'Targaryen', cultura: 'Valyrio',
    estado: 'muerto', nacimiento: null, muerte: null, padre: 'Viserys I Targaryen', madre: 'Alicent Hightower',
    conyuges: [], hijos: [], hermanos: [],
    descripcion: 'El hijo de Viserys I que fue coronado por el Consejo Privado tras la muerte de su padre, desencadenando la Danza de los Dragones. Fue envenenado por sus propios hombres.'
  },
  {
    nombre: 'Aemond Targaryen', alias: ['Aemond el Tuerto'], casa: 'Targaryen', cultura: 'Valyrio',
    estado: 'muerto', nacimiento: null, muerte: null, padre: 'Viserys I Targaryen', madre: 'Alicent Hightower',
    conyuges: [], hijos: [], hermanos: [],
    descripcion: 'El hermano de Aegon II que montaba a Vhagar, el mayor de los dragones. Murió en duelo contra Daemon sobre el Ojo de Dioses.'
  },
  {
    nombre: 'Helaena Targaryen', alias: [], casa: 'Targaryen', cultura: 'Valyrio',
    estado: 'muerto', nacimiento: null, muerte: null, padre: 'Viserys I Targaryen', madre: 'Alicent Hightower',
    conyuges: [], hijos: [], hermanos: [],
    descripcion: 'La hija de Viserys I y hermana de Aegon II. Su muerte cayendo desde los muros de la Fortaleza Roja fue uno de los momentos más trágicos de la Danza.'
  },
  {
    nombre: 'Viserys I Targaryen', alias: ['El Rey Pacífico'], casa: 'Targaryen', cultura: 'Valyrio',
    estado: 'muerto', nacimiento: null, muerte: '129 AC', padre: null, madre: null,
    conyuges: [], hijos: [], hermanos: [],
    descripcion: 'Cuyo largo y pacífico reinado fue el más próspero de la historia de los Siete Reinos, pero cuya incapacidad para resolver la disputa sucesoria desencadenó la Danza de los Dragones.'
  },
  {
    nombre: 'Baela Targaryen', alias: [], casa: 'Targaryen', cultura: 'Valyrio',
    estado: 'vivo', nacimiento: null, muerte: null, padre: 'Daemon Targaryen', madre: null,
    conyuges: [], hijos: [], hermanos: [],
    descripcion: 'La hija de Daemon Targaryen que montaba a Danzarina Lunar. Enfrentó a Aegon II en Rocadragón y sobrevivió a la batalla.'
  },
  {
    nombre: 'Corlys Velaryon', alias: ['La Serpiente Marina'], casa: 'Velaryon', cultura: 'Valyrio',
    estado: 'muerto', nacimiento: null, muerte: null, padre: null, madre: null,
    conyuges: ['Rhaenys Targaryen'], hijos: [], hermanos: [],
    descripcion: 'El mayor explorador de Poniente que navegó los mares más lejanos. Sirvió como mano del rey durante la Danza de los Dragones.'
  },
  {
    nombre: 'Rhaenys Targaryen', alias: ['La Reina que nunca lo Fue'], casa: 'Targaryen', cultura: 'Valyrio',
    estado: 'muerto', nacimiento: null, muerte: null, padre: null, madre: null,
    conyuges: ['Corlys Velaryon'], hijos: [], hermanos: [],
    descripcion: 'La prima de Viserys I que fue ignorada en el Gran Consejo del 101. Murió en la Batalla de Reposo del Grajo montando a Meleys contra Aegon II y Aemond.'
  },
  {
    nombre: 'Daeron Targaryen', alias: ['Daeron el Osado'], casa: 'Targaryen', cultura: 'Valyrio',
    estado: 'muerto', nacimiento: null, muerte: null, padre: 'Viserys I Targaryen', madre: 'Alicent Hightower',
    conyuges: [], hijos: [], hermanos: [],
    descripcion: 'El hermano menor de Aegon II que destacó en la batalla. Montaba a Tessarion, la Reina Azul. Murió en la Segunda Batalla de Ladera.'
  },
  {
    nombre: 'Addam Velaryon', alias: ['Addam de Casco'], casa: 'Velaryon', cultura: 'Valyrio',
    estado: 'muerto', nacimiento: null, muerte: null, padre: 'Corlys Velaryon', madre: null,
    conyuges: [], hijos: [], hermanos: [],
    descripcion: 'Un joven que montaba a Bruma y fue adoptado por lord Corlys. Murió con valentía en la Segunda Batalla de Ladera. Su epitafio fue simplemente: Leal.'
  },
  {
    nombre: 'Hugh el Martillo', alias: ['Hugh Martillo'], casa: null, cultura: 'Desconocido',
    estado: 'muerto', nacimiento: null, muerte: null, padre: null, madre: null,
    conyuges: [], hijos: [], hermanos: [],
    descripcion: 'Un herrero que montaba a Vermithor. Cambió de bando en la Primera Batalla de Ladera y fue asesinado posteriormente.'
  },
  {
    nombre: 'Ulf el Blanco', alias: ['Ulf el Beodo'], casa: null, cultura: 'Desconocido',
    estado: 'muerto', nacimiento: null, muerte: null, padre: null, madre: null,
    conyuges: [], hijos: [], hermanos: [],
    descripcion: 'Un borracho que montaba a Ala de Plata. Cambió de bando junto con Hugh el Martillo y fue envenenado.'
  },
  // BLACKFYRE REBELLIONS
  {
    nombre: 'Daemon Blackfyre', alias: ['Daemon I Blackfyre', 'El Dragón Negro'], casa: 'Blackfyre', cultura: 'Valyrio',
    estado: 'muerto', nacimiento: '170 AC', muerte: '196 AC', padre: 'Aegon IV Targaryen', madre: 'Daena Targaryen',
    conyuges: [], hijos: [], hermanos: [],
    descripcion: 'El bastardo legitimado de Aegon IV que reclamó el trono usando la espada Fuegoscuro. Su rebelión dividió al reino y acabó con su muerte en la Batalla del Prado Hierbarroja.'
  },
  {
    nombre: 'Aegor Rivers', alias: ['Aceroamargo', 'Bittersteel'], casa: 'Rivers', cultura: 'Desconocido',
    estado: 'muerto', nacimiento: null, muerte: null, padre: 'Aegon IV Targaryen', madre: null,
    conyuges: [], hijos: [], hermanos: [],
    descripcion: 'Hermanastro de Daemon Blackfyre que formó la Compañía Dorada. Fue el principal instigador de las rebeliones Blackfyre.'
  },
  {
    nombre: 'Brynden Rivers', alias: ['Cuervo de Sangre', 'Bloodraven'], casa: 'Rivers', cultura: 'Desconocido',
    estado: 'muerto', nacimiento: null, muerte: null, padre: 'Aegon IV Targaryen', madre: null,
    conyuges: [], hijos: [], hermanos: [],
    descripcion: 'El Gran Bastardo que sirvió como mano del rey. Utilizó espías y magia para combatir las rebeliones Blackfyre. Desapareció en una expedición más allá del Muro.'
  },
  {
    nombre: 'Daena Targaryen', alias: ['Daena la Rebelde'], casa: 'Targaryen', cultura: 'Valyrio',
    estado: 'muerto', nacimiento: null, muerte: null, padre: 'Daeron II Targaryen', madre: null,
    conyuges: [], hijos: ['Daemon Blackfyre'], hermanos: [],
    descripcion: 'La hija de Daeron II que fue encerrada en la Bóveda de las Doncellas. Dio a luz a Daemon Blackfyre, cuyo padre nunca fue revelado oficialmente.'
  },
  {
    nombre: 'Otto Hightower', alias: [], casa: 'Hightower', cultura: 'Andal',
    estado: 'muerto', nacimiento: null, muerte: null, padre: null, madre: null,
    conyuges: [], hijos: ['Alicent Hightower'], hermanos: [],
    descripcion: 'Mano del rey que manipuló la sucesión a favor de su hija Alicent. Fue ejecutado durante la Danza de los Dragones.'
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

// === EVENTS ===
const events: any[] = JSON.parse(fs.readFileSync(path.join(DATA_DIR, 'events.json'), 'utf8'))
const existingEventTitles = new Set(events.map((e: any) => e.titulo))

const newEvents = [
  // DANCE OF THE DRAGONS
  {
    titulo: 'La Danza de los Dragones', anio: '129-131 AC', lugar: null,
    personajes_involucrados: ['Rhaenyra Targaryen', 'Aegon II Targaryen', 'Daemon Targaryen', 'Aemond Targaryen', 'Alicent Hightower', 'Helaena Targaryen', 'Corlys Velaryon', 'Rhaenys Targaryen', 'Baela Targaryen'],
    descripcion: 'La guerra civil más sangrienta de la historia Targaryen, entre Rhaenyra y su medio hermano Aegon II por el trono. Se cobró la vida de casi todos los dragones y dejó el reino destrozado.'
  },
  {
    titulo: 'La Batalla de Reposo del Grajo', anio: '130 AC', lugar: 'Reposo del Grajo',
    personajes_involucrados: ['Rhaenys Targaryen', 'Aegon II Targaryen', 'Aemond Targaryen'],
    descripcion: 'La princesa Rhaenys montando a Meleys enfrentó sola a Aegon II y Aemond. Aunque murió, dejó al rey Aegon II gravemente herido y a Fuegosol tullido.'
  },
  {
    titulo: 'La Batalla sobre el Ojo de Dioses', anio: '130 AC', lugar: 'Ojo de Dioses',
    personajes_involucrados: ['Daemon Targaryen', 'Aemond Targaryen'],
    descripcion: 'El famoso duelo entre Daemon y Aemond. Daemon saltó de Caraxes a Vhagar en pleno vuelo y mató a Aemond con Hermana Oscura mientras los dragones se precipitaban al agua.'
  },
  {
    titulo: 'La Primera Batalla de Ladera', anio: '130 AC', lugar: 'Ladera',
    personajes_involucrados: ['Hugh el Martillo', 'Ulf el Blanco'],
    descripcion: 'Los Dos Traidores, Hugh el Martillo y Ulf el Blanco, cambiaron de bando con sus dragones. El saqueo de Ladera que siguió fue uno de los episodios más brutales de la guerra.'
  },
  {
    titulo: 'La Segunda Batalla de Ladera', anio: '130 AC', lugar: 'Ladera',
    personajes_involucrados: ['Daeron Targaryen', 'Addam Velaryon'],
    descripcion: 'La batalla donde realmente bailaron los dragones. Murió el príncipe Daeron y Addam Velaryon demostró su lealtad con la vida. Se perdieron los dragones Bruma, Tessarion y Vermithor.'
  },
  {
    titulo: 'La Batalla del Camino Real', anio: '131 AC', lugar: null,
    personajes_involucrados: [],
    descripcion: 'La última batalla de la Danza, también llamada la Matanza del Barro. Lord Borros Baratheon cayó a manos de los jóvenes señores de los Ríos.'
  },
  {
    titulo: 'El Asalto a Pozo Dragón', anio: '130 AC', lugar: 'Desembarco del Rey',
    personajes_involucrados: [],
    descripcion: 'La muchedumbre del Pastor irrumpió en Pozo Dragón para matar a los dragones encadenados. Murieron cinco dragones y el príncipe Joffrey Velaryon.'
  },
  {
    titulo: 'La Batalla del Gaznate', anio: '129 AC', lugar: 'Gaznate',
    personajes_involucrados: [],
    descripcion: 'Las naves de la Triarquía derrotaron a la flota de Corlys Velaryon. Perecieron Jacaerys Velaryon y su dragón Vermax.'
  },
  {
    titulo: 'La Caída de Rhaenyra', anio: '130 AC', lugar: 'Rocadragón',
    personajes_involucrados: ['Rhaenyra Targaryen', 'Aegon II Targaryen'],
    descripcion: 'Rhaenyra huyó de Desembarco del Rey y llegó a Rocadragón, donde Aegon II la apresó y la devoró con el dragón Fuegosol ante los ojos de su hijo.'
  },
  // BLACKFYRE REBELLIONS
  {
    titulo: 'La Primera Rebelión Blackfyre', anio: '196 AC', lugar: 'Prado Hierbarroja',
    personajes_involucrados: ['Daemon Blackfyre', 'Aegor Rivers', 'Brynden Rivers', 'Daeron II Targaryen'],
    descripcion: 'Daemon Blackfyre reclamó el trono contra Daeron II. La rebelión terminó en la Batalla del Prado Hierbarroja donde Daemon y sus hijos mayores cayeron bajo las flechas de Cuervo de Sangre.'
  },
  {
    titulo: 'La Segunda Rebelión Blackfyre', anio: '211 AC', lugar: 'Murosblancos',
    personajes_involucrados: ['Brynden Rivers'],
    descripcion: 'Una conspiración para devolver a los Fuegoscuro que fue descubierta por Cuervo de Sangre antes de comenzar, en el torneo nupcial de Murosblancos.'
  },
  {
    titulo: 'La Tercera Rebelión Blackfyre', anio: '219 AC', lugar: null,
    personajes_involucrados: ['Aegor Rivers', 'Brynden Rivers'],
    descripcion: 'Haegon I Blackfyre y Aceroamargo acometieron la tercera rebelión. Haegon murió tras la batalla y Aceroamargo fue enviado al Muro pero liberado en el camino.'
  },
  {
    titulo: 'La Cuarta Rebelión Blackfyre', anio: '236 AC', lugar: 'Puente del Aguastortas',
    personajes_involucrados: ['Aegon V Targaryen', 'Aegor Rivers'],
    descripcion: 'Daemon III Blackfyre y Aceroamargo desembarcaron en el Garfio de Massey pero fueron derrotados en la Batalla del Puente del Aguastortas. Aceroamargo murió poco después en las Tierras de la Discordia.'
  },
  // OTHER TARGARYEN EVENTS
  {
    titulo: 'La Peste de la Gran Primavera', anio: '209 AC', lugar: 'Desembarco del Rey',
    personajes_involucrados: ['Daeron II Targaryen'],
    descripcion: 'Una peste devastadora que mató al rey Daeron II, al septón supremo y a un tercio de la población de Desembarco del Rey.'
  },
  {
    titulo: 'El Gran Consejo del 101', anio: '101 AC', lugar: 'Desembarco del Rey',
    personajes_involucrados: ['Viserys I Targaryen', 'Rhaenys Targaryen'],
    descripcion: 'El consejo que decidió que el trono pasaría a Viserys I en lugar de a Rhaenys, estableciendo el precedente de que el hombre tiene prioridad sobre la mujer.'
  },
  {
    titulo: 'La Conquista de Dorne por Daeron I', anio: '157-161 AC', lugar: 'Dorne',
    personajes_involucrados: ['Daeron I Targaryen'],
    descripcion: 'Daeron I el Joven Dragón conquistó Dorne pero no pudo mantenerla. Murió emboscado al cruzar el Sendahuesos.'
  },
  {
    titulo: 'La Rebelión Greyjoy', anio: '289 AC', lugar: null,
    personajes_involucrados: ['Robert Baratheon', 'Balon Greyjoy', 'Stannis Baratheon'],
    descripcion: 'Balon Greyjoy se alzó contra el rey Robert pero fue derrotado. Stannis dirigió la flota real contra las Islas de Hierro.'
  },
  {
    titulo: 'La Batalla de Fair Isle', anio: '289 AC', lugar: 'Fair Isle',
    personajes_involucrados: ['Stannis Baratheon', 'Balon Greyjoy'],
    descripcion: 'La batalla naval decisiva de la Rebelión Greyjoy donde Stannis destruyó la flota de Balon.'
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
console.log(`Events: ${events.length}`)
