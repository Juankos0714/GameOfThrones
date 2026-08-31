-- ============================================================
-- Migration 001: Load all ASOIAF data
-- Generated from data/extracted/*.json
-- ============================================================

-- Disable triggers for faster inserts
SET session_replication_role = 'replica';

-- ============================================================
-- HOUSES (47)
-- ============================================================

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Stark', 'stark', 'El Norte', 'Se acerca el invierno', 'Invernalia', 'gris, blanco', 'Una estirpe antigua que gobernó el Norte como Reyes del Invierno antes de inclinarse ante el dragón. Su autoridad nace de una continuidad casi geológica: criptas, arcianos y juramentos conservan una memoria que precede a los Siete Reinos.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Lannister', 'lannister', 'Tierras del Oeste', 'Oye mi rugido', 'Roca Casterly', 'dorado, carmesí', 'Una dinastía cuya riqueza mineral sostiene una maquinaria de alianzas, préstamos y silencios calculados. De Lann el Astuto a Tywin, la casa convirtió la reputación en moneda y el matrimonio en una extensión de la guerra.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Targaryen', 'targaryen', 'Rocadragón', 'Fuego y sangre', 'Rocadragón', 'púrpura, negro', 'La última gran sangre de Valyria unificó seis reinos mediante dragones y dejó una corona marcada por profecía y ruina. La Conquista alteró el calendario político de Poniente.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Baratheon', 'baratheon', 'Tierras de la Tormenta', 'Nuestra es la furia', 'Bastión de Tormentas', 'negro, dorado', 'Forjada entre la tormenta y la conquista, su línea convirtió una rebelión victoriosa en una dinastía fracturada. Orys Baratheon fundó la casa sobre la herencia Durrandon.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Tyrell', 'tyrell', 'Las Tierras del Dominio', 'Creciendo fuertes', 'Altojardín', 'verde, dorado', 'Señores de las tierras más fértiles de Poniente, su poder nace del grano y del control de las rutas comerciales. Olenna y Margaery Tejieron la política como quien cultiva una rosa: con espinas invisibles.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Greyjoy', 'greyjoy', 'Islas de Hierro', 'Nosotros no sembramos', 'Pyke', 'negro, dorado', 'Los señores del hierro y el mar viven según el credo de la prise: lo que se toma se posee. Balon intentó restaurar la vieja gloria, pero la rebelión fue aplastada y sus hijos terminaron prisioneros.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Arryn', 'arryn', 'El Valle de Arryn', 'Tan alto como el honor', 'Nido de Águilas', 'azul, blanco', 'Su fortaleza invulnerable y sus tierras prósperas han mantenido a los Arryn a salvo de conquistas. Lysa mantuvo a su hijo bajo llave mientras el Valle permanecía neutral durante la guerra.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Tully', 'tully', 'Las Tierras de los Ríos', 'Familia, Honor, Deber', 'Riverrun', 'rojo, azul', 'Señores del río que han sufrido más invasiones que casi nadie. Hoster unió sus tierras por matrimonio, pero la guerra de los Cinco Reyes las arrasó.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Frey', 'frey', 'Las Tierras de los Ríos', 'Desconocido', 'Los Gemelos', 'gris, azul', 'Los señores del cruce acumularon poder gracias a sus puentes y a su prolificidad. Walder Frey vivió lo suficiente para ver a su casa en el centro de la guerra y de la infamia.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Bolton', 'bolton', 'El Norte', 'Nuestros Aceros Son Afilados', 'La Fortaleza Púrpura', 'rojo, blanco', 'Antiguos rivales de los Stark cuya reputación por la crueldad rivaliza con su ambición. Roose mantuvo un perfil bajo hasta que la oportunidad de traicionar se presentó.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Mormont', 'mormont', 'La Isla del Oso', 'Desconocido', 'Fuerte Terror', 'verde oscuro, negro', 'Una casa norteña cuyos miembros sirven con honor en la Guardia de la Noche. Jorah vendió esclavos y huyó, pero la casa siguió fiel al juramento.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Karstark', 'karstark', 'El Norte', 'Desconocido', 'Karhold', 'negro, gris', 'Descendientes de los Stark que perdieron su apellido tras una traición. Rickard buscó venganza tras la muerte de sus hijos en la guerra.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Umber', 'umber', 'El Norte', 'Desconocido', 'El Último Aposento', 'rojo, negro', 'Guardianes del norte salvaje, su fuerza bruta los hace leales pero peligrosos. Greatjon fue el primero en proclamar a Robb como rey.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Manderly', 'manderly', 'El Norte', 'Desconocido', 'Puerto Blanco', 'blanco, verde', 'Los más ricos del Norte después de los Stark, su lealtad se pagó con la vida. Wyman mantuvo la fe mientras aparentaba obediencia.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Glover', 'glover', 'El Norte', 'Desconocido', 'Bosquespeso', 'rojo, negro', 'Señores del bosque que perdieron su hogar en la guerra. Jorah Mormont se casó con una Glover antes de su desgracia.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Reed', 'reed', 'Las Tierras Pantanosas', 'Desconocido', 'La Torre de la Alegría', 'verde, gris', 'Señores lacustres que viven en los pantanos y guardan los secretos de los niños del bosque. Howland fue el único sobreviviente de la Torre de la Alegría.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Hightower', 'hightower', 'Las Tierras del Dominio', 'Desconocido', 'La Torre Blanca', 'blanco, verde', 'Una de las casas más antiguas y ricas del Dominio, su poder se basa en el comercio y la fe. Samwell fue enviado a la Guardia de la Noche para no heredar.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Martell', 'martell', 'Dorne', 'Imperturbable', 'Sunspear', 'naranja, rojo', 'Los príncipes de Dorne mantuvieron su independencia mediante matrimonio y no por la fuerza. Oberyn buscó venganza por la muerte de Elia.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Tarly', 'tarly', 'Las Tierras del Dominio', 'Desconocido', 'Cuernos de Canaval', 'verde, amarillo', 'Señores guerreros cuyo hijo menor fue enviado a la Guardia de la Noche. Randyll era el mejor estratega del Dominio, pero su orgullo lo cegó.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Redwyne', 'redwyne', 'Las Tierras del Dominio', 'Desconocido', 'La Isla de las Uvas', 'rojo, verde', 'Señores de la isla más fértil del Dominio, su vino es famoso en todo Poniente. Paxter puso sitio a Bastión de Tormentas durante la rebelión.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Florent', 'florent', 'Las Tierras del Dominio', 'Desconocido', 'Castillo Fuerte', 'azul, plateado', 'Parientes de la sangre Targaryen por línea femenina, su pretensión al trono causó más problemas que beneficios. Selyse creyó en el fuego.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Dondarrion', 'dondarrion', 'Las Tierras de la Tormenta', 'Desconocido', 'La Torre Morena', 'púrpura, negro', 'Señores menores que sirvieron en la Guardia Comarana. Beric fue resucitado seis veces por Melisandre.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Velaryon', 'velaryon', 'Las Tierras de la Corona', 'Desconocido', 'Marfil del Mar', 'plateado, verde', 'Señores marinos de sangre valyria que apoyaron a Stannis en su reclamación del trono.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Swann', 'swann', 'Las Tierras de la Tormenta', 'Desconocido', 'La Piedra Colgada', 'blanco, negro', 'Señores menores que navegaron entre bandos durante la guerra.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Rowan', 'rowan', 'Las Tierras del Dominio', 'Desconocido', 'Jardín Dorado', 'dorado, rojo', 'Señores del Dominio que apoyaron a Renly y luego a Stannis.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Peake', 'peake', 'Las Tierras del Dominio', 'Desconocido', 'Castillo de los Tres Picos', 'negro, púrpura', 'Una casa que una vez tuvo tres castillos pero perdió dos por traición.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Connington', 'connington', 'Las Tierras de la Tormenta', 'Desconocido', 'El Nido de Águilas', 'rojo, blanco', 'Señores que sirvieron como Manos del Rey. Jon Connington fue desterrado tras su fracaso.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Selmy', 'selmy', 'Las Tierras del Dominio', 'Desconocido', 'La Granja de la Desolación', 'amarillo, negro', 'Señores menores cuyo hijo Barristan sirvió en la Guardia Real durante cinco reinados.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Celtigar', 'celtigar', 'Las Tierras de la Corona', 'Desconocido', 'Playa de la Claw', 'rojo, azul', 'Señores marinos de sangre valyria que apoyaron a Stannis.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Gardener', 'gardener', 'Las Tierras del Dominio', 'Manos que alimentan', 'Altojardín', 'verde, dorado', 'Los antiguos reyes del Dominio que gobernaron antes de la Conquista. Su linaje se remonta a los Primeros Hombres. Fueron destruidos en el Campo de Fuego.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Casterly', 'casterly', 'Tierras del Oeste', 'Desconocido', 'Roca Casterly', 'dorado, carmesí', 'Los antiguos reyes de la Roca que gobernaron el oeste antes de los Lannister. Lann el Astuto les arrebató el castillo mediante engaño.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Durrandon', 'durrandon', 'Tierras de la Tormenta', 'Ours is the Fury', 'Bastión de Tormentas', 'negro, dorado', 'Los antiguos reyes de la Tormenta que gobernaron durante mil años. Fueron destruidos por Orys Baratheon, quien tomó su casa y su lema.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Hoare', 'hoare', 'Islas de Hierro / Las Tierras de los Ríos', 'Desconocido', 'Harrenhal', 'negro, gris', 'Los reyes de hierro que conquistaron las Tierras de los Ríos. Harren el Rey Negro construyó Harrenhal y fue destruido por los dragones de Aegon.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Mudd', 'mudd', 'Las Tierras de los Ríos', 'Desconocido', 'Antigua', 'verde, dorado', 'Los antiguos reyes de las Tierras de los Ríos que gobernaron desde Antigua. Su linaje se remonta a los Primeros Hombres.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Justman', 'justman', 'Las Tierras de los Ríos', 'Desconocido', 'Desembarco del Rey', 'azul, plateado', 'Una dinastía de reyes que gobernó las Tierras de los Ríos después de los Mudd. Fueron destruidos por los Hoare.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Teague', 'teague', 'Las Tierras de los Ríos', 'Desconocido', 'Stone Hedge', 'rojo, negro', 'Los últimos reyes de las Tierras de los Ríos antes de la conquista Hoare. Fueron destruidos por Harren.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Bracken', 'bracken', 'Las Tierras de los Ríos', 'Desconocido', 'Stone Hedge', 'rojo, negro', 'Señores de las Tierras de los Ríos enemistados con los Blackwood durante siglos. Su rivalidad es una de las más antiguas de Poniente.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Blackwood', 'blackwood', 'Las Tierras de los Ríos', 'Desconocido', 'Raventree Hall', 'negro, púrpura', 'Señores de las Tierras de los Ríos que mantienen la fe del Bosque. Su rivalidad con los Bracken es legendaria.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Royce', 'royce', 'El Valle', 'Desconocido', 'Runestone', 'bronce, negro', 'Señores del Valle cuya casa es una de las más antiguas y honorables. Bronze Yohn fue un aliado clave de los Stark.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Dayne', 'dayne', 'Dorne', 'Desconocido', 'Starfall', 'púrpura, plateado', 'Señores de Dorne cuya espada legendaria, La Estrella de la Mañana, es una de las más famosas del mundo. Arthur Dayne fue el caballero más honorable.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Yronwood', 'yronwood', 'Dorne', 'Desconocido', 'Yronwood', 'amarillo, negro', 'Señores de Dorne rivales de los Martell. Fueron los últimos en someterse a su dominio.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Harlaw', 'harlaw', 'Islas de Hierro', 'Desconocido', 'La Granja de los Harlaw', 'verde, negro', 'Señores de las Islas de Hierro más cultos y prósperos. Rodrik Harlaw era conocido como el Lector.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Drumm', 'drumm', 'Islas de Hierro', 'Desconocido', 'Viejo Wyk', 'rojo, negro', 'Señores de las Islas de Hierro cuya casa es una de las más antiguas y respetadas.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Goodbrother', 'goodbrother', 'Islas de Hierro', 'Desconocido', 'Gran Wyk', 'negro, rojo', 'Señores de las Islas de Hierro con numerosos miembros repartidos por las islas.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Botley', 'botley', 'Islas de Hierro', 'Desconocido', 'Pyke', 'azul, plateado', 'Señores menores de las Islas de Hierro leales a los Greyjoy.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Toland', 'toland', 'Dorne', 'Desconocido', 'Ghost Hill', 'verde, plateado', 'Señores de Dorne cuya fortaleza lleva un nombre sugestivo.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

INSERT INTO houses (name, slug, region, motto, seat, colors, description)
VALUES ('Fowler', 'fowler', 'Dorne', 'Desconocido', 'Skyreach', 'dorado, azul', 'Señores de Dorne que guardan los pasos montañosos.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, motto = EXCLUDED.motto,
  seat = EXCLUDED.seat, colors = EXCLUDED.colors, description = EXCLUDED.description;

-- ============================================================
-- CHARACTERS (250)
-- ============================================================

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Eddard Stark',
  'eddard-stark',
  ARRAY['Ned'],
  (SELECT id FROM houses WHERE slug = 'stark'),
  'Norteño',
  'muerto',
  '263 AC',
  '298 AC',
  'Señor de Invernalia y Guarda del Rey. Hombre de honor inquebrantable cuya rectitud le costó la vida en la corte de Desembarco del Rey. Descubrió el secreto de los Lannister y fue ejecutado por Joffrey.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Catelyn Tully',
  'catelyn-tully',
  ARRAY['Cat'],
  (SELECT id FROM houses WHERE slug = 'tully'),
  'Riverlands',
  'muerto',
  '264 AC',
  '299 AC',
  'Señora de Invernalia y madre de cinco hijos. Viajó a Desembarco del Rey para advertir a su esposo y luego capturó a Tyrion Lannister. Murió en la Boda Roja.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Robb Stark',
  'robb-stark',
  ARRAY['El Joven Lobo', 'Rey en el Norte'],
  (SELECT id FROM houses WHERE slug = 'stark'),
  'Norteño',
  'muerto',
  '283 AC',
  '299 AC',
  'El Rey en el Norte que lideró la rebelión contra los Lannister. Ganó todas sus batallas pero perdió la guerra por romper su promesa de matrimonio. Murió en la Boda Roja.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Sansa Stark',
  'sansa-stark',
  ARRAY['Sansa del Invernadero'],
  (SELECT id FROM houses WHERE slug = 'stark'),
  'Norteño',
  'vivo',
  '286 AC',
  NULL,
  'Hija de Eddard y Catelyn. Reina del Norte, aprendió supervivencia y política en las cortes más peligrosas de Poniente. Fue rehén de los Lannister y luego esposa de Ramsay Bolton.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Arya Stark',
  'arya-stark',
  ARRAY['Arya del Pie Descalzo', 'Aguja'],
  (SELECT id FROM houses WHERE slug = 'stark'),
  'Norteño',
  'vivo',
  '289 AC',
  NULL,
  'Hija menor de Ned Stark, cuyo viaje por los caminos más oscuros de Poniente la forjó en algo que ninguna escuela de asesinos podría haber anticipado. Entrenó con los Hombres sin Rostro en Braavos.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Bran Stark',
  'bran-stark',
  ARRAY['Bran el Roto', 'El Cuervos de Tres Ojos'],
  (SELECT id FROM houses WHERE slug = 'stark'),
  'Norteño',
  'vivo',
  '290 AC',
  NULL,
  'El hijo que cayó y se levantó como el Cuervos de Tres Ojos, guardián de la memoria del mundo. Sus poderes greensight lo conectan con el pasado y el futuro.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Rickon Stark',
  'rickon-stark',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'stark'),
  'Norteño',
  'muerto',
  '295 AC',
  '300 AC',
  'El más joven de los hijos Stark. Huyó de Invernalia con su lobo Peludo y fue capturado por los Bolton. Murió ejecutado por Ramsay Bolton.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Jon Nieve',
  'jon-nieve',
  ARRAY['Aegon Targaryen', 'Alborada'],
  (SELECT id FROM houses WHERE slug = 'stark'),
  'Norteño',
  'vivo',
  '283 AC',
  NULL,
  'Hijo secreto de Rhaegar Targaryen y Lyanna Stark, criado como bastardo en Invernalia. Lord Comandante de la Guardia de la Noche que fue asesinado por sus propios hermanos y luego resucitado.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Tyrion Lannister',
  'tyrion-lannister',
  ARRAY['El Duende', 'El Enano'],
  (SELECT id FROM houses WHERE slug = 'lannister'),
  'Occidental',
  'vivo',
  '273 AC',
  NULL,
  'El menor de los Lannister, cuya agudeza mental y sentido del humor le permitieron sobrevivir donde la fuerza habría fracasado. Fue acusado del asesinato de Joffrey y huyó a Essos.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Cersei Lannister',
  'cersei-lannister',
  ARRAY['La Reina Regente'],
  (SELECT id FROM houses WHERE slug = 'lannister'),
  'Occidental',
  'muerto',
  '266 AC',
  '305 AC',
  'Reina de los Siete Reinos, hija de Tywin. Mujer de voluntad férrea cuyo amor por sus hijos fue tanto su fortaleza como su ruina. Gobernó como regente y luego como reina.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Jaime Lannister',
  'jaime-lannister',
  ARRAY['El Mattador de Reyes', 'El Amo de la Mano Dorada'],
  (SELECT id FROM houses WHERE slug = 'lannister'),
  'Occidental',
  'muerto',
  '266 AC',
  NULL,
  'El Guardia Real más joven en ser nombrado, célebre por haber matado al rey loco. Perdió la mano derecha y viajó con Brienne de Tarth. Su relación con Cersei fue su perdición.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Tywin Lannister',
  'tywin-lannister',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'lannister'),
  'Occidental',
  'muerto',
  '242 AC',
  '300 AC',
  'Señor de Roca Casterly y Mano del Rey. Estratega implacable cuya obsesión por la dinastía destruyó tanto a sus enemigos como a su propia familia. Murió asesinado por su propio hijo Tyrion.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Joffrey Baratheon',
  'joffrey-baratheon',
  ARRAY['Joffrey el Malnacido'],
  (SELECT id FROM houses WHERE slug = 'baratheon'),
  'Andal',
  'muerto',
  '286 AC',
  '300 AC',
  'El cruel rey que gobernó tras la muerte de Robert. Su temperamento sádico y su legitimidad cuestionada lo convirtieron en un tirano temido por todos. Murió envenenado en su propia boda.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Stannis Baratheon',
  'stannis-baratheon',
  ARRAY['El Rey Justo'],
  (SELECT id FROM houses WHERE slug = 'baratheon'),
  'Andal',
  'muerto',
  '264 AC',
  '300 AC',
  'El menor de los hermanos Baratheon que reclamó el trono por derecho de sangre. Su estricto sentido del deber y su alianza con Melisandre lo llevaron a cometer actos terribles.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Renly Baratheon',
  'renly-baratheon',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'baratheon'),
  'Andal',
  'muerto',
  '277 AC',
  '299 AC',
  'El más joven de los Baratheon, carismático y querido por el pueblo. Se proclamó rey con el apoyo de los Tyrell, pero fue asesinado por la sombra de Melisandre.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Robert Baratheon',
  'robert-baratheon',
  ARRAY['El Usurpador'],
  (SELECT id FROM houses WHERE slug = 'baratheon'),
  'Andal',
  'muerto',
  '262 AC',
  '298 AC',
  'Rey de los Siete Reinos, cuya rebelión contra los Targaryen cambió el destino de Poniente. Cazador y guerrero, pero pobre administrador de reinos. Murió por una herida de jabalí.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Daenerys Targaryen',
  'daenerys-targaryen',
  ARRAY['Madre de Dragones', 'Daenerys Florentina', 'La No Marchitada'],
  (SELECT id FROM houses WHERE slug = 'targaryen'),
  'Valyrio',
  'muerto',
  '284 AC',
  NULL,
  'La última Targaryen, que nació en la tormenta, conquistó ciudades y murió en la luz de su propio dragón. Nació en Rocadragón y fue criada en el exilio.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Viserys Targaryen',
  'viserys-targaryen',
  ARRAY['El Rey Mendigo'],
  (SELECT id FROM houses WHERE slug = 'targaryen'),
  'Valyrio',
  'muerto',
  '277 AC',
  '298 AC',
  'El hermano mayor de Daenerys que soñó con recuperar el trono. Vendió a su hermana a Khal Drogo a cambio de un ejército y murió con corona de oro derretido.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Aegon Targaryen',
  'aegon-targaryen',
  ARRAY['Aegon el Conquistador'],
  (SELECT id FROM houses WHERE slug = 'targaryen'),
  'Valyrio',
  'muerto',
  '27 AC AC',
  '37 AC',
  'El primer rey de los Siete Reinos que unificó seis reinos mediante dragones. Su Conquista alteró el calendario político de Poniente.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Rhaegar Targaryen',
  'rhaegar-targaryen',
  ARRAY['El Príncipe Encantador'],
  (SELECT id FROM houses WHERE slug = 'targaryen'),
  'Valyrio',
  'muerto',
  '259 AC',
  '283 AC',
  'El príncipe heredero que huyó con Lyanna Stark y murió en la Batalla del Tridente. Su amor prohibido desencadenó la rebelión que acabó con su dinastía.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Brandon Stark',
  'brandon-stark',
  ARRAY['Brandon el constructor'],
  (SELECT id FROM houses WHERE slug = 'stark'),
  'Norteño',
  'muerto',
  NULL,
  NULL,
  'El hermano mayor de Ned que fue ejecutado por Aerys II. Su muerte fue el detonante de la rebelión de Robert.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Benjen Stark',
  'benjen-stark',
  ARRAY['El Hermano Perdido'],
  (SELECT id FROM houses WHERE slug = 'stark'),
  'Norteño',
  'muerto',
  NULL,
  NULL,
  'El hermano menor de Ned que se unió a la Guardia de la Noche. Desapareció en una patrulla y fue encontrado como caminante blanco.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Lyanna Stark',
  'lyanna-stark',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'stark'),
  'Norteño',
  'muerto',
  NULL,
  '283 AC',
  'La hermana de Ned que huyó con Rhaegar Targaryen. Su desaparición desencadenó la rebelión de Robert. Murió en la Torre de la Alegría.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Brienne de Tarth',
  'brienne-de-tarth',
  ARRAY['La Bella'],
  NULL,
  'Andal',
  'vivo',
  NULL,
  NULL,
  'Una guerrera cuya apariencia no se ajusta a los cánones de belleza, pero cuyo honor y destreza con la espada superan a la mayoría de los caballeros. Juró lealtad a Catelyn y luego a Jaime.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Davos Seaworth',
  'davos-seaworth',
  ARRAY['El Caballero de las Cebollas'],
  NULL,
  'Norteño',
  'vivo',
  NULL,
  NULL,
  'Un contrabandista que se convirtió en caballero gracias a su lealtad a Stannis. Su sentido común y honestidad lo convirtieron en el consejero más confiable del rey.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Melisandre',
  'melisandre',
  ARRAY['La Mujer Roja'],
  NULL,
  'Ashai',
  'vivo',
  NULL,
  NULL,
  'Una sacerdota del Señor de la Luz cuyas profecías en las llamas guiaron a Stannis. Su magia era real, pero sus interpretaciones a menudo estaban equivocadas.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Gendry',
  'gendry',
  ARRAY['Gendry el Herrero'],
  (SELECT id FROM houses WHERE slug = 'baratheon'),
  'Desconocido',
  'vivo',
  NULL,
  NULL,
  'Un herrero bastardo de Robert Baratheon que viajó con Arya. Su fuerza y habilidad con el martillo lo convirtieron en un guerrero valioso.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Samwell Tarly',
  'samwell-tarly',
  ARRAY['Sam'],
  (SELECT id FROM houses WHERE slug = 'tarly'),
  'Andal',
  'vivo',
  NULL,
  NULL,
  'Un joven cobarde que se convirtió en el maestre más importante de Poniente. Descubrió la debilidad de los Caminantes Blancos y encontró la cura para el dragón de piedra.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Tormund Gigante',
  'tormund-gigante',
  ARRAY['Tormund Muñetas de Trueno'],
  NULL,
  'Salvaje',
  'vivo',
  NULL,
  NULL,
  'Un líder salvaje que se convirtió en aliado de Jon Nieve. Su fuerza y sentido del humor lo hicieron popular entre los hermanos de la Guardia de la Noche.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Theon Greyjoy',
  'theon-greyjoy',
  ARRAY['El Traidor', 'Reek'],
  (SELECT id FROM houses WHERE slug = 'greyjoy'),
  'Islas de Hierro',
  'vivo',
  NULL,
  NULL,
  'Un rehén de los Stark que traicionó a sus amos para ganar el favor de su padre. Fue capturado por Ramsay Bolton y torturado hasta convertirse en Reek.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Varys',
  'varys',
  ARRAY['La Araña'],
  NULL,
  'Desconocido',
  'muerto',
  NULL,
  NULL,
  'Un eunuco que sirvió como maestre de los secretos. Su red de espías era la más extensa de Poniente. Trabajó por el bien del reino, no por un rey específico.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Petyr Baelish',
  'petyr-baelish',
  ARRAY['Meñique'],
  NULL,
  'Desconocido',
  'muerto',
  NULL,
  '305 AC',
  'Un hombre ambicioso que ascendió de la nada a Señor de Harrenhal y Consejero de los reyes. Su amor no correspondido por Catelyn lo llevó a manipular eventos durante toda la guerra.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Bronn',
  'bronn',
  ARRAY['El Amo de la Mano Negra'],
  NULL,
  'Desconocido',
  'vivo',
  NULL,
  NULL,
  'Un mercenario que se convirtió en el más cercano amigo de Tyrion. Su lealtad se compró con oro y títulos, pero su sentido práctico lo mantuvo con vida.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Khal Drogo',
  'khal-drogo',
  ARRAY[]::text[],
  NULL,
  'Dothraki',
  'muerto',
  NULL,
  '298 AC',
  'El mayor khal del khalasar más grande. Su fuerza y ferocidad lo hicieron temido, pero su amor por Daenerys mostró su lado humano. Murió por una herida infectada.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Balon Greyjoy',
  'balon-greyjoy',
  ARRAY['El León de Hierro'],
  (SELECT id FROM houses WHERE slug = 'greyjoy'),
  'Islas de Hierro',
  'muerto',
  NULL,
  '299 AC',
  'El Señor de las Islas de Hierro que intentó restaurar la vieja gloria mediante rebeliones fallidas. Murió asesinado por su hermano Euron.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Asha Greyjoy',
  'asha-greyjoy',
  ARRAY['Yara Greyjoy'],
  (SELECT id FROM houses WHERE slug = 'greyjoy'),
  'Islas de Hierro',
  'vivo',
  NULL,
  NULL,
  'La hija de Balon que compitió por el trono de hierro. Más pragmática que su padre, buscó alianzas en vez de guerra.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Euron Greyjoy',
  'euron-greyjoy',
  ARRAY['Euron el Cuervo Ojo'],
  (SELECT id FROM houses WHERE slug = 'greyjoy'),
  'Islas de Hierro',
  'vivo',
  NULL,
  NULL,
  'Un pirata loco que asesinó a su hermano Balon y reclamó el trono de hierro. Su ambición lo llevó a buscar el Cuerno de la Abundancia.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Victarion Greyjoy',
  'victarion-greyjoy',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'greyjoy'),
  'Islas de Hierro',
  'vivo',
  NULL,
  NULL,
  'El hermano guerrero de Balon que zarpó hacia Meereen para rescatar a Daenerys. Su sentido del honor lo hace peligroso.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Aeron Greyjoy',
  'aeron-greyjoy',
  ARRAY['El Profeta', 'Humedad'],
  (SELECT id FROM houses WHERE slug = 'greyjoy'),
  'Islas de Hierro',
  'vivo',
  NULL,
  NULL,
  'Un sacerdote del Drowned God que se opuso a la ambición de Euron. Su fe lo mantuvo firme mientras sus hermanos luchaban por el trono.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Margaery Tyrell',
  'margaery-tyrell',
  ARRAY['La Reina de las Rosas'],
  (SELECT id FROM houses WHERE slug = 'tyrell'),
  'Andal',
  'muerto',
  NULL,
  '300 AC',
  'Una mujer astuta y carismática que se casó con tres reyes. Su abuela Olenna la entrenó para la política, pero la destrucción del Septo de Baelor acabó con ella.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Loras Tyrell',
  'loras-tyrell',
  ARRAY['El Caballero de las Flores'],
  (SELECT id FROM houses WHERE slug = 'tyrell'),
  'Andal',
  'muerto',
  NULL,
  '300 AC',
  'El caballero más bello de Poniente y hermano de Margaery. Su amor por Renly lo llevó a unirse a su causa. Murió en la destrucción del Septo de Baelor.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Olenna Tyrell',
  'olenna-tyrell',
  ARRAY['La Reina de las Espinas'],
  (SELECT id FROM houses WHERE slug = 'tyrell'),
  'Andal',
  'muerto',
  NULL,
  NULL,
  'La abuela de Margaery cuya astucia política superaba a la de cualquier hombre. Envenenó a Joffrey para proteger a su nieta.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Mace Tyrell',
  'mace-tyrell',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'tyrell'),
  'Andal',
  'muerto',
  NULL,
  '300 AC',
  'El patriarca de los Tyrell que ambicionaba ser Mano del Rey. Su orgullo y su hambre de poder lo llevaron a apoyar a diferentes bandos durante la guerra.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Oberyn Martell',
  'oberyn-martell',
  ARRAY['La Víbora Roja'],
  (SELECT id FROM houses WHERE slug = 'martell'),
  'Dorniense',
  'muerto',
  NULL,
  '300 AC',
  'El príncipe guerrero de Dorne que viajó a Desembarco del Rey para vengar a su hermana Elia. Su duelo con The Mountain terminó en su muerte.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Doran Martell',
  'doran-martell',
  ARRAY['El Príncipe Paciente'],
  (SELECT id FROM houses WHERE slug = 'martell'),
  'Dorniense',
  'muerto',
  NULL,
  NULL,
  'El príncipe de Dorne cuya enfermedad no impidió que tejiera alianzas complejas. Su paciencia ocultaba una mente estratégica implacable.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Arianne Martell',
  'arianne-martell',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'martell'),
  'Dorniense',
  'vivo',
  NULL,
  NULL,
  'La hija mayor de Doran que heredaría Sunspear. Su ambición y su inteligencia la convierten en una jugadora política formidable.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Barristan Selmy',
  'barristan-selmy',
  ARRAY['Barristan el Temerario'],
  (SELECT id FROM houses WHERE slug = 'selmy'),
  'Andal',
  'muerto',
  NULL,
  '300 AC',
  'El caballero más honorable de Poniente que sirvió en la Guardia Real durante cinco reinados. Tras ser desterrado por Joffrey, se unió a Daenerys.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Podrick Payne',
  'podrick-payne',
  ARRAY['Pod'],
  NULL,
  'Andal',
  'vivo',
  NULL,
  NULL,
  'Un escudero leal que acompañó a Tyrion y luego a Brienne. Su devoción y su crecimiento como guerrero lo convirtieron en un héroe silencioso.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Jorah Mormont',
  'jorah-mormont',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'mormont'),
  'Norteño',
  'muerto',
  NULL,
  NULL,
  'Un caballero norteño que vendió esclavos y huyó de Poniente. Sirvió a Daenerys con lealtad inquebrantable hasta su muerte.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Roose Bolton',
  'roose-bolton',
  ARRAY['El Señor de la Piel de Hombre'],
  (SELECT id FROM houses WHERE slug = 'bolton'),
  'Norteño',
  'muerto',
  NULL,
  '300 AC',
  'Un señor norteño cuya crueldad era tan fría como su voz. Traicionó a Robb Stark en la Boda Roja y pagó con su vida.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Ramsay Bolton',
  'ramsay-bolton',
  ARRAY['Ramsay el Bastardo', 'Ramsay Snow'],
  (SELECT id FROM houses WHERE slug = 'bolton'),
  'Norteño',
  'muerto',
  NULL,
  '300 AC',
  'El bastardo legítimado de Roose Bolton cuya crueldad superaba la de su padre. Su obsesión por la destrucción lo convirtió en uno de los villanos más odiados.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Walder Frey',
  'walder-frey',
  ARRAY['El Viejo Lobo del Río'],
  (SELECT id FROM houses WHERE slug = 'frey'),
  'Riverlands',
  'muerto',
  NULL,
  '305 AC',
  'El patriarca de los Frey cuya longevidad y prolificidad aseguraron la supervivencia de su casa. Orquestó la Boda Roja y pagó con su vida.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Howland Reed',
  'howland-reed',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'reed'),
  'Lacustre',
  'vivo',
  NULL,
  NULL,
  'El señor de los pantanos que fue el único testigo de la Torre de la Alegría. Su conocimiento de los niños del bosque es invaluable.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Jojen Reed',
  'jojen-reed',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'reed'),
  'Lacustre',
  'muerto',
  NULL,
  NULL,
  'El hijo de Howland con poderes de greensight que guió a Bran hacia el Cuervos de Tres Ojos. Sus sueños proféticos lo hicieron invaluable.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Meera Reed',
  'meera-reed',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'reed'),
  'Lacustre',
  'vivo',
  NULL,
  NULL,
  'La hermana de Jojen que protegió a Bran durante su viaje. Una guerrera ágil y leal que lo guió a través de los pantanos.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Ser Rodrik Cassel',
  'ser-rodrik-cassel',
  ARRAY[]::text[],
  NULL,
  'Norteño',
  'muerto',
  NULL,
  NULL,
  'El castellano de Invernalia y maestro de armas. Un hombre leal que entrenó a los hijos Stark. Murió intentando recuperar Invernalia.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Maester Luwin',
  'maester-luwin',
  ARRAY[]::text[],
  NULL,
  'Desconocido',
  'muerto',
  NULL,
  NULL,
  'El maestre de Invernalia que sirvió a la casa Stark. Un hombre sabio y compasivo que cuidó de los niños después de la muerte de Ned.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Osha',
  'osha',
  ARRAY[]::text[],
  NULL,
  'Salvaje',
  'vivo',
  NULL,
  NULL,
  'Una salvaje que protegió a Rickon y Bran después de la caída de Invernalia. Su instinto de supervivencia la hizo una aliada valiosa.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Hodor',
  'hodor',
  ARRAY['Wylis'],
  NULL,
  'Norteño',
  'muerto',
  NULL,
  NULL,
  'Un gigante bondadoso cuya única palabra era ''Hodor''. Sirvió como portador de Bran Stark durante años. Su verdadero nombre era Wylis.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Yoren',
  'yoren',
  ARRAY[]::text[],
  NULL,
  'Desconocido',
  'muerto',
  NULL,
  NULL,
  'Un hermano de la Guardia de la Noche que intentó llevar a Arya a Invernalia. Murió protegiendo a los jóvenes reclutas.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Syrio Forel',
  'syrio-forel',
  ARRAY['El Primer Espada de Braavos'],
  NULL,
  'Braavosi',
  'muerto',
  NULL,
  NULL,
  'Un maestro espadachín braavosi que entrenó a Arya Stark. Sus enseñanzas de supervivencia y combate la salvaron la vida.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Hot Pie',
  'hot-pie',
  ARRAY[]::text[],
  NULL,
  'Desconocido',
  'vivo',
  NULL,
  NULL,
  'Un joven cocinero que viajó con Arya y Gendry. Su habilidad para hacer pasteles lo hizo memorable entre los viajeros.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Lommy Manosverdes',
  'lommy-manosverdes',
  ARRAY[]::text[],
  NULL,
  'Desconocido',
  'muerto',
  NULL,
  NULL,
  'Un joven herido que viajó con Arya y Gendry. Murió asesinado por los Lannister.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Shae',
  'shae',
  ARRAY[]::text[],
  NULL,
  'Desconocido',
  'muerto',
  NULL,
  NULL,
  'Una cortesana que se convirtió en la amante de Tyrion. Su traición lo llevó a asesinarla.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Ros',
  'ros',
  ARRAY[]::text[],
  NULL,
  'Desconocido',
  'muerto',
  NULL,
  NULL,
  'Una prostituta del Norte que se convirtió en informante de Varys. Su inteligencia la hizo valiosa, pero su destino fue trágico.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Illyrio Mopatis',
  'illyrio-mopatis',
  ARRAY[]::text[],
  NULL,
  'Braavosi',
  'vivo',
  NULL,
  NULL,
  'Un magíster de Pentos que alojó a Daenerys y Viserys. Su apoyo a los Targaryen tenía motivos ocultos.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Xaro Xhoan Daxos',
  'xaro-xhoan-daxos',
  ARRAY[]::text[],
  NULL,
  'Qartheño',
  'muerto',
  NULL,
  NULL,
  'Un rico mercader de Qarth que ofreció su ayuda a Daenerys. Su traición lo llevó a ser encerrado en su propia cámara del tesoro.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Daario Naharis',
  'daario-naharis',
  ARRAY[]::text[],
  NULL,
  'Tyroshi',
  'vivo',
  NULL,
  NULL,
  'Un mercenario tyroshi que se convirtió en el amante de Daenerys. Su carisma y habilidad con las dagas lo hicieron invaluable.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Grey Worm',
  'grey-worm',
  ARRAY['Torgo Nudho'],
  NULL,
  'Ghiscari',
  'vivo',
  NULL,
  NULL,
  'El comandante de los Inmaculados que sirvió a Daenerys con lealtad absoluta. Su nombre fue elegido el día de su liberación.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Missandei',
  'missandei',
  ARRAY[]::text[],
  NULL,
  'Naathi',
  'muerto',
  NULL,
  NULL,
  'Una esclava liberada que se convirtió en consejera y traductora de Daenerys. Su muerte fue el detonante de la caída de Desembarco del Rey.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Edmure Tully',
  'edmure-tully',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'tully'),
  'Riverlands',
  'vivo',
  NULL,
  NULL,
  'El hermano menor de Catelyn que heredó Riverrun. Su impulsividad le causó problemas durante la guerra.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Hoster Tully',
  'hoster-tully',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'tully'),
  'Riverlands',
  'muerto',
  NULL,
  NULL,
  'El patriarca de los Tully que unió sus tierras por matrimonio. Murió durante la guerra.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Lysa Arryn',
  'lysa-arryn',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'tully'),
  'Riverlands',
  'muerto',
  NULL,
  '305 AC',
  'La hermana de Catelyn que mantuvo al Valle neutral durante la guerra. Su amor por Petyr Baelish la llevó a la locura.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Robert Arryn',
  'robert-arryn',
  ARRAY['Sweetrobin'],
  (SELECT id FROM houses WHERE slug = 'arryn'),
  'Andal',
  'vivo',
  NULL,
  NULL,
  'El hijo de Jon Arryn y Lysa, un niño enfermizo que fue el señor del Nido de Águilas.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Brynden Tully',
  'brynden-tully',
  ARRAY['El Pez Negro'],
  (SELECT id FROM houses WHERE slug = 'tully'),
  'Riverlands',
  'vivo',
  NULL,
  NULL,
  'El hermano menor de Hoster Tully, un guerrero legendario que sirvió en la Guardia de la Noche.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Janos Slynt',
  'janos-slynt',
  ARRAY[]::text[],
  NULL,
  'Desconocido',
  'muerto',
  NULL,
  NULL,
  'Un soldado corrupto que ascendió a Lord de Harrenhal. Jon Nieve lo ejecutó por insubordinación.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Sandor Clegane',
  'sandor-clegane',
  ARRAY['El Perro', 'El Perro de Guerra'],
  NULL,
  'Andal',
  'vivo',
  NULL,
  NULL,
  'El hermano menor de Gregor, un guerrero temible que protegió a Sansa y luego a Arya. Su rostro quemado reflejaba su interior.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Gregor Clegane',
  'gregor-clegane',
  ARRAY['The Mountain', 'La Montaña'],
  NULL,
  'Andal',
  'muerto',
  NULL,
  NULL,
  'Un gigante cruel y sin escrúpulos que sirvió a los Lannister. Su fuerza brutal lo hizo legendario.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Ilyn Payne',
  'ilyn-payne',
  ARRAY[]::text[],
  NULL,
  'Andal',
  'vivo',
  NULL,
  NULL,
  'El verdugo del rey que ejecutó a Eddard Stark. Un hombre mudo que sirvió como instrumento de la justicia real.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Ygritte',
  'ygritte',
  ARRAY[]::text[],
  NULL,
  'Salvaje',
  'muerto',
  NULL,
  NULL,
  'Una salvaje de pelo rojo que se enamoró de Jon Nieve. Su frase ''No sabes nada, Jon Nieve'' se hizo legendaria.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Craster',
  'craster',
  ARRAY[]::text[],
  NULL,
  'Salvaje',
  'muerto',
  NULL,
  NULL,
  'Un salvaje que mantenía a sus hijas como esposas y ofrecía sus hijos varones a los Caminantes Blancos. Murió asesinado por sus propios hombres.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Gilly',
  'gilly',
  ARRAY[]::text[],
  NULL,
  'Salvaje',
  'vivo',
  NULL,
  NULL,
  'Una de las hijas de Craster que escapó con Samwell Tarly. Su fuerza y determinación la convirtieron en una sobreviviente.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Qhorin Halfhand',
  'qhorin-halfhand',
  ARRAY[]::text[],
  NULL,
  'Desconocido',
  'muerto',
  NULL,
  NULL,
  'Un veterano de la Guardia de la Noche que ordenó a Jon infiltrarse entre los salvajes. Murió en combate para cubrir la fuga de Jon.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Maester Aemon',
  'maester-aemon',
  ARRAY['Aemon Targaryen'],
  (SELECT id FROM houses WHERE slug = 'targaryen'),
  'Desconocido',
  'muerto',
  NULL,
  NULL,
  'Un maestre ciego de la Guardia de la Noche que era un Targaryen. Su sabiduría guió a Jon Nieve en momentos difíciles.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Paxter Redwyne',
  'paxter-redwyne',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'redwyne'),
  'Andal',
  'vivo',
  NULL,
  NULL,
  'El señor de la Isla de las Uvas que puso sitio a Bastión de Tormentas durante la rebelión.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Rickard Karstark',
  'rickard-karstark',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'karstark'),
  'Norteño',
  'muerto',
  NULL,
  NULL,
  'Un señor norteño que buscó venganza por la muerte de sus hijos. Robb lo ejecutó por insubordinación.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Greatjon Umber',
  'greatjon-umber',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'umber'),
  'Norteño',
  'vivo',
  NULL,
  NULL,
  'El primer señor norteño en proclamar a Robb como rey. Un guerrero gigantesco cuya lealtad era inquebrantable.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Wyman Manderly',
  'wyman-manderly',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'manderly'),
  'Norteño',
  'vivo',
  NULL,
  NULL,
  'El señor de Puerto Blanco, un hombre obeso pero inteligente que mantuvo la lealtad a los Stark en secreto.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Galbart Glover',
  'galbart-glover',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'glover'),
  'Norteño',
  'vivo',
  NULL,
  NULL,
  'Un señor norteño que perdió su castillo en la guerra. Su lealtad a los Stark nunca se tambaleó.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Jason Mallister',
  'jason-mallister',
  ARRAY[]::text[],
  NULL,
  'Riverlands',
  'vivo',
  NULL,
  NULL,
  'Un caballero de los Ríos que luchó en la rebelión de Robert.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Kevan Lannister',
  'kevan-lannister',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'lannister'),
  'Occidental',
  'muerto',
  NULL,
  NULL,
  'El hermano menor de Tywin, un hombre competente que intentó restaurar el orden después de la muerte de Cersei.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Lancel Lannister',
  'lancel-lannister',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'lannister'),
  'Occidental',
  'muerto',
  NULL,
  NULL,
  'Un joven Lannister que sirvió como escudero de Robert y luego se unió a la Guardia de la Rey.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Arthur Dayne',
  'arthur-dayne',
  ARRAY['La Espada de la Mañana'],
  (SELECT id FROM houses WHERE slug = 'dayne'),
  'Dorniense',
  'muerto',
  NULL,
  NULL,
  'El caballero más legendario de Poniente, guardia personal de Rhaegar Targaryen. Murió en la Torre de la Alegría.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Elia Martell',
  'elia-martell',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'martell'),
  'Dorniense',
  'muerto',
  NULL,
  NULL,
  'La esposa de Rhaegar que fue asesinada durante el Saqueo de Desembarco del Rey. Su muerte fue vengada por Oberyn.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Aenys I Targaryen',
  'aenys-i-targaryen',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'targaryen'),
  'Valyrio',
  'muerto',
  NULL,
  NULL,
  'El hijo de Aegon el Conquistador, un rey débil que luchó contra los Fétidos y los Púrpura.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Maegor I Targaryen',
  'maegor-i-targaryen',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'targaryen'),
  'Valyrio',
  'muerto',
  NULL,
  NULL,
  'El hermano cruel de Aenys que construyó Harrenhal y gobernó con mano de hierro.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Jaehaerys I Targaryen',
  'jaehaerys-i-targaryen',
  ARRAY['El Rey Conciliador'],
  (SELECT id FROM houses WHERE slug = 'targaryen'),
  'Valyrio',
  'muerto',
  NULL,
  NULL,
  'El rey más longevo y sabio de la dinastía Targaryen, que gobernó durante cincuenta y cinco años.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Viserys I Targaryen',
  'viserys-i-targaryen',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'targaryen'),
  'Valyrio',
  'muerto',
  NULL,
  NULL,
  'El rey cuya muerte desencadenó la Danza de los Dragones.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Aegon II Targaryen',
  'aegon-ii-targaryen',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'targaryen'),
  'Valyrio',
  'muerto',
  NULL,
  NULL,
  'El rey usurpador durante la Danza de los Dragones.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Rhaenyra Targaryen',
  'rhaenyra-targaryen',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'targaryen'),
  'Valyrio',
  'muerto',
  NULL,
  NULL,
  'La primera reina de los Siete Reinos, cuyo reinado fue efímero y trágico.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Aegon III Targaryen',
  'aegon-iii-targaryen',
  ARRAY['El Desconsolado'],
  (SELECT id FROM houses WHERE slug = 'targaryen'),
  'Valyrio',
  'muerto',
  NULL,
  NULL,
  'El rey que gobernó después de la Danza de los Dragones, marcado por la tragedia.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Daeron I Targaryen',
  'daeron-i-targaryen',
  ARRAY['El Joven Dragón'],
  (SELECT id FROM houses WHERE slug = 'targaryen'),
  'Valyrio',
  'muerto',
  NULL,
  NULL,
  'El rey que conquistó Dorne, pero no pudo mantenerla.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Baelor I Targaryen',
  'baelor-i-targaryen',
  ARRAY['El Bendito'],
  (SELECT id FROM houses WHERE slug = 'targaryen'),
  'Valyrio',
  'muerto',
  NULL,
  NULL,
  'El rey santo que construyó el Septo de Baelor y gobernó con piedad.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Aegon IV Targaryen',
  'aegon-iv-targaryen',
  ARRAY['El Indigno'],
  (SELECT id FROM houses WHERE slug = 'targaryen'),
  'Valyrio',
  'muerto',
  NULL,
  NULL,
  'El rey cuya corrupción y bastardos desencadenaron las Rebeliones Blackfyre.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Daeron II Targaryen',
  'daeron-ii-targaryen',
  ARRAY['El Bueno'],
  (SELECT id FROM houses WHERE slug = 'targaryen'),
  'Valyrio',
  'muerto',
  NULL,
  NULL,
  'El rey que unió Dorne a los Siete Reinos mediante matrimonio.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Aegon V Targaryen',
  'aegon-v-targaryen',
  ARRAY['Egg', 'El Improvisado'],
  (SELECT id FROM houses WHERE slug = 'targaryen'),
  'Valyrio',
  'muerto',
  NULL,
  NULL,
  'El rey que intentó devolver los dragones al mundo y murió en el Desastre de Sothoros.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Daemon Blackfyre',
  'daemon-blackfyre',
  ARRAY[]::text[],
  NULL,
  'Valyrio',
  'muerto',
  NULL,
  NULL,
  'El bastardo legítimo de Aegon IV que reclamó el trono y desencadenó las Rebeliones Blackfyre.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Brynden Rivers',
  'brynden-rivers',
  ARRAY['Bloodraven', 'El Cuervos de Tres Ojos'],
  (SELECT id FROM houses WHERE slug = 'targaryen'),
  'Valyrio',
  'muerto',
  NULL,
  NULL,
  'El bastard que sirvió como Mano del Rey y luego se convirtió en el Cuervos de Tres Ojos.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Aegor Rivers',
  'aegor-rivers',
  ARRAY['Bittersteel'],
  NULL,
  'Valyrio',
  'muerto',
  NULL,
  NULL,
  'El bastardo que fundó la Compañía Dorada para luchar por la causa Blackfyre.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Shiera Seastar',
  'shiera-seastar',
  ARRAY[]::text[],
  NULL,
  'Valyrio',
  'muerto',
  NULL,
  NULL,
  'La hermana bastard de Bloodraven, una mujer de extraordinaria belleza y poder mágico.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Aerys II Targaryen',
  'aerys-ii-targaryen',
  ARRAY['El Rey Loco'],
  (SELECT id FROM houses WHERE slug = 'targaryen'),
  'Valyrio',
  'muerto',
  NULL,
  NULL,
  'El último rey Targaryen, cuya locura llevó a su derrocamiento.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Myrcella Baratheon',
  'myrcella-baratheon',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'baratheon'),
  'Andal',
  'muerto',
  NULL,
  NULL,
  'La hija de Cersei y Robert, una joven dulce que fue enviada a Dorne como promesa de paz. Fue envenenada por el príncipe Doran.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Tommen Baratheon',
  'tommen-baratheon',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'baratheon'),
  'Andal',
  'muerto',
  NULL,
  NULL,
  'El hijo menor de Cersei, un niño bondadoso que fue rey tras la muerte de Joffrey. Se suicidó tras la destrucción del Septo de Baelor.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Shireen Baratheon',
  'shireen-baratheon',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'baratheon'),
  'Andal',
  'muerto',
  NULL,
  NULL,
  'La hija de Stannis, una niña amable que sobrevivió a la escamadura. Fue quemada viva por su padre como sacrificio al Señor de la Luz.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Selyse Florent',
  'selyse-florent',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'florent'),
  'Andal',
  'muerto',
  NULL,
  NULL,
  'La esposa de Stannis, una mujer orgullosa de su sangre florent que abrazó la fe del Señor de la Luz.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Amory Lorch',
  'amory-lorch',
  ARRAY[]::text[],
  NULL,
  'Occidental',
  'muerto',
  NULL,
  NULL,
  'Un caballero leal a los Lannister que asesinó a los niños de Rhaegar con Elia Martell. Participó en la Guerra de los Cinco Reyes.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Vargo Hoat',
  'vargo-hoat',
  ARRAY[]::text[],
  NULL,
  'Qohorik',
  'muerto',
  NULL,
  NULL,
  'Un mercenario qohorik que comandó la Compañía Maldita. Traicionó a los Lannister y mutiló a Jaime Lannister.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Arys Oakheart',
  'arys-oakheart',
  ARRAY[]::text[],
  NULL,
  'Andal',
  'muerto',
  NULL,
  NULL,
  'Un Guardia Real que fue enviado a proteger a Myrcella en Dorne. Murió en un intento de fuga con Arianne Martell.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Balon Swann',
  'balon-swann',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'swann'),
  'Andal',
  'vivo',
  NULL,
  NULL,
  'Un caballero leal de la Guardia Real, enviado a Dorne tras la muerte de Arys Oakheart.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Meryn Trant',
  'meryn-trant',
  ARRAY[]::text[],
  NULL,
  'Andal',
  'muerto',
  NULL,
  NULL,
  'Un Guardia Real sin escrúpulos que sirvió lealmente a Joffrey. Murió asesinado por Arya Stark en Braavos.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Boros Blount',
  'boros-blount',
  ARRAY[]::text[],
  NULL,
  'Andal',
  'vivo',
  NULL,
  NULL,
  'Un Guardia Real cobarde que fue despojado de su rango por cobardería.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Preston Greenfield',
  'preston-greenfield',
  ARRAY[]::text[],
  NULL,
  'Andal',
  'muerto',
  NULL,
  NULL,
  'Un Guardia Real que murió en la destrucción del Septo de Baelor.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Mandon Moore',
  'mandon-moore',
  ARRAY[]::text[],
  NULL,
  'Andal',
  'muerto',
  NULL,
  NULL,
  'Un Guardia Real que intentó asesinar a Tyrion en la Batalla del Aguas Negras. Fue muerto por Podrick Payne.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Alliser Thorne',
  'alliser-thorne',
  ARRAY[]::text[],
  NULL,
  'Andal',
  'muerto',
  NULL,
  NULL,
  'Un veterano de la Guardia de la Noche que se opuso a Jon Nieve. Lideró el motín que asesinó a Jon.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Bowen Marsh',
  'bowen-marsh',
  ARRAY[]::text[],
  NULL,
  'Norteño',
  'muerto',
  NULL,
  NULL,
  'El Lord Interno de la Guardia de la Noche que apuñaló a Jon Nieve durante el motín.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Qyburn',
  'qyburn',
  ARRAY[]::text[],
  NULL,
  'Andal',
  'vivo',
  NULL,
  NULL,
  'Un maestre despojado de sus cadenas por experimentos prohibidos. Se convirtió en el consejero de Cersei y creó a Ser Robert Strong.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Septa Unella',
  'septa-unella',
  ARRAY['La Campana'],
  NULL,
  'Andal',
  'vivo',
  NULL,
  NULL,
  'Una septa que torturó a Cersei durante su penitencia. Fue capturada por The Mountain como venganza.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Marwyn',
  'marwyn',
  ARRAY['El Puño'],
  NULL,
  'Desconocido',
  'vivo',
  NULL,
  NULL,
  'Un Archimaestre de la Ciudadela que creía en la magia. Viajó a Essos para buscar respuestas.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Edric Storm',
  'edric-storm',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'baratheon'),
  'Andal',
  'vivo',
  NULL,
  NULL,
  'El bastardо más reconocido de Robert Baratheon, criado en Stokeworth. Fue liberado por Davos para evitar que Stannis lo sacrificara.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Mya Stone',
  'mya-stone',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'baratheon'),
  'Desconocido',
  'vivo',
  NULL,
  NULL,
  'Una bastardа de Robert que trabaja como guía en el Nido de Águilas.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Barra',
  'barra',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'baratheon'),
  'Desconocido',
  'muerto',
  NULL,
  NULL,
  'Una bebé bastardа de Robert que fue asesinada por orden de Joffrey.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Bella',
  'bella',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'baratheon'),
  'Desconocido',
  'vivo',
  NULL,
  NULL,
  'Una bastardа de Robert que trabaja en un burdel de Desembarco del Rey.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Edric Dayne',
  'edric-dayne',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'dayne'),
  'Dorniense',
  'vivo',
  NULL,
  NULL,
  'El joven señor de Starfall que se encontró con Arya en el camino. Le contó sobre Wylla, la ama de leche de Jon Nieve.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Gerold Dayne',
  'gerold-dayne',
  ARRAY['Darkstar'],
  (SELECT id FROM houses WHERE slug = 'dayne'),
  'Dorniense',
  'vivo',
  NULL,
  NULL,
  'Un caballero dorniense oscuro y peligroso. Intentó asesinar a Myrcella para provocar una guerra.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Quentyn Martell',
  'quentyn-martell',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'martell'),
  'Dorniense',
  'muerto',
  NULL,
  NULL,
  'El hijo de Doran que viajó a Meereen para casarse con Daenerys. Murió intentando liberar dragones.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Trystane Martell',
  'trystane-martell',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'martell'),
  'Dorniense',
  'muerto',
  NULL,
  NULL,
  'El hijo menor de Doran, prometido a Myrcella Baratheon. Murió cuando ella fue asesinada.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Garlan Tyrell',
  'garlan-tyrell',
  ARRAY['Garlan el Brillante'],
  (SELECT id FROM houses WHERE slug = 'tyrell'),
  'Andal',
  'vivo',
  NULL,
  NULL,
  'El segundo hijo de Mace, un guerrero más talentoso que su hermano Loras. Luchó en la Batalla del Aguas Negras.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Willas Tyrell',
  'willas-tyrell',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'tyrell'),
  'Andal',
  'vivo',
  NULL,
  NULL,
  'El hijo mayor de Mace, cojo por un accidente con un caballo. Un erudito que cría halcones.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Robar Royce',
  'robar-royce',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'royce'),
  'Andal',
  'muerto',
  NULL,
  NULL,
  'Un caballero del Valle que sirvió a Renly. Fue ejecutado por ejecutar la justicia por su cuenta.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Emmon Frey',
  'emmon-frey',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'frey'),
  'Riverlands',
  'muerto',
  NULL,
  NULL,
  'Un hijo de Walder Frey que se casó con una Lannister. Fue nombrado Señor de Riverrun.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Hosteen Frey',
  'hosteen-frey',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'frey'),
  'Riverlands',
  'vivo',
  NULL,
  NULL,
  'Un hijo guerrero de Walder Frey, uno de los más agresivos de su familia.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Lothar Frey',
  'lothar-frey',
  ARRAY['Lame Lothar'],
  (SELECT id FROM houses WHERE slug = 'frey'),
  'Riverlands',
  'vivo',
  NULL,
  NULL,
  'Un hijo cojo de Walder Frey, el estratega detrás de la Boda Roja.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Lyonel Strong',
  'lyonel-strong',
  ARRAY[]::text[],
  NULL,
  'Andal',
  'muerto',
  NULL,
  NULL,
  'El Señor de Harrenhal durante la era Targaryen, un hombre sabio y justo.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Larys Strong',
  'larys-strong',
  ARRAY['El Pie Cojo'],
  NULL,
  'Andal',
  'vivo',
  NULL,
  NULL,
  'El hijo de Lyonel que heredó Harrenhal. Un hombre astuto y peligroso que sirvió como confidente de Cersei.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Tygett Lannister',
  'tygett-lannister',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'lannister'),
  'Occidental',
  'muerto',
  NULL,
  NULL,
  'El hermano menor de Tywin, un guerrero competente que murió en la rebelión de Robert.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Genna Lannister',
  'genna-lannister',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'lannister'),
  'Occidental',
  'vivo',
  NULL,
  NULL,
  'La hermana mayor de Tywin, la más fuerte de los Lannister. Se casó con Emmon Frey.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Gerion Lannister',
  'gerion-lannister',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'lannister'),
  'Occidental',
  'desconocido',
  NULL,
  NULL,
  'El hermano menor de Tywin, un aventurero que desapareció en un viaje a Valyria.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Jeyne Westerling',
  'jeyne-westerling',
  ARRAY[]::text[],
  NULL,
  'Occidental',
  'vivo',
  NULL,
  NULL,
  'La joven que sedujo a Robb Stark y se casó con él, rompiendo su compromiso con los Frey.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Roslin Frey',
  'roslin-frey',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'frey'),
  'Riverlands',
  'vivo',
  NULL,
  NULL,
  'La hija de Walder Frey que se casó con Edmure Tully en la Boda Roja. Una joven inocente en una familia brutal.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Jeyne Poole',
  'jeyne-poole',
  ARRAY['Arya Stark'],
  NULL,
  'Norteño',
  'vivo',
  NULL,
  NULL,
  'La hija del mayordomo de Invernalia, forzada a hacerse pasar por Arya Stark para legitimar el dominio Bolton sobre el Norte.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Irri',
  'irri',
  ARRAY[]::text[],
  NULL,
  'Dothraki',
  'muerto',
  NULL,
  NULL,
  'Una esclava dothraki que sirvió a Daenerys. Le enseñó a montar y fue leal hasta su muerte.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Jhiqui',
  'jhiqui',
  ARRAY[]::text[],
  NULL,
  'Dothraki',
  'vivo',
  NULL,
  NULL,
  'Una esclava dothraki que sirvió a Daenerys junto con Irri.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Hizdahr zo Loraq',
  'hizdahr-zo-loraq',
  ARRAY[]::text[],
  NULL,
  'Ghiscari',
  'muerto',
  NULL,
  NULL,
  'Un noble de Meereen que se casó con Daenerys para traer la paz. Fue acusado de envenenar a sus esposas.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Skahaz mo Kandaq',
  'skahaz-mo-kandaq',
  ARRAY['La Mano Pálida'],
  NULL,
  'Ghiscari',
  'muerto',
  NULL,
  NULL,
  'Un noble ghiscari que se unió a Daenerys y comandó la Policía de Huesos en Meereen.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Dalla',
  'dalla',
  ARRAY[]::text[],
  NULL,
  'Salvaje',
  'muerto',
  NULL,
  NULL,
  'La esposa de Tormund que murió dando a luz a su hijo Tormenta.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Lynesse Hightower',
  'lynesse-hightower',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'hightower'),
  'Andal',
  'vivo',
  NULL,
  NULL,
  'La primera esposa de Jorah Mormont, una joven de la Alta Torre que lo dejó por no ser suficientemente rico.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Randyll Tarly',
  'randyll-tarly',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'tarly'),
  'Andal',
  'muerto',
  NULL,
  NULL,
  'El padre de Samwell, un guerrero implacable que despreciaba a su hijo mayor por su cobardía.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Dickon Tarly',
  'dickon-tarly',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'tarly'),
  'Andal',
  'muerto',
  NULL,
  NULL,
  'El hijo menor de Randyll, un joven guerrero que murió junto a su padre resistiendo a Daenerys.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Talisa Maegyr',
  'talisa-maegyr',
  ARRAY[]::text[],
  NULL,
  'Volantena',
  'muerto',
  NULL,
  '299 AC',
  'Una curandera volantena que se casó con Robb Stark. Murió asesinada en la Boda Roja junto con su esposo.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Lollys Stokeworth',
  'lollys-stokeworth',
  ARRAY[]::text[],
  NULL,
  'Andal',
  'vivo',
  NULL,
  NULL,
  'Una mujer simple que se casó con Bronn después de que él la rescatara.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'The Night King',
  'the-night-king',
  ARRAY['El Rey de la Noche', 'Primer Caminante Blanco'],
  NULL,
  'Primordial',
  'muerto',
  NULL,
  NULL,
  'El primer Caminante Blanco, creado por los Niños del Bosque. Lideró la amenaza del invierno eterno desde más allá del Muro.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Walgrave',
  'walgrave',
  ARRAY[]::text[],
  NULL,
  'Desconocido',
  'muerto',
  NULL,
  NULL,
  'Un Archimaestre anciano de la Ciudadela, conocido por su memoria defectuosa.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Stonesnake',
  'stonesnake',
  ARRAY[]::text[],
  NULL,
  'Desconocido',
  'desconocido',
  NULL,
  NULL,
  'Un hermano de la Guardia de la Noche, experto escalador que participó en una patrulla más allá del Muro.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Dolorous Edd',
  'dolorous-edd',
  ARRAY['Eddison Tollett'],
  NULL,
  'Norteño',
  'vivo',
  NULL,
  NULL,
  'Un hermano de la Guardia de la Noche conocido por su perpetuo pesimismo. Fue amigo cercano de Jon Nieve.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Orell',
  'orell',
  ARRAY[]::text[],
  NULL,
  'Salvaje',
  'muerto',
  NULL,
  NULL,
  'Un salvaje que hablaba con las águilas y se enamoró de Ygritte. Murió en combate con Jon Nieve.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Jafer Flowers',
  'jafer-flowers',
  ARRAY[]::text[],
  NULL,
  'Desconocido',
  'muerto',
  NULL,
  NULL,
  'Un hermano de la Guardia de la Noche que fue asesinado y se convirtió en caminante blanco.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Arryk',
  'arryk',
  ARRAY[]::text[],
  NULL,
  'Andal',
  'muerto',
  NULL,
  NULL,
  'Uno de los gemelos de la Guardia Real que sirvió durante la era Targaryen.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Erryk',
  'erryk',
  ARRAY[]::text[],
  NULL,
  'Andal',
  'muerto',
  NULL,
  NULL,
  'Uno de los gemelos de la Guardia Real que sirvió durante la era Targaryen.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Hugh el Fuerte',
  'hugh-el-fuerte',
  ARRAY[]::text[],
  NULL,
  'Andal',
  'muerto',
  NULL,
  NULL,
  'Un caballero que fue nombrado Guardia Real por Joffrey y murió en la Batalla del Aguas Negras.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Galazza Galare',
  'galazza-galare',
  ARRAY[]::text[],
  NULL,
  'Ghiscari',
  'vivo',
  NULL,
  NULL,
  'La Alta Sacerdotisa de Meereen, una de las manses ancianas de la ciudad.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Reznak mo Haqlo',
  'reznak-mo-haqlo',
  ARRAY[]::text[],
  NULL,
  'Ghiscari',
  'vivo',
  NULL,
  NULL,
  'El Alguacil de Meereen que sirvió bajo Daenerys. Un hombre astuto que jugó con varias bandas.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Joanna Lannister',
  'joanna-lannister',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'lannister'),
  'Occidental',
  'muerto',
  NULL,
  '273 AC',
  'La esposa de Tywin y madre de los tres Lannister principales. Su muerte al dar a luz a Tyrion fue el origen del odio de Tywin hacia su hijo menor.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Tytos Lannister',
  'tytos-lannister',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'lannister'),
  'Occidental',
  'muerto',
  NULL,
  NULL,
  'El padre de Tywin, un hombre débil cuya generosidad fue explotada por sus vasallos. Su debilidad forjó la obsesión de Tywin por la fortaleza.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Jeyne Marbrand',
  'jeyne-marbrand',
  ARRAY[]::text[],
  NULL,
  'Occidental',
  'muerto',
  NULL,
  NULL,
  'La esposa de Tytos Lannister y madre de Tywin.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Tysha',
  'tysha',
  ARRAY[]::text[],
  NULL,
  'Desconocido',
  'desconocido',
  NULL,
  NULL,
  'Una campesina que Tyrion se casó en secreto. Tywin la obligó a acostarse con sus guardias y le hizo creer a Tyrion que era una prostituta.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Steffon Baratheon',
  'steffon-baratheon',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'baratheon'),
  'Andal',
  'muerto',
  NULL,
  NULL,
  'El padre de los tres Baratheon, un señor orgulloso que murió en un naufragio frente a los Muros de Storm''s End.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Cassana Estermont',
  'cassana-estermont',
  ARRAY[]::text[],
  NULL,
  'Andal',
  'muerto',
  NULL,
  NULL,
  'La madre de los Baratheon, de la casa Estermont.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Rhaella Targaryen',
  'rhaella-targaryen',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'targaryen'),
  'Valyrio',
  'muerto',
  NULL,
  NULL,
  'La esposa de Aerys II y madre de Daenerys. Murió dando a luz a Daenerys en una tormenta en Rocadragón.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Rhaenys Targaryen',
  'rhaenys-targaryen',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'targaryen'),
  'Valyrio',
  'muerto',
  NULL,
  NULL,
  'La hermana y esposa de Aegon el Conquistador. Compartió su trono y montó al dragón Meraxes.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Visenya Targaryen',
  'visenya-targaryen',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'targaryen'),
  'Valyrio',
  'muerto',
  NULL,
  NULL,
  'La hermana y esposa de Aegon el Conquistador, conocida por su temperamento feroz. Montó al dragón Vhagar.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Jaehaerys II Targaryen',
  'jaehaerys-ii-targaryen',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'targaryen'),
  'Valyrio',
  'muerto',
  NULL,
  NULL,
  'El padre de Aerys II, un rey de corto reinado cuyo mandato quedó eclipsado por el de su padre y su hijo.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Rhaego',
  'rhaego',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'targaryen'),
  'Dothraki',
  'muerto',
  NULL,
  '298 AC',
  'El hijo no nacido de Daenerys y Drogo, cuya muerte fue el precio del pacto con la magia roja.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Rodrik Greyjoy',
  'rodrik-greyjoy',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'greyjoy'),
  'Islas de Hierro',
  'muerto',
  NULL,
  NULL,
  'El hijo de Balon que murió en la rebelión contra los Stark.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Maron Greyjoy',
  'maron-greyjoy',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'greyjoy'),
  'Islas de Hierro',
  'muerto',
  NULL,
  NULL,
  'El hijo de Balon que murió en la rebelión contra los Stark.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Alannys Harlaw',
  'alannys-harlaw',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'harlaw'),
  'Islas de Hierro',
  'vivo',
  NULL,
  NULL,
  'La esposa de Balon Greyjoy y madre de sus hijos.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Obara Sand',
  'obara-sand',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'martell'),
  'Dorniense',
  'vivo',
  NULL,
  NULL,
  'La hija mayor de Oberyn Martell, una guerrera feroz que juró venganza por la muerte de su padre.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Nymeria Sand',
  'nymeria-sand',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'martell'),
  'Dorniense',
  'vivo',
  NULL,
  NULL,
  'La segunda hija de Oberyn, elegante y letal con agujas venenosas.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Tyene Sand',
  'tyene-sand',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'martell'),
  'Dorniense',
  'vivo',
  NULL,
  NULL,
  'Una hija de Oberyn experta en venenos, con una apariencia inocente que esconde su peligrosidad.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Sarella Sand',
  'sarella-sand',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'martell'),
  'Dorniense',
  'vivo',
  NULL,
  NULL,
  'Una hija de Oberyn con mente curiosa. Se dice que viajó disfrazada a la Ciudadela para estudiar.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Elia Sand',
  'elia-sand',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'martell'),
  'Dorniense',
  'vivo',
  NULL,
  NULL,
  'Una de las hijas de Oberyn, llamada así en honor a su tía Elia Martell.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Dorea Sand',
  'dorea-sand',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'martell'),
  'Dorniense',
  'vivo',
  NULL,
  NULL,
  'Una de las hijas de Oberyn.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Loreza Sand',
  'loreza-sand',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'martell'),
  'Dorniense',
  'vivo',
  NULL,
  NULL,
  'La más joven de las hijas de Oberyn.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Ellaria Sand',
  'ellaria-sand',
  ARRAY[]::text[],
  NULL,
  'Dorniense',
  'vivo',
  NULL,
  NULL,
  'La amante de Oberyn Martell y madre de tres de sus hijas. Abogó por la paz en vez de la venganza.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Meria Martell',
  'meria-martell',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'martell'),
  'Dorniense',
  'vivo',
  NULL,
  NULL,
  'La esposa de Doran Martell y princesa consorte de Dorne.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Lewyn Martell',
  'lewyn-martell',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'martell'),
  'Dorniense',
  'muerto',
  NULL,
  NULL,
  'El tío de Oberyn, un Guardia Real que murió en la Batalla del Tridente.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Jeor Mormont',
  'jeor-mormont',
  ARRAY['El Oso Viejo'],
  (SELECT id FROM houses WHERE slug = 'mormont'),
  'Norteño',
  'muerto',
  NULL,
  NULL,
  'El Lord Comandante de la Guardia de la Noche que tomó a Jon Nieve como su personal. Fue asesinado en el motín.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Alys Karstark',
  'alys-karstark',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'karstark'),
  'Norteño',
  'vivo',
  NULL,
  NULL,
  'La hija de Rickard Karstark que huyó de su casa y buscó refugio con Jon Nieve.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Selwyn Tarth',
  'selwyn-tarth',
  ARRAY[]::text[],
  NULL,
  'Andal',
  'vivo',
  NULL,
  NULL,
  'El padre de Brienne, Señor de Tarth.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Jon Arryn',
  'jon-arryn',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'arryn'),
  'Andal',
  'muerto',
  NULL,
  '298 AC',
  'Señor del Nido de Águilas y Mano del Rey. Su muerte misteriosa desencadenó los eventos de la saga.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Alerie Hightower',
  'alerie-hightower',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'hightower'),
  'Andal',
  'vivo',
  NULL,
  NULL,
  'La esposa de Mace Tyrell, de la casa Hightower.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Luthor Tyrell',
  'luthor-tyrell',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'tyrell'),
  'Andal',
  'muerto',
  NULL,
  NULL,
  'El padre de Mace Tyrell, Señor de Altojardín. Murió en un accidente de caza.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Bethany Ryswell',
  'bethany-ryswell',
  ARRAY[]::text[],
  NULL,
  'Norteño',
  'muerto',
  NULL,
  NULL,
  'La primera esposa de Roose Bolton.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Walda Frey',
  'walda-frey',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'frey'),
  'Riverlands',
  'muerto',
  NULL,
  NULL,
  'Una hija de Walder Frey que se casó con Roose Bolton. Murió en la caída de Invernalia.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Jyana Reed',
  'jyana-reed',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'reed'),
  'Lacustre',
  'vivo',
  NULL,
  NULL,
  'La esposa de Howland Reed y madre de Jojen y Meera.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Marya Seaworth',
  'marya-seaworth',
  ARRAY[]::text[],
  NULL,
  'Desconocido',
  'vivo',
  NULL,
  NULL,
  'La esposa de Davos Seaworth.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Tormenta',
  'tormenta',
  ARRAY[]::text[],
  NULL,
  'Salvaje',
  'vivo',
  NULL,
  NULL,
  'El hijo de Tormund y Dalla, nacido en las tormentas.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Tyrek Lannister',
  'tyrek-lannister',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'lannister'),
  'Occidental',
  'desconocido',
  NULL,
  NULL,
  'El hijo de Tygett Lannister, conocido como ''el Avestruz''. Desapareció durante el saqueo de Desembarco del Rey.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Volaris',
  'volaris',
  ARRAY[]::text[],
  NULL,
  'Desconocido',
  'vivo',
  NULL,
  NULL,
  'Una mujer misteriosa asociada con Euron Greyjoy.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Marna Vance',
  'marna-vance',
  ARRAY[]::text[],
  NULL,
  'Riverlands',
  'muerto',
  NULL,
  NULL,
  'Una de las esposas de Walder Frey.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Bethany Rosby',
  'bethany-rosby',
  ARRAY[]::text[],
  NULL,
  'Riverlands',
  'muerto',
  NULL,
  NULL,
  'Una de las esposas de Walder Frey.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Shiera Crakehall',
  'shiera-crakehall',
  ARRAY[]::text[],
  NULL,
  'Occidental',
  'muerto',
  NULL,
  NULL,
  'Una de las esposas de Walder Frey.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Annara Farring',
  'annara-farring',
  ARRAY[]::text[],
  NULL,
  'Andal',
  'muerto',
  NULL,
  NULL,
  'Una de las esposas de Walder Frey.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Joyeuse Erenford',
  'joyeuse-erenford',
  ARRAY[]::text[],
  NULL,
  'Riverlands',
  'muerto',
  NULL,
  NULL,
  'La última esposa de Walder Frey.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Brandon el Constructor',
  'brandon-el-constructor',
  ARRAY['Brandon the Builder'],
  (SELECT id FROM houses WHERE slug = 'stark'),
  'Primeros Hombres',
  'muerto',
  NULL,
  NULL,
  'El legendario fundador de Invernalia y constructor del Muro. Se dice que tuvo ayuda de los hijos del bosque y los gigantes para levantar las fortificaciones más impresionantes de Poniente.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Garth Manoverde',
  'garth-manoverde',
  ARRAY['Garth Mano Verde', 'Garth el Verde'],
  (SELECT id FROM houses WHERE slug = 'gardener'),
  'Primeros Hombres',
  'muerto',
  NULL,
  NULL,
  'El legendario antepasado de la casa Gardener y de todas las grandes casas del Dominio. Se le atribuye haber enseñado a los hombres a cultivar la tierra. Su bolsa de semillas nunca se agotaba.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Lann el Astuto',
  'lann-el-astuto',
  ARRAY['Lann the Clever'],
  (SELECT id FROM houses WHERE slug = 'lannister'),
  'Primeros Hombres',
  'muerto',
  NULL,
  NULL,
  'El legendario fundador de la casa Lannister que engañó a los Casterly para hacerse con Roca Casterly. Se decía que podía colarse por cualquier cerradura.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Durran Pesardedioses',
  'durran-pesardedioses',
  ARRAY['Durran Godsgrief'],
  NULL,
  'Primeros Hombres',
  'muerto',
  NULL,
  NULL,
  'El legendario fundador de las Tierras de la Tormenta que luchó contra los dioses del mar para construir Bastión de Tormentas.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Aenar Targaryen',
  'aenar-targaryen',
  ARRAY['Aenar el Exiliado'],
  (SELECT id FROM houses WHERE slug = 'targaryen'),
  'Valyrio',
  'muerto',
  NULL,
  NULL,
  'El patriarca que huyó de Valyria con toda su familia doce años antes de la Maldición, siguiendo las profecías de su hija Daenys la Soñadora.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Daenys la Soñadora',
  'daenys-la-sonadora',
  ARRAY['Daenys the Dreamer'],
  (SELECT id FROM houses WHERE slug = 'targaryen'),
  'Valyrio',
  'muerto',
  NULL,
  NULL,
  'La hija de Aenar Targaryen cuyas visiones proféticas salvaron a su familia de la destrucción de Valyria.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Gaemon Targaryen',
  'gaemon-targaryen',
  ARRAY['Gaemon el Glorioso'],
  (SELECT id FROM houses WHERE slug = 'targaryen'),
  'Valyrio',
  'muerto',
  NULL,
  NULL,
  'Hermano y esposo de Daenys la Soñadora, sucedió a Aenar como señor de Rocadragón y fue conocido por su gloria.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Aerion Targaryen',
  'aerion-targaryen',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'targaryen'),
  'Valyrio',
  'muerto',
  NULL,
  NULL,
  'El padre de Aegon el Conquistador, señor de Rocadragón.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Torrhen Stark',
  'torrhen-stark',
  ARRAY['Torrhen el Suplicante'],
  (SELECT id FROM houses WHERE slug = 'stark'),
  'Norteño',
  'muerto',
  NULL,
  NULL,
  'El último Rey del Invierno que se arrodilló ante Aegon el Conquistador en lugar de luchar, ganándose el apodo de El Suplicante.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Theon Stark',
  'theon-stark',
  ARRAY['Theon el Hambriento'],
  (SELECT id FROM houses WHERE slug = 'stark'),
  'Norteño',
  'muerto',
  NULL,
  NULL,
  'Un Rey del Invierno conocido por su crueldad y su campaña contra los ándalos que invadían el Norte.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Cregan Stark',
  'cregan-stark',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'stark'),
  'Norteño',
  'muerto',
  NULL,
  NULL,
  'Un Rey del Invierno de larguísimo reinado durante el cual se escribieron importantes crónicas sobre los túmulos del Norte.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Brandon el Rompehielo',
  'brandon-el-rompehielo',
  ARRAY['Brandon the Breaker'],
  (SELECT id FROM houses WHERE slug = 'stark'),
  'Norteño',
  'muerto',
  NULL,
  NULL,
  'Un Rey del Invierno que derrotó a los Caminantes Blancos y selló la paz con los hijos del bosque.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Argilac el Arrogante',
  'argilac-el-arrogante',
  ARRAY['Argilac Durrandon'],
  (SELECT id FROM houses WHERE slug = 'durrandon'),
  'Andal',
  'muerto',
  NULL,
  NULL,
  'El último Rey de la Tormenta de la casa Durrandon. Su rechazo a la oferta de matrimonio de Aegon y el envío de las manos cortadas a Orys Baratheon provocó la Conquista.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Harren el Negro',
  'harren-el-negro',
  ARRAY['Harrenhal'],
  (SELECT id FROM houses WHERE slug = 'hoare'),
  'Islas de Hierro',
  'muerto',
  NULL,
  NULL,
  'El último Rey de las Islas y los Ríos de la casa Hoare. Construyó Harrenhal, el castillo más grande de Poniente, y fue destruido por los dragones de Aegon.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Orys Baratheon',
  'orys-baratheon',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'baratheon'),
  'Valyrio',
  'muerto',
  NULL,
  NULL,
  'Campeón y amigo de Aegon el Conquistador, posiblemente su hermano ilegítimo. Fundó la casa Baratheon tras conquistar Bastión de Tormentas.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Harwyn Manodura',
  'harwyn-manodura',
  ARRAY['Harwyn Hardhand'],
  (SELECT id FROM houses WHERE slug = 'hoare'),
  'Islas de Hierro',
  'muerto',
  NULL,
  NULL,
  'El abuelo de Harren el Negro que arrebató el Tridente a los Ríos con la fuerza de su mano.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Tristifer IV Mudd',
  'tristifer-iv-mudd',
  ARRAY['Tristifer el Martillo'],
  (SELECT id FROM houses WHERE slug = 'mudd'),
  'Primeros Hombres',
  'muerto',
  NULL,
  NULL,
  'El último gran rey de los Ríos de la casa Mudd que defendió sus tierras contra los ándalos.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Qhored I',
  'qhored-i',
  ARRAY['Qhored el Grande'],
  (SELECT id FROM houses WHERE slug = 'hoare'),
  'Islas de Hierro',
  'muerto',
  NULL,
  NULL,
  'El más legendario de los Reyes del Hierro que gobernó desde Old Wyk y extendió el poder de las Islas por todo Poniente.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Qhorwyn el Bueno',
  'qhorwyn-el-bueno',
  ARRAY['Qhorwyn the Good'],
  (SELECT id FROM houses WHERE slug = 'hoare'),
  'Islas de Hierro',
  'muerto',
  NULL,
  NULL,
  'Un Rey del Hierro conocido por su prudencia y por acumular riquezas en lugar de lanzar conquistas.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Gendel',
  'gendel',
  ARRAY[]::text[],
  NULL,
  'Salvaje',
  'muerto',
  NULL,
  NULL,
  'Un héroe salvaje legendario que junto a su hermano Gorne medió en una disputa entre los hijos del bosque y los gigantes.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Gorne',
  'gorne',
  ARRAY[]::text[],
  NULL,
  'Salvaje',
  'muerto',
  NULL,
  NULL,
  'El hermano de Gendel, un héroe salvaje que descubrió un sistema de cuevas que pasaba bajo el Muro.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Nymeria de los Rhoynar',
  'nymeria-de-los-rhoynar',
  ARRAY['Nymeria'],
  (SELECT id FROM houses WHERE slug = 'martell'),
  'Rhoynar',
  'muerto',
  NULL,
  NULL,
  'La princesa guerrera rhoynar que huyó de Valyria con diez mil naves y se asentó en Dorne con los Martell. Gobernó Dorne durante veintisiete años.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Mors Martell',
  'mors-martell',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'martell'),
  'Dorniense',
  'muerto',
  NULL,
  NULL,
  'El señor dorniense que se casó con Nymeria y unificó Dorne mediante la fuerza y la diplomacia.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Arrec Durrandon',
  'arrec-durrandon',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'durrandon'),
  'Andal',
  'muerto',
  NULL,
  NULL,
  'El abuelo de Argilac, un Rey de la Tormenta cuyos antepasados habían derrocado al último rey de los Ríos.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Garse VII Gardener',
  'garse-vii-gardener',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'gardener'),
  'Andal',
  'muerto',
  NULL,
  NULL,
  'El último Rey del Dominio de la casa Gardener, asesinado por Argilac en la Batalla de Campoestivo.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Alicent Hightower',
  'alicent-hightower',
  ARRAY['La Reina Verde'],
  (SELECT id FROM houses WHERE slug = 'hightower'),
  'Andal',
  'muerto',
  NULL,
  NULL,
  'La segunda esposa de Viserys I y madre de Aegon II. Su disputa con Rhaenyra por la sucesión desencadenó la Danza de los Dragones.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Daemon Targaryen',
  'daemon-targaryen',
  ARRAY['El Príncipe de la Ciudad', 'Rey del Mar Angosto'],
  (SELECT id FROM houses WHERE slug = 'targaryen'),
  'Valyrio',
  'muerto',
  NULL,
  NULL,
  'El hermano menor de Viserys I, un príncipe audaz y tempestuoso. Luchó en la Danza de los Dragones montando a Caraxes y murió en duelo contra Aemond sobre el Ojo de Dioses.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Aemond Targaryen',
  'aemond-targaryen',
  ARRAY['Aemond el Tuerto'],
  (SELECT id FROM houses WHERE slug = 'targaryen'),
  'Valyrio',
  'muerto',
  NULL,
  NULL,
  'El hermano de Aegon II que montaba a Vhagar, el mayor de los dragones. Murió en duelo contra Daemon sobre el Ojo de Dioses.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Helaena Targaryen',
  'helaena-targaryen',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'targaryen'),
  'Valyrio',
  'muerto',
  NULL,
  NULL,
  'La hija de Viserys I y hermana de Aegon II. Su muerte cayendo desde los muros de la Fortaleza Roja fue uno de los momentos más trágicos de la Danza.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Baela Targaryen',
  'baela-targaryen',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'targaryen'),
  'Valyrio',
  'vivo',
  NULL,
  NULL,
  'La hija de Daemon Targaryen que montaba a Danzarina Lunar. Enfrentó a Aegon II en Rocadragón y sobrevivió a la batalla.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Corlys Velaryon',
  'corlys-velaryon',
  ARRAY['La Serpiente Marina'],
  (SELECT id FROM houses WHERE slug = 'velaryon'),
  'Valyrio',
  'muerto',
  NULL,
  NULL,
  'El mayor explorador de Poniente que navegó los mares más lejanos. Sirvió como mano del rey durante la Danza de los Dragones.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Daeron Targaryen',
  'daeron-targaryen',
  ARRAY['Daeron el Osado'],
  (SELECT id FROM houses WHERE slug = 'targaryen'),
  'Valyrio',
  'muerto',
  NULL,
  NULL,
  'El hermano menor de Aegon II que destacó en la batalla. Montaba a Tessarion, la Reina Azul. Murió en la Segunda Batalla de Ladera.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Addam Velaryon',
  'addam-velaryon',
  ARRAY['Addam de Casco'],
  (SELECT id FROM houses WHERE slug = 'velaryon'),
  'Valyrio',
  'muerto',
  NULL,
  NULL,
  'Un joven que montaba a Bruma y fue adoptado por lord Corlys. Murió con valentía en la Segunda Batalla de Ladera. Su epitafio fue simplemente: Leal.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Hugh el Martillo',
  'hugh-el-martillo',
  ARRAY['Hugh Martillo'],
  NULL,
  'Desconocido',
  'muerto',
  NULL,
  NULL,
  'Un herrero que montaba a Vermithor. Cambió de bando en la Primera Batalla de Ladera y fue asesinado posteriormente.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Ulf el Blanco',
  'ulf-el-blanco',
  ARRAY['Ulf el Beodo'],
  NULL,
  'Desconocido',
  'muerto',
  NULL,
  NULL,
  'Un borracho que montaba a Ala de Plata. Cambió de bando junto con Hugh el Martillo y fue envenenado.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Daena Targaryen',
  'daena-targaryen',
  ARRAY['Daena la Rebelde'],
  (SELECT id FROM houses WHERE slug = 'targaryen'),
  'Valyrio',
  'muerto',
  NULL,
  NULL,
  'La hija de Daeron II que fue encerrada en la Bóveda de las Doncellas. Dio a luz a Daemon Blackfyre, cuyo padre nunca fue revelado oficialmente.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

INSERT INTO characters (name, slug, aliases, house_id, culture, status, born, died, description)
VALUES (
  'Otto Hightower',
  'otto-hightower',
  ARRAY[]::text[],
  (SELECT id FROM houses WHERE slug = 'hightower'),
  'Andal',
  'muerto',
  NULL,
  NULL,
  'Mano del rey que manipuló la sucesión a favor de su hija Alicent. Fue ejecutado durante la Danza de los Dragones.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, aliases = EXCLUDED.aliases, culture = EXCLUDED.culture,
  status = EXCLUDED.status, born = EXCLUDED.born, died = EXCLUDED.died,
  description = EXCLUDED.description;

-- ============================================================
-- CHARACTER RELATIONS
-- ============================================================

DO $$
DECLARE
  ch RECORD;
  rel TEXT;
  related_slug TEXT;
BEGIN
  -- Eddard Stark -> Catelyn Tully (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'catelyn-tully';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'eddard-stark' AND c2.slug = 'catelyn-tully'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Eddard Stark', 'Catelyn Tully', 'conyuges', 'catelyn-tully';
  END IF;

  -- Eddard Stark -> Robb Stark (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'robb-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'eddard-stark' AND c2.slug = 'robb-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Eddard Stark', 'Robb Stark', 'hijos', 'robb-stark';
  END IF;

  -- Eddard Stark -> Sansa Stark (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'sansa-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'eddard-stark' AND c2.slug = 'sansa-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Eddard Stark', 'Sansa Stark', 'hijos', 'sansa-stark';
  END IF;

  -- Eddard Stark -> Arya Stark (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'arya-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'eddard-stark' AND c2.slug = 'arya-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Eddard Stark', 'Arya Stark', 'hijos', 'arya-stark';
  END IF;

  -- Eddard Stark -> Bran Stark (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'bran-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'eddard-stark' AND c2.slug = 'bran-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Eddard Stark', 'Bran Stark', 'hijos', 'bran-stark';
  END IF;

  -- Eddard Stark -> Rickon Stark (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'rickon-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'eddard-stark' AND c2.slug = 'rickon-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Eddard Stark', 'Rickon Stark', 'hijos', 'rickon-stark';
  END IF;

  -- Eddard Stark -> Jon Nieve (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'jon-nieve';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'eddard-stark' AND c2.slug = 'jon-nieve'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Eddard Stark', 'Jon Nieve', 'hijos', 'jon-nieve';
  END IF;

  -- Eddard Stark -> Brandon Stark (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'brandon-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'eddard-stark' AND c2.slug = 'brandon-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Eddard Stark', 'Brandon Stark', 'hermanos', 'brandon-stark';
  END IF;

  -- Eddard Stark -> Benjen Stark (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'benjen-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'eddard-stark' AND c2.slug = 'benjen-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Eddard Stark', 'Benjen Stark', 'hermanos', 'benjen-stark';
  END IF;

  -- Eddard Stark -> Lyanna Stark (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'lyanna-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'eddard-stark' AND c2.slug = 'lyanna-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Eddard Stark', 'Lyanna Stark', 'hermanos', 'lyanna-stark';
  END IF;

  -- Catelyn Tully -> Eddard Stark (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'eddard-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'catelyn-tully' AND c2.slug = 'eddard-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Catelyn Tully', 'Eddard Stark', 'conyuges', 'eddard-stark';
  END IF;

  -- Catelyn Tully -> Robb Stark (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'robb-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'catelyn-tully' AND c2.slug = 'robb-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Catelyn Tully', 'Robb Stark', 'hijos', 'robb-stark';
  END IF;

  -- Catelyn Tully -> Sansa Stark (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'sansa-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'catelyn-tully' AND c2.slug = 'sansa-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Catelyn Tully', 'Sansa Stark', 'hijos', 'sansa-stark';
  END IF;

  -- Catelyn Tully -> Arya Stark (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'arya-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'catelyn-tully' AND c2.slug = 'arya-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Catelyn Tully', 'Arya Stark', 'hijos', 'arya-stark';
  END IF;

  -- Catelyn Tully -> Bran Stark (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'bran-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'catelyn-tully' AND c2.slug = 'bran-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Catelyn Tully', 'Bran Stark', 'hijos', 'bran-stark';
  END IF;

  -- Catelyn Tully -> Rickon Stark (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'rickon-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'catelyn-tully' AND c2.slug = 'rickon-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Catelyn Tully', 'Rickon Stark', 'hijos', 'rickon-stark';
  END IF;

  -- Catelyn Tully -> Edmure Tully (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'edmure-tully';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'catelyn-tully' AND c2.slug = 'edmure-tully'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Catelyn Tully', 'Edmure Tully', 'hermanos', 'edmure-tully';
  END IF;

  -- Catelyn Tully -> Lysa Arryn (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'lysa-arryn';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'catelyn-tully' AND c2.slug = 'lysa-arryn'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Catelyn Tully', 'Lysa Arryn', 'hermanos', 'lysa-arryn';
  END IF;

  -- Robb Stark -> Eddard Stark (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'eddard-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'robb-stark' AND c2.slug = 'eddard-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Robb Stark', 'Eddard Stark', 'padre', 'eddard-stark';
  END IF;

  -- Robb Stark -> Catelyn Tully (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'catelyn-tully';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'robb-stark' AND c2.slug = 'catelyn-tully'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Robb Stark', 'Catelyn Tully', 'madre', 'catelyn-tully';
  END IF;

  -- Robb Stark -> Jeyne Westerling (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'jeyne-westerling';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'robb-stark' AND c2.slug = 'jeyne-westerling'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Robb Stark', 'Jeyne Westerling', 'conyuges', 'jeyne-westerling';
  END IF;

  -- Robb Stark -> Sansa Stark (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'sansa-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'robb-stark' AND c2.slug = 'sansa-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Robb Stark', 'Sansa Stark', 'hermanos', 'sansa-stark';
  END IF;

  -- Robb Stark -> Arya Stark (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'arya-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'robb-stark' AND c2.slug = 'arya-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Robb Stark', 'Arya Stark', 'hermanos', 'arya-stark';
  END IF;

  -- Robb Stark -> Bran Stark (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'bran-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'robb-stark' AND c2.slug = 'bran-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Robb Stark', 'Bran Stark', 'hermanos', 'bran-stark';
  END IF;

  -- Robb Stark -> Rickon Stark (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'rickon-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'robb-stark' AND c2.slug = 'rickon-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Robb Stark', 'Rickon Stark', 'hermanos', 'rickon-stark';
  END IF;

  -- Robb Stark -> Jon Nieve (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'jon-nieve';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'robb-stark' AND c2.slug = 'jon-nieve'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Robb Stark', 'Jon Nieve', 'hermanos', 'jon-nieve';
  END IF;

  -- Sansa Stark -> Eddard Stark (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'eddard-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'sansa-stark' AND c2.slug = 'eddard-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Sansa Stark', 'Eddard Stark', 'padre', 'eddard-stark';
  END IF;

  -- Sansa Stark -> Catelyn Tully (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'catelyn-tully';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'sansa-stark' AND c2.slug = 'catelyn-tully'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Sansa Stark', 'Catelyn Tully', 'madre', 'catelyn-tully';
  END IF;

  -- Sansa Stark -> Tyrion Lannister (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tyrion-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'sansa-stark' AND c2.slug = 'tyrion-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Sansa Stark', 'Tyrion Lannister', 'conyuges', 'tyrion-lannister';
  END IF;

  -- Sansa Stark -> Ramsay Bolton (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'ramsay-bolton';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'sansa-stark' AND c2.slug = 'ramsay-bolton'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Sansa Stark', 'Ramsay Bolton', 'conyuges', 'ramsay-bolton';
  END IF;

  -- Sansa Stark -> Robb Stark (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'robb-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'sansa-stark' AND c2.slug = 'robb-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Sansa Stark', 'Robb Stark', 'hermanos', 'robb-stark';
  END IF;

  -- Sansa Stark -> Arya Stark (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'arya-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'sansa-stark' AND c2.slug = 'arya-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Sansa Stark', 'Arya Stark', 'hermanos', 'arya-stark';
  END IF;

  -- Sansa Stark -> Bran Stark (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'bran-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'sansa-stark' AND c2.slug = 'bran-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Sansa Stark', 'Bran Stark', 'hermanos', 'bran-stark';
  END IF;

  -- Sansa Stark -> Rickon Stark (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'rickon-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'sansa-stark' AND c2.slug = 'rickon-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Sansa Stark', 'Rickon Stark', 'hermanos', 'rickon-stark';
  END IF;

  -- Sansa Stark -> Jon Nieve (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'jon-nieve';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'sansa-stark' AND c2.slug = 'jon-nieve'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Sansa Stark', 'Jon Nieve', 'hermanos', 'jon-nieve';
  END IF;

  -- Arya Stark -> Eddard Stark (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'eddard-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'arya-stark' AND c2.slug = 'eddard-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Arya Stark', 'Eddard Stark', 'padre', 'eddard-stark';
  END IF;

  -- Arya Stark -> Catelyn Tully (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'catelyn-tully';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'arya-stark' AND c2.slug = 'catelyn-tully'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Arya Stark', 'Catelyn Tully', 'madre', 'catelyn-tully';
  END IF;

  -- Arya Stark -> Robb Stark (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'robb-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'arya-stark' AND c2.slug = 'robb-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Arya Stark', 'Robb Stark', 'hermanos', 'robb-stark';
  END IF;

  -- Arya Stark -> Sansa Stark (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'sansa-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'arya-stark' AND c2.slug = 'sansa-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Arya Stark', 'Sansa Stark', 'hermanos', 'sansa-stark';
  END IF;

  -- Arya Stark -> Bran Stark (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'bran-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'arya-stark' AND c2.slug = 'bran-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Arya Stark', 'Bran Stark', 'hermanos', 'bran-stark';
  END IF;

  -- Arya Stark -> Rickon Stark (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'rickon-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'arya-stark' AND c2.slug = 'rickon-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Arya Stark', 'Rickon Stark', 'hermanos', 'rickon-stark';
  END IF;

  -- Arya Stark -> Jon Nieve (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'jon-nieve';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'arya-stark' AND c2.slug = 'jon-nieve'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Arya Stark', 'Jon Nieve', 'hermanos', 'jon-nieve';
  END IF;

  -- Bran Stark -> Eddard Stark (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'eddard-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'bran-stark' AND c2.slug = 'eddard-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Bran Stark', 'Eddard Stark', 'padre', 'eddard-stark';
  END IF;

  -- Bran Stark -> Catelyn Tully (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'catelyn-tully';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'bran-stark' AND c2.slug = 'catelyn-tully'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Bran Stark', 'Catelyn Tully', 'madre', 'catelyn-tully';
  END IF;

  -- Bran Stark -> Robb Stark (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'robb-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'bran-stark' AND c2.slug = 'robb-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Bran Stark', 'Robb Stark', 'hermanos', 'robb-stark';
  END IF;

  -- Bran Stark -> Sansa Stark (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'sansa-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'bran-stark' AND c2.slug = 'sansa-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Bran Stark', 'Sansa Stark', 'hermanos', 'sansa-stark';
  END IF;

  -- Bran Stark -> Arya Stark (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'arya-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'bran-stark' AND c2.slug = 'arya-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Bran Stark', 'Arya Stark', 'hermanos', 'arya-stark';
  END IF;

  -- Bran Stark -> Rickon Stark (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'rickon-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'bran-stark' AND c2.slug = 'rickon-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Bran Stark', 'Rickon Stark', 'hermanos', 'rickon-stark';
  END IF;

  -- Bran Stark -> Jon Nieve (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'jon-nieve';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'bran-stark' AND c2.slug = 'jon-nieve'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Bran Stark', 'Jon Nieve', 'hermanos', 'jon-nieve';
  END IF;

  -- Rickon Stark -> Eddard Stark (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'eddard-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'rickon-stark' AND c2.slug = 'eddard-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Rickon Stark', 'Eddard Stark', 'padre', 'eddard-stark';
  END IF;

  -- Rickon Stark -> Catelyn Tully (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'catelyn-tully';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'rickon-stark' AND c2.slug = 'catelyn-tully'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Rickon Stark', 'Catelyn Tully', 'madre', 'catelyn-tully';
  END IF;

  -- Rickon Stark -> Robb Stark (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'robb-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'rickon-stark' AND c2.slug = 'robb-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Rickon Stark', 'Robb Stark', 'hermanos', 'robb-stark';
  END IF;

  -- Rickon Stark -> Sansa Stark (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'sansa-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'rickon-stark' AND c2.slug = 'sansa-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Rickon Stark', 'Sansa Stark', 'hermanos', 'sansa-stark';
  END IF;

  -- Rickon Stark -> Arya Stark (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'arya-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'rickon-stark' AND c2.slug = 'arya-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Rickon Stark', 'Arya Stark', 'hermanos', 'arya-stark';
  END IF;

  -- Rickon Stark -> Bran Stark (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'bran-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'rickon-stark' AND c2.slug = 'bran-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Rickon Stark', 'Bran Stark', 'hermanos', 'bran-stark';
  END IF;

  -- Rickon Stark -> Jon Nieve (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'jon-nieve';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'rickon-stark' AND c2.slug = 'jon-nieve'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Rickon Stark', 'Jon Nieve', 'hermanos', 'jon-nieve';
  END IF;

  -- Jon Nieve -> Rhaegar Targaryen (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'rhaegar-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'jon-nieve' AND c2.slug = 'rhaegar-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Jon Nieve', 'Rhaegar Targaryen', 'padre', 'rhaegar-targaryen';
  END IF;

  -- Jon Nieve -> Lyanna Stark (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'lyanna-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'jon-nieve' AND c2.slug = 'lyanna-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Jon Nieve', 'Lyanna Stark', 'madre', 'lyanna-stark';
  END IF;

  -- Jon Nieve -> Robb Stark (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'robb-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'jon-nieve' AND c2.slug = 'robb-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Jon Nieve', 'Robb Stark', 'hermanos', 'robb-stark';
  END IF;

  -- Jon Nieve -> Sansa Stark (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'sansa-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'jon-nieve' AND c2.slug = 'sansa-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Jon Nieve', 'Sansa Stark', 'hermanos', 'sansa-stark';
  END IF;

  -- Jon Nieve -> Arya Stark (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'arya-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'jon-nieve' AND c2.slug = 'arya-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Jon Nieve', 'Arya Stark', 'hermanos', 'arya-stark';
  END IF;

  -- Jon Nieve -> Bran Stark (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'bran-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'jon-nieve' AND c2.slug = 'bran-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Jon Nieve', 'Bran Stark', 'hermanos', 'bran-stark';
  END IF;

  -- Jon Nieve -> Rickon Stark (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'rickon-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'jon-nieve' AND c2.slug = 'rickon-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Jon Nieve', 'Rickon Stark', 'hermanos', 'rickon-stark';
  END IF;

  -- Tyrion Lannister -> Tywin Lannister (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tywin-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tyrion-lannister' AND c2.slug = 'tywin-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tyrion Lannister', 'Tywin Lannister', 'padre', 'tywin-lannister';
  END IF;

  -- Tyrion Lannister -> Joanna Lannister (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'joanna-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tyrion-lannister' AND c2.slug = 'joanna-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tyrion Lannister', 'Joanna Lannister', 'madre', 'joanna-lannister';
  END IF;

  -- Tyrion Lannister -> Tysha (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tysha';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tyrion-lannister' AND c2.slug = 'tysha'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tyrion Lannister', 'Tysha', 'conyuges', 'tysha';
  END IF;

  -- Tyrion Lannister -> Sansa Stark (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'sansa-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tyrion-lannister' AND c2.slug = 'sansa-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tyrion Lannister', 'Sansa Stark', 'conyuges', 'sansa-stark';
  END IF;

  -- Tyrion Lannister -> Cersei Lannister (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'cersei-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tyrion-lannister' AND c2.slug = 'cersei-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tyrion Lannister', 'Cersei Lannister', 'hermanos', 'cersei-lannister';
  END IF;

  -- Tyrion Lannister -> Jaime Lannister (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'jaime-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tyrion-lannister' AND c2.slug = 'jaime-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tyrion Lannister', 'Jaime Lannister', 'hermanos', 'jaime-lannister';
  END IF;

  -- Cersei Lannister -> Tywin Lannister (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tywin-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'cersei-lannister' AND c2.slug = 'tywin-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Cersei Lannister', 'Tywin Lannister', 'padre', 'tywin-lannister';
  END IF;

  -- Cersei Lannister -> Joanna Lannister (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'joanna-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'cersei-lannister' AND c2.slug = 'joanna-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Cersei Lannister', 'Joanna Lannister', 'madre', 'joanna-lannister';
  END IF;

  -- Cersei Lannister -> Robert Baratheon (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'robert-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'cersei-lannister' AND c2.slug = 'robert-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Cersei Lannister', 'Robert Baratheon', 'conyuges', 'robert-baratheon';
  END IF;

  -- Cersei Lannister -> Joffrey Baratheon (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'joffrey-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'cersei-lannister' AND c2.slug = 'joffrey-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Cersei Lannister', 'Joffrey Baratheon', 'hijos', 'joffrey-baratheon';
  END IF;

  -- Cersei Lannister -> Myrcella Baratheon (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'myrcella-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'cersei-lannister' AND c2.slug = 'myrcella-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Cersei Lannister', 'Myrcella Baratheon', 'hijos', 'myrcella-baratheon';
  END IF;

  -- Cersei Lannister -> Tommen Baratheon (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tommen-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'cersei-lannister' AND c2.slug = 'tommen-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Cersei Lannister', 'Tommen Baratheon', 'hijos', 'tommen-baratheon';
  END IF;

  -- Cersei Lannister -> Jaime Lannister (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'jaime-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'cersei-lannister' AND c2.slug = 'jaime-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Cersei Lannister', 'Jaime Lannister', 'hermanos', 'jaime-lannister';
  END IF;

  -- Cersei Lannister -> Tyrion Lannister (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tyrion-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'cersei-lannister' AND c2.slug = 'tyrion-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Cersei Lannister', 'Tyrion Lannister', 'hermanos', 'tyrion-lannister';
  END IF;

  -- Jaime Lannister -> Tywin Lannister (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tywin-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'jaime-lannister' AND c2.slug = 'tywin-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Jaime Lannister', 'Tywin Lannister', 'padre', 'tywin-lannister';
  END IF;

  -- Jaime Lannister -> Joanna Lannister (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'joanna-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'jaime-lannister' AND c2.slug = 'joanna-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Jaime Lannister', 'Joanna Lannister', 'madre', 'joanna-lannister';
  END IF;

  -- Jaime Lannister -> Cersei Lannister (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'cersei-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'jaime-lannister' AND c2.slug = 'cersei-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Jaime Lannister', 'Cersei Lannister', 'conyuges', 'cersei-lannister';
  END IF;

  -- Jaime Lannister -> Joffrey Baratheon (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'joffrey-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'jaime-lannister' AND c2.slug = 'joffrey-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Jaime Lannister', 'Joffrey Baratheon', 'hijos', 'joffrey-baratheon';
  END IF;

  -- Jaime Lannister -> Myrcella Baratheon (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'myrcella-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'jaime-lannister' AND c2.slug = 'myrcella-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Jaime Lannister', 'Myrcella Baratheon', 'hijos', 'myrcella-baratheon';
  END IF;

  -- Jaime Lannister -> Tommen Baratheon (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tommen-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'jaime-lannister' AND c2.slug = 'tommen-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Jaime Lannister', 'Tommen Baratheon', 'hijos', 'tommen-baratheon';
  END IF;

  -- Jaime Lannister -> Cersei Lannister (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'cersei-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'jaime-lannister' AND c2.slug = 'cersei-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Jaime Lannister', 'Cersei Lannister', 'hermanos', 'cersei-lannister';
  END IF;

  -- Jaime Lannister -> Tyrion Lannister (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tyrion-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'jaime-lannister' AND c2.slug = 'tyrion-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Jaime Lannister', 'Tyrion Lannister', 'hermanos', 'tyrion-lannister';
  END IF;

  -- Tywin Lannister -> Tytos Lannister (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tytos-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tywin-lannister' AND c2.slug = 'tytos-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tywin Lannister', 'Tytos Lannister', 'padre', 'tytos-lannister';
  END IF;

  -- Tywin Lannister -> Jeyne Marbrand (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'jeyne-marbrand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tywin-lannister' AND c2.slug = 'jeyne-marbrand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tywin Lannister', 'Jeyne Marbrand', 'madre', 'jeyne-marbrand';
  END IF;

  -- Tywin Lannister -> Joanna Lannister (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'joanna-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tywin-lannister' AND c2.slug = 'joanna-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tywin Lannister', 'Joanna Lannister', 'conyuges', 'joanna-lannister';
  END IF;

  -- Tywin Lannister -> Cersei Lannister (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'cersei-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tywin-lannister' AND c2.slug = 'cersei-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tywin Lannister', 'Cersei Lannister', 'hijos', 'cersei-lannister';
  END IF;

  -- Tywin Lannister -> Jaime Lannister (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'jaime-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tywin-lannister' AND c2.slug = 'jaime-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tywin Lannister', 'Jaime Lannister', 'hijos', 'jaime-lannister';
  END IF;

  -- Tywin Lannister -> Tyrion Lannister (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tyrion-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tywin-lannister' AND c2.slug = 'tyrion-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tywin Lannister', 'Tyrion Lannister', 'hijos', 'tyrion-lannister';
  END IF;

  -- Tywin Lannister -> Kevan Lannister (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'kevan-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tywin-lannister' AND c2.slug = 'kevan-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tywin Lannister', 'Kevan Lannister', 'hermanos', 'kevan-lannister';
  END IF;

  -- Joffrey Baratheon -> Robert Baratheon (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'robert-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'joffrey-baratheon' AND c2.slug = 'robert-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Joffrey Baratheon', 'Robert Baratheon', 'padre', 'robert-baratheon';
  END IF;

  -- Joffrey Baratheon -> Cersei Lannister (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'cersei-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'joffrey-baratheon' AND c2.slug = 'cersei-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Joffrey Baratheon', 'Cersei Lannister', 'madre', 'cersei-lannister';
  END IF;

  -- Joffrey Baratheon -> Margaery Tyrell (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'margaery-tyrell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'joffrey-baratheon' AND c2.slug = 'margaery-tyrell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Joffrey Baratheon', 'Margaery Tyrell', 'conyuges', 'margaery-tyrell';
  END IF;

  -- Joffrey Baratheon -> Myrcella Baratheon (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'myrcella-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'joffrey-baratheon' AND c2.slug = 'myrcella-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Joffrey Baratheon', 'Myrcella Baratheon', 'hermanos', 'myrcella-baratheon';
  END IF;

  -- Joffrey Baratheon -> Tommen Baratheon (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tommen-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'joffrey-baratheon' AND c2.slug = 'tommen-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Joffrey Baratheon', 'Tommen Baratheon', 'hermanos', 'tommen-baratheon';
  END IF;

  -- Stannis Baratheon -> Steffon Baratheon (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'steffon-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'stannis-baratheon' AND c2.slug = 'steffon-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Stannis Baratheon', 'Steffon Baratheon', 'padre', 'steffon-baratheon';
  END IF;

  -- Stannis Baratheon -> Cassana Estermont (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'cassana-estermont';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'stannis-baratheon' AND c2.slug = 'cassana-estermont'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Stannis Baratheon', 'Cassana Estermont', 'madre', 'cassana-estermont';
  END IF;

  -- Stannis Baratheon -> Selyse Florent (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'selyse-florent';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'stannis-baratheon' AND c2.slug = 'selyse-florent'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Stannis Baratheon', 'Selyse Florent', 'conyuges', 'selyse-florent';
  END IF;

  -- Stannis Baratheon -> Shireen Baratheon (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'shireen-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'stannis-baratheon' AND c2.slug = 'shireen-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Stannis Baratheon', 'Shireen Baratheon', 'hijos', 'shireen-baratheon';
  END IF;

  -- Stannis Baratheon -> Robert Baratheon (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'robert-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'stannis-baratheon' AND c2.slug = 'robert-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Stannis Baratheon', 'Robert Baratheon', 'hermanos', 'robert-baratheon';
  END IF;

  -- Stannis Baratheon -> Renly Baratheon (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'renly-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'stannis-baratheon' AND c2.slug = 'renly-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Stannis Baratheon', 'Renly Baratheon', 'hermanos', 'renly-baratheon';
  END IF;

  -- Renly Baratheon -> Steffon Baratheon (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'steffon-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'renly-baratheon' AND c2.slug = 'steffon-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Renly Baratheon', 'Steffon Baratheon', 'padre', 'steffon-baratheon';
  END IF;

  -- Renly Baratheon -> Cassana Estermont (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'cassana-estermont';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'renly-baratheon' AND c2.slug = 'cassana-estermont'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Renly Baratheon', 'Cassana Estermont', 'madre', 'cassana-estermont';
  END IF;

  -- Renly Baratheon -> Margaery Tyrell (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'margaery-tyrell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'renly-baratheon' AND c2.slug = 'margaery-tyrell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Renly Baratheon', 'Margaery Tyrell', 'conyuges', 'margaery-tyrell';
  END IF;

  -- Renly Baratheon -> Robert Baratheon (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'robert-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'renly-baratheon' AND c2.slug = 'robert-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Renly Baratheon', 'Robert Baratheon', 'hermanos', 'robert-baratheon';
  END IF;

  -- Renly Baratheon -> Stannis Baratheon (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'stannis-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'renly-baratheon' AND c2.slug = 'stannis-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Renly Baratheon', 'Stannis Baratheon', 'hermanos', 'stannis-baratheon';
  END IF;

  -- Robert Baratheon -> Steffon Baratheon (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'steffon-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'robert-baratheon' AND c2.slug = 'steffon-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Robert Baratheon', 'Steffon Baratheon', 'padre', 'steffon-baratheon';
  END IF;

  -- Robert Baratheon -> Cassana Estermont (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'cassana-estermont';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'robert-baratheon' AND c2.slug = 'cassana-estermont'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Robert Baratheon', 'Cassana Estermont', 'madre', 'cassana-estermont';
  END IF;

  -- Robert Baratheon -> Cersei Lannister (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'cersei-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'robert-baratheon' AND c2.slug = 'cersei-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Robert Baratheon', 'Cersei Lannister', 'conyuges', 'cersei-lannister';
  END IF;

  -- Robert Baratheon -> Joffrey Baratheon (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'joffrey-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'robert-baratheon' AND c2.slug = 'joffrey-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Robert Baratheon', 'Joffrey Baratheon', 'hijos', 'joffrey-baratheon';
  END IF;

  -- Robert Baratheon -> Myrcella Baratheon (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'myrcella-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'robert-baratheon' AND c2.slug = 'myrcella-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Robert Baratheon', 'Myrcella Baratheon', 'hijos', 'myrcella-baratheon';
  END IF;

  -- Robert Baratheon -> Tommen Baratheon (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tommen-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'robert-baratheon' AND c2.slug = 'tommen-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Robert Baratheon', 'Tommen Baratheon', 'hijos', 'tommen-baratheon';
  END IF;

  -- Robert Baratheon -> Stannis Baratheon (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'stannis-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'robert-baratheon' AND c2.slug = 'stannis-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Robert Baratheon', 'Stannis Baratheon', 'hermanos', 'stannis-baratheon';
  END IF;

  -- Robert Baratheon -> Renly Baratheon (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'renly-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'robert-baratheon' AND c2.slug = 'renly-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Robert Baratheon', 'Renly Baratheon', 'hermanos', 'renly-baratheon';
  END IF;

  -- Daenerys Targaryen -> Aerys II Targaryen (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'aerys-ii-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'daenerys-targaryen' AND c2.slug = 'aerys-ii-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Daenerys Targaryen', 'Aerys II Targaryen', 'padre', 'aerys-ii-targaryen';
  END IF;

  -- Daenerys Targaryen -> Rhaella Targaryen (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'rhaella-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'daenerys-targaryen' AND c2.slug = 'rhaella-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Daenerys Targaryen', 'Rhaella Targaryen', 'madre', 'rhaella-targaryen';
  END IF;

  -- Daenerys Targaryen -> Khal Drogo (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'khal-drogo';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'daenerys-targaryen' AND c2.slug = 'khal-drogo'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Daenerys Targaryen', 'Khal Drogo', 'conyuges', 'khal-drogo';
  END IF;

  -- Daenerys Targaryen -> Rhaego (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'rhaego';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'daenerys-targaryen' AND c2.slug = 'rhaego'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Daenerys Targaryen', 'Rhaego', 'hijos', 'rhaego';
  END IF;

  -- Daenerys Targaryen -> Viserys Targaryen (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'viserys-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'daenerys-targaryen' AND c2.slug = 'viserys-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Daenerys Targaryen', 'Viserys Targaryen', 'hermanos', 'viserys-targaryen';
  END IF;

  -- Viserys Targaryen -> Aerys II Targaryen (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'aerys-ii-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'viserys-targaryen' AND c2.slug = 'aerys-ii-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Viserys Targaryen', 'Aerys II Targaryen', 'padre', 'aerys-ii-targaryen';
  END IF;

  -- Viserys Targaryen -> Rhaella Targaryen (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'rhaella-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'viserys-targaryen' AND c2.slug = 'rhaella-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Viserys Targaryen', 'Rhaella Targaryen', 'madre', 'rhaella-targaryen';
  END IF;

  -- Viserys Targaryen -> Daenerys Targaryen (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'daenerys-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'viserys-targaryen' AND c2.slug = 'daenerys-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Viserys Targaryen', 'Daenerys Targaryen', 'hermanos', 'daenerys-targaryen';
  END IF;

  -- Aegon Targaryen -> Rhaenys Targaryen (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'rhaenys-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'aegon-targaryen' AND c2.slug = 'rhaenys-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Aegon Targaryen', 'Rhaenys Targaryen', 'conyuges', 'rhaenys-targaryen';
  END IF;

  -- Aegon Targaryen -> Visenya Targaryen (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'visenya-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'aegon-targaryen' AND c2.slug = 'visenya-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Aegon Targaryen', 'Visenya Targaryen', 'conyuges', 'visenya-targaryen';
  END IF;

  -- Aegon Targaryen -> Aenys I Targaryen (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'aenys-i-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'aegon-targaryen' AND c2.slug = 'aenys-i-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Aegon Targaryen', 'Aenys I Targaryen', 'hijos', 'aenys-i-targaryen';
  END IF;

  -- Aegon Targaryen -> Maegor I Targaryen (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'maegor-i-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'aegon-targaryen' AND c2.slug = 'maegor-i-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Aegon Targaryen', 'Maegor I Targaryen', 'hijos', 'maegor-i-targaryen';
  END IF;

  -- Aegon Targaryen -> Rhaenys Targaryen (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'rhaenys-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'aegon-targaryen' AND c2.slug = 'rhaenys-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Aegon Targaryen', 'Rhaenys Targaryen', 'hermanos', 'rhaenys-targaryen';
  END IF;

  -- Aegon Targaryen -> Visenya Targaryen (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'visenya-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'aegon-targaryen' AND c2.slug = 'visenya-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Aegon Targaryen', 'Visenya Targaryen', 'hermanos', 'visenya-targaryen';
  END IF;

  -- Rhaegar Targaryen -> Aerys II Targaryen (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'aerys-ii-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'rhaegar-targaryen' AND c2.slug = 'aerys-ii-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Rhaegar Targaryen', 'Aerys II Targaryen', 'padre', 'aerys-ii-targaryen';
  END IF;

  -- Rhaegar Targaryen -> Rhaella Targaryen (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'rhaella-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'rhaegar-targaryen' AND c2.slug = 'rhaella-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Rhaegar Targaryen', 'Rhaella Targaryen', 'madre', 'rhaella-targaryen';
  END IF;

  -- Rhaegar Targaryen -> Elia Martell (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'elia-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'rhaegar-targaryen' AND c2.slug = 'elia-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Rhaegar Targaryen', 'Elia Martell', 'conyuges', 'elia-martell';
  END IF;

  -- Rhaegar Targaryen -> Rhaenys Targaryen (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'rhaenys-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'rhaegar-targaryen' AND c2.slug = 'rhaenys-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Rhaegar Targaryen', 'Rhaenys Targaryen', 'hijos', 'rhaenys-targaryen';
  END IF;

  -- Rhaegar Targaryen -> Aegon Targaryen (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'aegon-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'rhaegar-targaryen' AND c2.slug = 'aegon-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Rhaegar Targaryen', 'Aegon Targaryen', 'hijos', 'aegon-targaryen';
  END IF;

  -- Rhaegar Targaryen -> Jon Nieve (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'jon-nieve';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'rhaegar-targaryen' AND c2.slug = 'jon-nieve'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Rhaegar Targaryen', 'Jon Nieve', 'hijos', 'jon-nieve';
  END IF;

  -- Rhaegar Targaryen -> Viserys Targaryen (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'viserys-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'rhaegar-targaryen' AND c2.slug = 'viserys-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Rhaegar Targaryen', 'Viserys Targaryen', 'hermanos', 'viserys-targaryen';
  END IF;

  -- Benjen Stark -> Eddard Stark (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'eddard-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'benjen-stark' AND c2.slug = 'eddard-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Benjen Stark', 'Eddard Stark', 'hermanos', 'eddard-stark';
  END IF;

  -- Benjen Stark -> Brandon Stark (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'brandon-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'benjen-stark' AND c2.slug = 'brandon-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Benjen Stark', 'Brandon Stark', 'hermanos', 'brandon-stark';
  END IF;

  -- Benjen Stark -> Lyanna Stark (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'lyanna-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'benjen-stark' AND c2.slug = 'lyanna-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Benjen Stark', 'Lyanna Stark', 'hermanos', 'lyanna-stark';
  END IF;

  -- Lyanna Stark -> Rhaegar Targaryen (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'rhaegar-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'lyanna-stark' AND c2.slug = 'rhaegar-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Lyanna Stark', 'Rhaegar Targaryen', 'conyuges', 'rhaegar-targaryen';
  END IF;

  -- Lyanna Stark -> Jon Nieve (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'jon-nieve';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'lyanna-stark' AND c2.slug = 'jon-nieve'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Lyanna Stark', 'Jon Nieve', 'hijos', 'jon-nieve';
  END IF;

  -- Lyanna Stark -> Eddard Stark (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'eddard-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'lyanna-stark' AND c2.slug = 'eddard-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Lyanna Stark', 'Eddard Stark', 'hermanos', 'eddard-stark';
  END IF;

  -- Lyanna Stark -> Brandon Stark (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'brandon-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'lyanna-stark' AND c2.slug = 'brandon-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Lyanna Stark', 'Brandon Stark', 'hermanos', 'brandon-stark';
  END IF;

  -- Lyanna Stark -> Benjen Stark (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'benjen-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'lyanna-stark' AND c2.slug = 'benjen-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Lyanna Stark', 'Benjen Stark', 'hermanos', 'benjen-stark';
  END IF;

  -- Brienne de Tarth -> Selwyn Tarth (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'selwyn-tarth';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'brienne-de-tarth' AND c2.slug = 'selwyn-tarth'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Brienne de Tarth', 'Selwyn Tarth', 'padre', 'selwyn-tarth';
  END IF;

  -- Davos Seaworth -> Marya Seaworth (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'marya-seaworth';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'davos-seaworth' AND c2.slug = 'marya-seaworth'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Davos Seaworth', 'Marya Seaworth', 'conyuges', 'marya-seaworth';
  END IF;

  -- Davos Seaworth -> Davos Seaworth (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'davos-seaworth';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'davos-seaworth' AND c2.slug = 'davos-seaworth'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Davos Seaworth', 'Davos Seaworth', 'hijos', 'davos-seaworth';
  END IF;

  -- Gendry -> Robert Baratheon (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'robert-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'gendry' AND c2.slug = 'robert-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Gendry', 'Robert Baratheon', 'padre', 'robert-baratheon';
  END IF;

  -- Samwell Tarly -> Randyll Tarly (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'randyll-tarly';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'samwell-tarly' AND c2.slug = 'randyll-tarly'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Samwell Tarly', 'Randyll Tarly', 'padre', 'randyll-tarly';
  END IF;

  -- Samwell Tarly -> Gilly (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'gilly';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'samwell-tarly' AND c2.slug = 'gilly'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Samwell Tarly', 'Gilly', 'conyuges', 'gilly';
  END IF;

  -- Tormund Gigante -> Dalla (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'dalla';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tormund-gigante' AND c2.slug = 'dalla'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tormund Gigante', 'Dalla', 'conyuges', 'dalla';
  END IF;

  -- Tormund Gigante -> Tormenta (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tormenta';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tormund-gigante' AND c2.slug = 'tormenta'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tormund Gigante', 'Tormenta', 'hijos', 'tormenta';
  END IF;

  -- Theon Greyjoy -> Balon Greyjoy (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'balon-greyjoy';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'theon-greyjoy' AND c2.slug = 'balon-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Theon Greyjoy', 'Balon Greyjoy', 'padre', 'balon-greyjoy';
  END IF;

  -- Theon Greyjoy -> Asha Greyjoy (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'asha-greyjoy';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'theon-greyjoy' AND c2.slug = 'asha-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Theon Greyjoy', 'Asha Greyjoy', 'hermanos', 'asha-greyjoy';
  END IF;

  -- Theon Greyjoy -> Rodrik Greyjoy (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'rodrik-greyjoy';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'theon-greyjoy' AND c2.slug = 'rodrik-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Theon Greyjoy', 'Rodrik Greyjoy', 'hermanos', 'rodrik-greyjoy';
  END IF;

  -- Theon Greyjoy -> Maron Greyjoy (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'maron-greyjoy';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'theon-greyjoy' AND c2.slug = 'maron-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Theon Greyjoy', 'Maron Greyjoy', 'hermanos', 'maron-greyjoy';
  END IF;

  -- Petyr Baelish -> Lysa Arryn (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'lysa-arryn';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'petyr-baelish' AND c2.slug = 'lysa-arryn'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Petyr Baelish', 'Lysa Arryn', 'conyuges', 'lysa-arryn';
  END IF;

  -- Bronn -> Lollys Stokeworth (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'lollys-stokeworth';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'bronn' AND c2.slug = 'lollys-stokeworth'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Bronn', 'Lollys Stokeworth', 'conyuges', 'lollys-stokeworth';
  END IF;

  -- Khal Drogo -> Daenerys Targaryen (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'daenerys-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'khal-drogo' AND c2.slug = 'daenerys-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Khal Drogo', 'Daenerys Targaryen', 'conyuges', 'daenerys-targaryen';
  END IF;

  -- Khal Drogo -> Rhaego (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'rhaego';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'khal-drogo' AND c2.slug = 'rhaego'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Khal Drogo', 'Rhaego', 'hijos', 'rhaego';
  END IF;

  -- Balon Greyjoy -> Alannys Harlaw (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'alannys-harlaw';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'balon-greyjoy' AND c2.slug = 'alannys-harlaw'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Balon Greyjoy', 'Alannys Harlaw', 'conyuges', 'alannys-harlaw';
  END IF;

  -- Balon Greyjoy -> Theon Greyjoy (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'theon-greyjoy';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'balon-greyjoy' AND c2.slug = 'theon-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Balon Greyjoy', 'Theon Greyjoy', 'hijos', 'theon-greyjoy';
  END IF;

  -- Balon Greyjoy -> Asha Greyjoy (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'asha-greyjoy';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'balon-greyjoy' AND c2.slug = 'asha-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Balon Greyjoy', 'Asha Greyjoy', 'hijos', 'asha-greyjoy';
  END IF;

  -- Balon Greyjoy -> Rodrik Greyjoy (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'rodrik-greyjoy';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'balon-greyjoy' AND c2.slug = 'rodrik-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Balon Greyjoy', 'Rodrik Greyjoy', 'hijos', 'rodrik-greyjoy';
  END IF;

  -- Balon Greyjoy -> Maron Greyjoy (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'maron-greyjoy';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'balon-greyjoy' AND c2.slug = 'maron-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Balon Greyjoy', 'Maron Greyjoy', 'hijos', 'maron-greyjoy';
  END IF;

  -- Balon Greyjoy -> Euron Greyjoy (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'euron-greyjoy';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'balon-greyjoy' AND c2.slug = 'euron-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Balon Greyjoy', 'Euron Greyjoy', 'hermanos', 'euron-greyjoy';
  END IF;

  -- Balon Greyjoy -> Victarion Greyjoy (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'victarion-greyjoy';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'balon-greyjoy' AND c2.slug = 'victarion-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Balon Greyjoy', 'Victarion Greyjoy', 'hermanos', 'victarion-greyjoy';
  END IF;

  -- Balon Greyjoy -> Aeron Greyjoy (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'aeron-greyjoy';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'balon-greyjoy' AND c2.slug = 'aeron-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Balon Greyjoy', 'Aeron Greyjoy', 'hermanos', 'aeron-greyjoy';
  END IF;

  -- Asha Greyjoy -> Balon Greyjoy (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'balon-greyjoy';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'asha-greyjoy' AND c2.slug = 'balon-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Asha Greyjoy', 'Balon Greyjoy', 'padre', 'balon-greyjoy';
  END IF;

  -- Asha Greyjoy -> Theon Greyjoy (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'theon-greyjoy';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'asha-greyjoy' AND c2.slug = 'theon-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Asha Greyjoy', 'Theon Greyjoy', 'hermanos', 'theon-greyjoy';
  END IF;

  -- Asha Greyjoy -> Rodrik Greyjoy (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'rodrik-greyjoy';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'asha-greyjoy' AND c2.slug = 'rodrik-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Asha Greyjoy', 'Rodrik Greyjoy', 'hermanos', 'rodrik-greyjoy';
  END IF;

  -- Asha Greyjoy -> Maron Greyjoy (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'maron-greyjoy';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'asha-greyjoy' AND c2.slug = 'maron-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Asha Greyjoy', 'Maron Greyjoy', 'hermanos', 'maron-greyjoy';
  END IF;

  -- Euron Greyjoy -> Volaris (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'volaris';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'euron-greyjoy' AND c2.slug = 'volaris'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Euron Greyjoy', 'Volaris', 'conyuges', 'volaris';
  END IF;

  -- Euron Greyjoy -> Balon Greyjoy (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'balon-greyjoy';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'euron-greyjoy' AND c2.slug = 'balon-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Euron Greyjoy', 'Balon Greyjoy', 'hermanos', 'balon-greyjoy';
  END IF;

  -- Euron Greyjoy -> Victarion Greyjoy (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'victarion-greyjoy';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'euron-greyjoy' AND c2.slug = 'victarion-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Euron Greyjoy', 'Victarion Greyjoy', 'hermanos', 'victarion-greyjoy';
  END IF;

  -- Euron Greyjoy -> Aeron Greyjoy (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'aeron-greyjoy';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'euron-greyjoy' AND c2.slug = 'aeron-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Euron Greyjoy', 'Aeron Greyjoy', 'hermanos', 'aeron-greyjoy';
  END IF;

  -- Victarion Greyjoy -> Balon Greyjoy (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'balon-greyjoy';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'victarion-greyjoy' AND c2.slug = 'balon-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Victarion Greyjoy', 'Balon Greyjoy', 'hermanos', 'balon-greyjoy';
  END IF;

  -- Victarion Greyjoy -> Euron Greyjoy (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'euron-greyjoy';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'victarion-greyjoy' AND c2.slug = 'euron-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Victarion Greyjoy', 'Euron Greyjoy', 'hermanos', 'euron-greyjoy';
  END IF;

  -- Victarion Greyjoy -> Aeron Greyjoy (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'aeron-greyjoy';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'victarion-greyjoy' AND c2.slug = 'aeron-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Victarion Greyjoy', 'Aeron Greyjoy', 'hermanos', 'aeron-greyjoy';
  END IF;

  -- Aeron Greyjoy -> Balon Greyjoy (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'balon-greyjoy';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'aeron-greyjoy' AND c2.slug = 'balon-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Aeron Greyjoy', 'Balon Greyjoy', 'hermanos', 'balon-greyjoy';
  END IF;

  -- Aeron Greyjoy -> Euron Greyjoy (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'euron-greyjoy';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'aeron-greyjoy' AND c2.slug = 'euron-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Aeron Greyjoy', 'Euron Greyjoy', 'hermanos', 'euron-greyjoy';
  END IF;

  -- Aeron Greyjoy -> Victarion Greyjoy (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'victarion-greyjoy';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'aeron-greyjoy' AND c2.slug = 'victarion-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Aeron Greyjoy', 'Victarion Greyjoy', 'hermanos', 'victarion-greyjoy';
  END IF;

  -- Margaery Tyrell -> Mace Tyrell (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'mace-tyrell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'margaery-tyrell' AND c2.slug = 'mace-tyrell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Margaery Tyrell', 'Mace Tyrell', 'padre', 'mace-tyrell';
  END IF;

  -- Margaery Tyrell -> Alerie Hightower (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'alerie-hightower';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'margaery-tyrell' AND c2.slug = 'alerie-hightower'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Margaery Tyrell', 'Alerie Hightower', 'madre', 'alerie-hightower';
  END IF;

  -- Margaery Tyrell -> Renly Baratheon (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'renly-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'margaery-tyrell' AND c2.slug = 'renly-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Margaery Tyrell', 'Renly Baratheon', 'conyuges', 'renly-baratheon';
  END IF;

  -- Margaery Tyrell -> Joffrey Baratheon (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'joffrey-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'margaery-tyrell' AND c2.slug = 'joffrey-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Margaery Tyrell', 'Joffrey Baratheon', 'conyuges', 'joffrey-baratheon';
  END IF;

  -- Margaery Tyrell -> Tommen Baratheon (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tommen-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'margaery-tyrell' AND c2.slug = 'tommen-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Margaery Tyrell', 'Tommen Baratheon', 'conyuges', 'tommen-baratheon';
  END IF;

  -- Margaery Tyrell -> Loras Tyrell (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'loras-tyrell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'margaery-tyrell' AND c2.slug = 'loras-tyrell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Margaery Tyrell', 'Loras Tyrell', 'hermanos', 'loras-tyrell';
  END IF;

  -- Loras Tyrell -> Mace Tyrell (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'mace-tyrell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'loras-tyrell' AND c2.slug = 'mace-tyrell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Loras Tyrell', 'Mace Tyrell', 'padre', 'mace-tyrell';
  END IF;

  -- Loras Tyrell -> Alerie Hightower (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'alerie-hightower';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'loras-tyrell' AND c2.slug = 'alerie-hightower'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Loras Tyrell', 'Alerie Hightower', 'madre', 'alerie-hightower';
  END IF;

  -- Loras Tyrell -> Margaery Tyrell (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'margaery-tyrell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'loras-tyrell' AND c2.slug = 'margaery-tyrell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Loras Tyrell', 'Margaery Tyrell', 'hermanos', 'margaery-tyrell';
  END IF;

  -- Olenna Tyrell -> Luthor Tyrell (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'luthor-tyrell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'olenna-tyrell' AND c2.slug = 'luthor-tyrell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Olenna Tyrell', 'Luthor Tyrell', 'conyuges', 'luthor-tyrell';
  END IF;

  -- Olenna Tyrell -> Mace Tyrell (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'mace-tyrell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'olenna-tyrell' AND c2.slug = 'mace-tyrell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Olenna Tyrell', 'Mace Tyrell', 'hijos', 'mace-tyrell';
  END IF;

  -- Mace Tyrell -> Luthor Tyrell (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'luthor-tyrell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'mace-tyrell' AND c2.slug = 'luthor-tyrell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Mace Tyrell', 'Luthor Tyrell', 'padre', 'luthor-tyrell';
  END IF;

  -- Mace Tyrell -> Alerie Hightower (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'alerie-hightower';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'mace-tyrell' AND c2.slug = 'alerie-hightower'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Mace Tyrell', 'Alerie Hightower', 'conyuges', 'alerie-hightower';
  END IF;

  -- Mace Tyrell -> Margaery Tyrell (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'margaery-tyrell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'mace-tyrell' AND c2.slug = 'margaery-tyrell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Mace Tyrell', 'Margaery Tyrell', 'hijos', 'margaery-tyrell';
  END IF;

  -- Mace Tyrell -> Loras Tyrell (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'loras-tyrell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'mace-tyrell' AND c2.slug = 'loras-tyrell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Mace Tyrell', 'Loras Tyrell', 'hijos', 'loras-tyrell';
  END IF;

  -- Oberyn Martell -> Lewyn Martell (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'lewyn-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'oberyn-martell' AND c2.slug = 'lewyn-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Oberyn Martell', 'Lewyn Martell', 'padre', 'lewyn-martell';
  END IF;

  -- Oberyn Martell -> Ellaria Sand (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'ellaria-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'oberyn-martell' AND c2.slug = 'ellaria-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Oberyn Martell', 'Ellaria Sand', 'conyuges', 'ellaria-sand';
  END IF;

  -- Oberyn Martell -> Obara Sand (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'obara-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'oberyn-martell' AND c2.slug = 'obara-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Oberyn Martell', 'Obara Sand', 'hijos', 'obara-sand';
  END IF;

  -- Oberyn Martell -> Nymeria Sand (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'nymeria-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'oberyn-martell' AND c2.slug = 'nymeria-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Oberyn Martell', 'Nymeria Sand', 'hijos', 'nymeria-sand';
  END IF;

  -- Oberyn Martell -> Tyene Sand (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tyene-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'oberyn-martell' AND c2.slug = 'tyene-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Oberyn Martell', 'Tyene Sand', 'hijos', 'tyene-sand';
  END IF;

  -- Oberyn Martell -> Sarella Sand (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'sarella-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'oberyn-martell' AND c2.slug = 'sarella-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Oberyn Martell', 'Sarella Sand', 'hijos', 'sarella-sand';
  END IF;

  -- Oberyn Martell -> Elia Sand (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'elia-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'oberyn-martell' AND c2.slug = 'elia-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Oberyn Martell', 'Elia Sand', 'hijos', 'elia-sand';
  END IF;

  -- Oberyn Martell -> Dorea Sand (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'dorea-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'oberyn-martell' AND c2.slug = 'dorea-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Oberyn Martell', 'Dorea Sand', 'hijos', 'dorea-sand';
  END IF;

  -- Oberyn Martell -> Loreza Sand (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'loreza-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'oberyn-martell' AND c2.slug = 'loreza-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Oberyn Martell', 'Loreza Sand', 'hijos', 'loreza-sand';
  END IF;

  -- Oberyn Martell -> Doran Martell (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'doran-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'oberyn-martell' AND c2.slug = 'doran-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Oberyn Martell', 'Doran Martell', 'hermanos', 'doran-martell';
  END IF;

  -- Oberyn Martell -> Elia Martell (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'elia-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'oberyn-martell' AND c2.slug = 'elia-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Oberyn Martell', 'Elia Martell', 'hermanos', 'elia-martell';
  END IF;

  -- Doran Martell -> Meria Martell (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'meria-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'doran-martell' AND c2.slug = 'meria-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Doran Martell', 'Meria Martell', 'conyuges', 'meria-martell';
  END IF;

  -- Doran Martell -> Arianne Martell (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'arianne-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'doran-martell' AND c2.slug = 'arianne-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Doran Martell', 'Arianne Martell', 'hijos', 'arianne-martell';
  END IF;

  -- Doran Martell -> Quentyn Martell (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'quentyn-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'doran-martell' AND c2.slug = 'quentyn-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Doran Martell', 'Quentyn Martell', 'hijos', 'quentyn-martell';
  END IF;

  -- Doran Martell -> Trystane Martell (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'trystane-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'doran-martell' AND c2.slug = 'trystane-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Doran Martell', 'Trystane Martell', 'hijos', 'trystane-martell';
  END IF;

  -- Doran Martell -> Oberyn Martell (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'oberyn-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'doran-martell' AND c2.slug = 'oberyn-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Doran Martell', 'Oberyn Martell', 'hermanos', 'oberyn-martell';
  END IF;

  -- Doran Martell -> Elia Martell (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'elia-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'doran-martell' AND c2.slug = 'elia-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Doran Martell', 'Elia Martell', 'hermanos', 'elia-martell';
  END IF;

  -- Arianne Martell -> Doran Martell (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'doran-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'arianne-martell' AND c2.slug = 'doran-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Arianne Martell', 'Doran Martell', 'padre', 'doran-martell';
  END IF;

  -- Arianne Martell -> Meria Martell (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'meria-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'arianne-martell' AND c2.slug = 'meria-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Arianne Martell', 'Meria Martell', 'madre', 'meria-martell';
  END IF;

  -- Arianne Martell -> Quentyn Martell (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'quentyn-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'arianne-martell' AND c2.slug = 'quentyn-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Arianne Martell', 'Quentyn Martell', 'hermanos', 'quentyn-martell';
  END IF;

  -- Arianne Martell -> Trystane Martell (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'trystane-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'arianne-martell' AND c2.slug = 'trystane-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Arianne Martell', 'Trystane Martell', 'hermanos', 'trystane-martell';
  END IF;

  -- Jorah Mormont -> Jeor Mormont (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'jeor-mormont';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'jorah-mormont' AND c2.slug = 'jeor-mormont'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Jorah Mormont', 'Jeor Mormont', 'padre', 'jeor-mormont';
  END IF;

  -- Jorah Mormont -> Lynesse Hightower (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'lynesse-hightower';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'jorah-mormont' AND c2.slug = 'lynesse-hightower'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Jorah Mormont', 'Lynesse Hightower', 'conyuges', 'lynesse-hightower';
  END IF;

  -- Roose Bolton -> Bethany Ryswell (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'bethany-ryswell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'roose-bolton' AND c2.slug = 'bethany-ryswell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Roose Bolton', 'Bethany Ryswell', 'conyuges', 'bethany-ryswell';
  END IF;

  -- Roose Bolton -> Walda Frey (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'walda-frey';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'roose-bolton' AND c2.slug = 'walda-frey'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Roose Bolton', 'Walda Frey', 'conyuges', 'walda-frey';
  END IF;

  -- Roose Bolton -> Ramsay Bolton (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'ramsay-bolton';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'roose-bolton' AND c2.slug = 'ramsay-bolton'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Roose Bolton', 'Ramsay Bolton', 'hijos', 'ramsay-bolton';
  END IF;

  -- Ramsay Bolton -> Roose Bolton (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'roose-bolton';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'ramsay-bolton' AND c2.slug = 'roose-bolton'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Ramsay Bolton', 'Roose Bolton', 'padre', 'roose-bolton';
  END IF;

  -- Ramsay Bolton -> Jeyne Poole (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'jeyne-poole';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'ramsay-bolton' AND c2.slug = 'jeyne-poole'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Ramsay Bolton', 'Jeyne Poole', 'conyuges', 'jeyne-poole';
  END IF;

  -- Walder Frey -> Marna Vance (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'marna-vance';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'walder-frey' AND c2.slug = 'marna-vance'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Walder Frey', 'Marna Vance', 'conyuges', 'marna-vance';
  END IF;

  -- Walder Frey -> Bethany Rosby (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'bethany-rosby';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'walder-frey' AND c2.slug = 'bethany-rosby'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Walder Frey', 'Bethany Rosby', 'conyuges', 'bethany-rosby';
  END IF;

  -- Walder Frey -> Shiera Crakehall (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'shiera-crakehall';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'walder-frey' AND c2.slug = 'shiera-crakehall'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Walder Frey', 'Shiera Crakehall', 'conyuges', 'shiera-crakehall';
  END IF;

  -- Walder Frey -> Annara Farring (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'annara-farring';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'walder-frey' AND c2.slug = 'annara-farring'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Walder Frey', 'Annara Farring', 'conyuges', 'annara-farring';
  END IF;

  -- Walder Frey -> Joyeuse Erenford (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'joyeuse-erenford';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'walder-frey' AND c2.slug = 'joyeuse-erenford'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Walder Frey', 'Joyeuse Erenford', 'conyuges', 'joyeuse-erenford';
  END IF;

  -- Howland Reed -> Jyana Reed (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'jyana-reed';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'howland-reed' AND c2.slug = 'jyana-reed'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Howland Reed', 'Jyana Reed', 'conyuges', 'jyana-reed';
  END IF;

  -- Howland Reed -> Jojen Reed (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'jojen-reed';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'howland-reed' AND c2.slug = 'jojen-reed'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Howland Reed', 'Jojen Reed', 'hijos', 'jojen-reed';
  END IF;

  -- Howland Reed -> Meera Reed (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'meera-reed';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'howland-reed' AND c2.slug = 'meera-reed'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Howland Reed', 'Meera Reed', 'hijos', 'meera-reed';
  END IF;

  -- Jojen Reed -> Howland Reed (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'howland-reed';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'jojen-reed' AND c2.slug = 'howland-reed'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Jojen Reed', 'Howland Reed', 'padre', 'howland-reed';
  END IF;

  -- Jojen Reed -> Jyana Reed (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'jyana-reed';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'jojen-reed' AND c2.slug = 'jyana-reed'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Jojen Reed', 'Jyana Reed', 'madre', 'jyana-reed';
  END IF;

  -- Jojen Reed -> Meera Reed (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'meera-reed';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'jojen-reed' AND c2.slug = 'meera-reed'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Jojen Reed', 'Meera Reed', 'hermanos', 'meera-reed';
  END IF;

  -- Meera Reed -> Howland Reed (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'howland-reed';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'meera-reed' AND c2.slug = 'howland-reed'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Meera Reed', 'Howland Reed', 'padre', 'howland-reed';
  END IF;

  -- Meera Reed -> Jyana Reed (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'jyana-reed';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'meera-reed' AND c2.slug = 'jyana-reed'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Meera Reed', 'Jyana Reed', 'madre', 'jyana-reed';
  END IF;

  -- Meera Reed -> Jojen Reed (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'jojen-reed';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'meera-reed' AND c2.slug = 'jojen-reed'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Meera Reed', 'Jojen Reed', 'hermanos', 'jojen-reed';
  END IF;

  -- Grey Worm -> Missandei (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'missandei';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'grey-worm' AND c2.slug = 'missandei'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Grey Worm', 'Missandei', 'conyuges', 'missandei';
  END IF;

  -- Missandei -> Grey Worm (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'grey-worm';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'missandei' AND c2.slug = 'grey-worm'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Missandei', 'Grey Worm', 'conyuges', 'grey-worm';
  END IF;

  -- Edmure Tully -> Hoster Tully (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'hoster-tully';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'edmure-tully' AND c2.slug = 'hoster-tully'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Edmure Tully', 'Hoster Tully', 'padre', 'hoster-tully';
  END IF;

  -- Edmure Tully -> Roslin Frey (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'roslin-frey';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'edmure-tully' AND c2.slug = 'roslin-frey'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Edmure Tully', 'Roslin Frey', 'conyuges', 'roslin-frey';
  END IF;

  -- Edmure Tully -> Catelyn Tully (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'catelyn-tully';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'edmure-tully' AND c2.slug = 'catelyn-tully'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Edmure Tully', 'Catelyn Tully', 'hermanos', 'catelyn-tully';
  END IF;

  -- Edmure Tully -> Lysa Arryn (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'lysa-arryn';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'edmure-tully' AND c2.slug = 'lysa-arryn'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Edmure Tully', 'Lysa Arryn', 'hermanos', 'lysa-arryn';
  END IF;

  -- Hoster Tully -> Edmure Tully (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'edmure-tully';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'hoster-tully' AND c2.slug = 'edmure-tully'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Hoster Tully', 'Edmure Tully', 'hijos', 'edmure-tully';
  END IF;

  -- Hoster Tully -> Catelyn Tully (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'catelyn-tully';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'hoster-tully' AND c2.slug = 'catelyn-tully'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Hoster Tully', 'Catelyn Tully', 'hijos', 'catelyn-tully';
  END IF;

  -- Hoster Tully -> Lysa Arryn (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'lysa-arryn';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'hoster-tully' AND c2.slug = 'lysa-arryn'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Hoster Tully', 'Lysa Arryn', 'hijos', 'lysa-arryn';
  END IF;

  -- Lysa Arryn -> Hoster Tully (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'hoster-tully';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'lysa-arryn' AND c2.slug = 'hoster-tully'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Lysa Arryn', 'Hoster Tully', 'padre', 'hoster-tully';
  END IF;

  -- Lysa Arryn -> Jon Arryn (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'jon-arryn';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'lysa-arryn' AND c2.slug = 'jon-arryn'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Lysa Arryn', 'Jon Arryn', 'conyuges', 'jon-arryn';
  END IF;

  -- Lysa Arryn -> Petyr Baelish (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'petyr-baelish';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'lysa-arryn' AND c2.slug = 'petyr-baelish'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Lysa Arryn', 'Petyr Baelish', 'conyuges', 'petyr-baelish';
  END IF;

  -- Lysa Arryn -> Robert Arryn (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'robert-arryn';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'lysa-arryn' AND c2.slug = 'robert-arryn'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Lysa Arryn', 'Robert Arryn', 'hijos', 'robert-arryn';
  END IF;

  -- Lysa Arryn -> Catelyn Tully (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'catelyn-tully';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'lysa-arryn' AND c2.slug = 'catelyn-tully'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Lysa Arryn', 'Catelyn Tully', 'hermanos', 'catelyn-tully';
  END IF;

  -- Lysa Arryn -> Edmure Tully (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'edmure-tully';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'lysa-arryn' AND c2.slug = 'edmure-tully'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Lysa Arryn', 'Edmure Tully', 'hermanos', 'edmure-tully';
  END IF;

  -- Robert Arryn -> Jon Arryn (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'jon-arryn';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'robert-arryn' AND c2.slug = 'jon-arryn'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Robert Arryn', 'Jon Arryn', 'padre', 'jon-arryn';
  END IF;

  -- Robert Arryn -> Lysa Arryn (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'lysa-arryn';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'robert-arryn' AND c2.slug = 'lysa-arryn'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Robert Arryn', 'Lysa Arryn', 'madre', 'lysa-arryn';
  END IF;

  -- Sandor Clegane -> Gregor Clegane (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'gregor-clegane';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'sandor-clegane' AND c2.slug = 'gregor-clegane'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Sandor Clegane', 'Gregor Clegane', 'hermanos', 'gregor-clegane';
  END IF;

  -- Gregor Clegane -> Sandor Clegane (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'sandor-clegane';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'gregor-clegane' AND c2.slug = 'sandor-clegane'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Gregor Clegane', 'Sandor Clegane', 'hermanos', 'sandor-clegane';
  END IF;

  -- Gilly -> Craster (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'craster';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'gilly' AND c2.slug = 'craster'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Gilly', 'Craster', 'padre', 'craster';
  END IF;

  -- Gilly -> Samwell Tarly (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'samwell-tarly';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'gilly' AND c2.slug = 'samwell-tarly'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Gilly', 'Samwell Tarly', 'conyuges', 'samwell-tarly';
  END IF;

  -- Kevan Lannister -> Lancel Lannister (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'lancel-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'kevan-lannister' AND c2.slug = 'lancel-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Kevan Lannister', 'Lancel Lannister', 'hijos', 'lancel-lannister';
  END IF;

  -- Kevan Lannister -> Tywin Lannister (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tywin-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'kevan-lannister' AND c2.slug = 'tywin-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Kevan Lannister', 'Tywin Lannister', 'hermanos', 'tywin-lannister';
  END IF;

  -- Lancel Lannister -> Kevan Lannister (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'kevan-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'lancel-lannister' AND c2.slug = 'kevan-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Lancel Lannister', 'Kevan Lannister', 'padre', 'kevan-lannister';
  END IF;

  -- Elia Martell -> Rhaegar Targaryen (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'rhaegar-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'elia-martell' AND c2.slug = 'rhaegar-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Elia Martell', 'Rhaegar Targaryen', 'conyuges', 'rhaegar-targaryen';
  END IF;

  -- Elia Martell -> Rhaenys Targaryen (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'rhaenys-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'elia-martell' AND c2.slug = 'rhaenys-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Elia Martell', 'Rhaenys Targaryen', 'hijos', 'rhaenys-targaryen';
  END IF;

  -- Elia Martell -> Aegon Targaryen (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'aegon-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'elia-martell' AND c2.slug = 'aegon-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Elia Martell', 'Aegon Targaryen', 'hijos', 'aegon-targaryen';
  END IF;

  -- Elia Martell -> Doran Martell (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'doran-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'elia-martell' AND c2.slug = 'doran-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Elia Martell', 'Doran Martell', 'hermanos', 'doran-martell';
  END IF;

  -- Elia Martell -> Oberyn Martell (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'oberyn-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'elia-martell' AND c2.slug = 'oberyn-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Elia Martell', 'Oberyn Martell', 'hermanos', 'oberyn-martell';
  END IF;

  -- Aenys I Targaryen -> Aegon Targaryen (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'aegon-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'aenys-i-targaryen' AND c2.slug = 'aegon-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Aenys I Targaryen', 'Aegon Targaryen', 'padre', 'aegon-targaryen';
  END IF;

  -- Aenys I Targaryen -> Rhaenys Targaryen (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'rhaenys-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'aenys-i-targaryen' AND c2.slug = 'rhaenys-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Aenys I Targaryen', 'Rhaenys Targaryen', 'madre', 'rhaenys-targaryen';
  END IF;

  -- Maegor I Targaryen -> Aegon Targaryen (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'aegon-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'maegor-i-targaryen' AND c2.slug = 'aegon-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Maegor I Targaryen', 'Aegon Targaryen', 'padre', 'aegon-targaryen';
  END IF;

  -- Maegor I Targaryen -> Visenya Targaryen (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'visenya-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'maegor-i-targaryen' AND c2.slug = 'visenya-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Maegor I Targaryen', 'Visenya Targaryen', 'madre', 'visenya-targaryen';
  END IF;

  -- Maegor I Targaryen -> Aenys I Targaryen (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'aenys-i-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'maegor-i-targaryen' AND c2.slug = 'aenys-i-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Maegor I Targaryen', 'Aenys I Targaryen', 'hermanos', 'aenys-i-targaryen';
  END IF;

  -- Jaehaerys I Targaryen -> Aenys I Targaryen (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'aenys-i-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'jaehaerys-i-targaryen' AND c2.slug = 'aenys-i-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Jaehaerys I Targaryen', 'Aenys I Targaryen', 'padre', 'aenys-i-targaryen';
  END IF;

  -- Aegon II Targaryen -> Viserys I Targaryen (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'viserys-i-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'aegon-ii-targaryen' AND c2.slug = 'viserys-i-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Aegon II Targaryen', 'Viserys I Targaryen', 'padre', 'viserys-i-targaryen';
  END IF;

  -- Rhaenyra Targaryen -> Viserys I Targaryen (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'viserys-i-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'rhaenyra-targaryen' AND c2.slug = 'viserys-i-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Rhaenyra Targaryen', 'Viserys I Targaryen', 'padre', 'viserys-i-targaryen';
  END IF;

  -- Aegon III Targaryen -> Rhaenyra Targaryen (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'rhaenyra-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'aegon-iii-targaryen' AND c2.slug = 'rhaenyra-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Aegon III Targaryen', 'Rhaenyra Targaryen', 'madre', 'rhaenyra-targaryen';
  END IF;

  -- Daeron II Targaryen -> Aegon IV Targaryen (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'aegon-iv-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'daeron-ii-targaryen' AND c2.slug = 'aegon-iv-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Daeron II Targaryen', 'Aegon IV Targaryen', 'padre', 'aegon-iv-targaryen';
  END IF;

  -- Daemon Blackfyre -> Aegon IV Targaryen (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'aegon-iv-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'daemon-blackfyre' AND c2.slug = 'aegon-iv-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Daemon Blackfyre', 'Aegon IV Targaryen', 'padre', 'aegon-iv-targaryen';
  END IF;

  -- Brynden Rivers -> Aegon IV Targaryen (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'aegon-iv-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'brynden-rivers' AND c2.slug = 'aegon-iv-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Brynden Rivers', 'Aegon IV Targaryen', 'padre', 'aegon-iv-targaryen';
  END IF;

  -- Aegor Rivers -> Aegon IV Targaryen (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'aegon-iv-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'aegor-rivers' AND c2.slug = 'aegon-iv-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Aegor Rivers', 'Aegon IV Targaryen', 'padre', 'aegon-iv-targaryen';
  END IF;

  -- Shiera Seastar -> Aegon IV Targaryen (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'aegon-iv-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'shiera-seastar' AND c2.slug = 'aegon-iv-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Shiera Seastar', 'Aegon IV Targaryen', 'padre', 'aegon-iv-targaryen';
  END IF;

  -- Aerys II Targaryen -> Jaehaerys II Targaryen (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'jaehaerys-ii-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'aerys-ii-targaryen' AND c2.slug = 'jaehaerys-ii-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Aerys II Targaryen', 'Jaehaerys II Targaryen', 'padre', 'jaehaerys-ii-targaryen';
  END IF;

  -- Aerys II Targaryen -> Rhaegar Targaryen (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'rhaegar-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'aerys-ii-targaryen' AND c2.slug = 'rhaegar-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Aerys II Targaryen', 'Rhaegar Targaryen', 'hijos', 'rhaegar-targaryen';
  END IF;

  -- Aerys II Targaryen -> Viserys Targaryen (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'viserys-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'aerys-ii-targaryen' AND c2.slug = 'viserys-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Aerys II Targaryen', 'Viserys Targaryen', 'hijos', 'viserys-targaryen';
  END IF;

  -- Aerys II Targaryen -> Daenerys Targaryen (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'daenerys-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'aerys-ii-targaryen' AND c2.slug = 'daenerys-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Aerys II Targaryen', 'Daenerys Targaryen', 'hijos', 'daenerys-targaryen';
  END IF;

  -- Myrcella Baratheon -> Robert Baratheon (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'robert-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'myrcella-baratheon' AND c2.slug = 'robert-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Myrcella Baratheon', 'Robert Baratheon', 'padre', 'robert-baratheon';
  END IF;

  -- Myrcella Baratheon -> Cersei Lannister (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'cersei-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'myrcella-baratheon' AND c2.slug = 'cersei-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Myrcella Baratheon', 'Cersei Lannister', 'madre', 'cersei-lannister';
  END IF;

  -- Myrcella Baratheon -> Joffrey Baratheon (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'joffrey-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'myrcella-baratheon' AND c2.slug = 'joffrey-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Myrcella Baratheon', 'Joffrey Baratheon', 'hermanos', 'joffrey-baratheon';
  END IF;

  -- Myrcella Baratheon -> Tommen Baratheon (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tommen-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'myrcella-baratheon' AND c2.slug = 'tommen-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Myrcella Baratheon', 'Tommen Baratheon', 'hermanos', 'tommen-baratheon';
  END IF;

  -- Tommen Baratheon -> Robert Baratheon (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'robert-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tommen-baratheon' AND c2.slug = 'robert-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tommen Baratheon', 'Robert Baratheon', 'padre', 'robert-baratheon';
  END IF;

  -- Tommen Baratheon -> Cersei Lannister (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'cersei-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tommen-baratheon' AND c2.slug = 'cersei-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tommen Baratheon', 'Cersei Lannister', 'madre', 'cersei-lannister';
  END IF;

  -- Tommen Baratheon -> Margaery Tyrell (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'margaery-tyrell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tommen-baratheon' AND c2.slug = 'margaery-tyrell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tommen Baratheon', 'Margaery Tyrell', 'conyuges', 'margaery-tyrell';
  END IF;

  -- Tommen Baratheon -> Joffrey Baratheon (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'joffrey-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tommen-baratheon' AND c2.slug = 'joffrey-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tommen Baratheon', 'Joffrey Baratheon', 'hermanos', 'joffrey-baratheon';
  END IF;

  -- Tommen Baratheon -> Myrcella Baratheon (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'myrcella-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tommen-baratheon' AND c2.slug = 'myrcella-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tommen Baratheon', 'Myrcella Baratheon', 'hermanos', 'myrcella-baratheon';
  END IF;

  -- Shireen Baratheon -> Stannis Baratheon (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'stannis-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'shireen-baratheon' AND c2.slug = 'stannis-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Shireen Baratheon', 'Stannis Baratheon', 'padre', 'stannis-baratheon';
  END IF;

  -- Shireen Baratheon -> Selyse Florent (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'selyse-florent';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'shireen-baratheon' AND c2.slug = 'selyse-florent'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Shireen Baratheon', 'Selyse Florent', 'madre', 'selyse-florent';
  END IF;

  -- Selyse Florent -> Stannis Baratheon (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'stannis-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'selyse-florent' AND c2.slug = 'stannis-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Selyse Florent', 'Stannis Baratheon', 'conyuges', 'stannis-baratheon';
  END IF;

  -- Selyse Florent -> Shireen Baratheon (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'shireen-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'selyse-florent' AND c2.slug = 'shireen-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Selyse Florent', 'Shireen Baratheon', 'hijos', 'shireen-baratheon';
  END IF;

  -- Edric Storm -> Robert Baratheon (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'robert-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'edric-storm' AND c2.slug = 'robert-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Edric Storm', 'Robert Baratheon', 'padre', 'robert-baratheon';
  END IF;

  -- Mya Stone -> Robert Baratheon (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'robert-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'mya-stone' AND c2.slug = 'robert-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Mya Stone', 'Robert Baratheon', 'padre', 'robert-baratheon';
  END IF;

  -- Barra -> Robert Baratheon (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'robert-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'barra' AND c2.slug = 'robert-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Barra', 'Robert Baratheon', 'padre', 'robert-baratheon';
  END IF;

  -- Bella -> Robert Baratheon (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'robert-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'bella' AND c2.slug = 'robert-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Bella', 'Robert Baratheon', 'padre', 'robert-baratheon';
  END IF;

  -- Quentyn Martell -> Doran Martell (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'doran-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'quentyn-martell' AND c2.slug = 'doran-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Quentyn Martell', 'Doran Martell', 'padre', 'doran-martell';
  END IF;

  -- Quentyn Martell -> Meria Martell (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'meria-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'quentyn-martell' AND c2.slug = 'meria-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Quentyn Martell', 'Meria Martell', 'madre', 'meria-martell';
  END IF;

  -- Quentyn Martell -> Arianne Martell (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'arianne-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'quentyn-martell' AND c2.slug = 'arianne-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Quentyn Martell', 'Arianne Martell', 'hermanos', 'arianne-martell';
  END IF;

  -- Quentyn Martell -> Trystane Martell (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'trystane-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'quentyn-martell' AND c2.slug = 'trystane-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Quentyn Martell', 'Trystane Martell', 'hermanos', 'trystane-martell';
  END IF;

  -- Trystane Martell -> Doran Martell (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'doran-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'trystane-martell' AND c2.slug = 'doran-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Trystane Martell', 'Doran Martell', 'padre', 'doran-martell';
  END IF;

  -- Trystane Martell -> Meria Martell (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'meria-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'trystane-martell' AND c2.slug = 'meria-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Trystane Martell', 'Meria Martell', 'madre', 'meria-martell';
  END IF;

  -- Trystane Martell -> Arianne Martell (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'arianne-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'trystane-martell' AND c2.slug = 'arianne-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Trystane Martell', 'Arianne Martell', 'hermanos', 'arianne-martell';
  END IF;

  -- Trystane Martell -> Quentyn Martell (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'quentyn-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'trystane-martell' AND c2.slug = 'quentyn-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Trystane Martell', 'Quentyn Martell', 'hermanos', 'quentyn-martell';
  END IF;

  -- Garlan Tyrell -> Mace Tyrell (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'mace-tyrell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'garlan-tyrell' AND c2.slug = 'mace-tyrell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Garlan Tyrell', 'Mace Tyrell', 'padre', 'mace-tyrell';
  END IF;

  -- Garlan Tyrell -> Alerie Hightower (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'alerie-hightower';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'garlan-tyrell' AND c2.slug = 'alerie-hightower'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Garlan Tyrell', 'Alerie Hightower', 'madre', 'alerie-hightower';
  END IF;

  -- Garlan Tyrell -> Loras Tyrell (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'loras-tyrell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'garlan-tyrell' AND c2.slug = 'loras-tyrell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Garlan Tyrell', 'Loras Tyrell', 'hermanos', 'loras-tyrell';
  END IF;

  -- Garlan Tyrell -> Margaery Tyrell (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'margaery-tyrell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'garlan-tyrell' AND c2.slug = 'margaery-tyrell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Garlan Tyrell', 'Margaery Tyrell', 'hermanos', 'margaery-tyrell';
  END IF;

  -- Willas Tyrell -> Mace Tyrell (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'mace-tyrell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'willas-tyrell' AND c2.slug = 'mace-tyrell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Willas Tyrell', 'Mace Tyrell', 'padre', 'mace-tyrell';
  END IF;

  -- Willas Tyrell -> Alerie Hightower (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'alerie-hightower';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'willas-tyrell' AND c2.slug = 'alerie-hightower'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Willas Tyrell', 'Alerie Hightower', 'madre', 'alerie-hightower';
  END IF;

  -- Willas Tyrell -> Loras Tyrell (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'loras-tyrell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'willas-tyrell' AND c2.slug = 'loras-tyrell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Willas Tyrell', 'Loras Tyrell', 'hermanos', 'loras-tyrell';
  END IF;

  -- Willas Tyrell -> Margaery Tyrell (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'margaery-tyrell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'willas-tyrell' AND c2.slug = 'margaery-tyrell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Willas Tyrell', 'Margaery Tyrell', 'hermanos', 'margaery-tyrell';
  END IF;

  -- Willas Tyrell -> Garlan Tyrell (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'garlan-tyrell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'willas-tyrell' AND c2.slug = 'garlan-tyrell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Willas Tyrell', 'Garlan Tyrell', 'hermanos', 'garlan-tyrell';
  END IF;

  -- Emmon Frey -> Walder Frey (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'walder-frey';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'emmon-frey' AND c2.slug = 'walder-frey'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Emmon Frey', 'Walder Frey', 'padre', 'walder-frey';
  END IF;

  -- Emmon Frey -> Genna Lannister (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'genna-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'emmon-frey' AND c2.slug = 'genna-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Emmon Frey', 'Genna Lannister', 'conyuges', 'genna-lannister';
  END IF;

  -- Hosteen Frey -> Walder Frey (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'walder-frey';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'hosteen-frey' AND c2.slug = 'walder-frey'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Hosteen Frey', 'Walder Frey', 'padre', 'walder-frey';
  END IF;

  -- Lothar Frey -> Walder Frey (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'walder-frey';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'lothar-frey' AND c2.slug = 'walder-frey'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Lothar Frey', 'Walder Frey', 'padre', 'walder-frey';
  END IF;

  -- Lyonel Strong -> Larys Strong (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'larys-strong';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'lyonel-strong' AND c2.slug = 'larys-strong'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Lyonel Strong', 'Larys Strong', 'hijos', 'larys-strong';
  END IF;

  -- Larys Strong -> Lyonel Strong (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'lyonel-strong';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'larys-strong' AND c2.slug = 'lyonel-strong'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Larys Strong', 'Lyonel Strong', 'padre', 'lyonel-strong';
  END IF;

  -- Tygett Lannister -> Tytos Lannister (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tytos-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tygett-lannister' AND c2.slug = 'tytos-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tygett Lannister', 'Tytos Lannister', 'padre', 'tytos-lannister';
  END IF;

  -- Tygett Lannister -> Jeyne Marbrand (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'jeyne-marbrand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tygett-lannister' AND c2.slug = 'jeyne-marbrand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tygett Lannister', 'Jeyne Marbrand', 'madre', 'jeyne-marbrand';
  END IF;

  -- Tygett Lannister -> Tyrek Lannister (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tyrek-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tygett-lannister' AND c2.slug = 'tyrek-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tygett Lannister', 'Tyrek Lannister', 'hijos', 'tyrek-lannister';
  END IF;

  -- Tygett Lannister -> Tywin Lannister (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tywin-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tygett-lannister' AND c2.slug = 'tywin-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tygett Lannister', 'Tywin Lannister', 'hermanos', 'tywin-lannister';
  END IF;

  -- Tygett Lannister -> Kevan Lannister (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'kevan-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tygett-lannister' AND c2.slug = 'kevan-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tygett Lannister', 'Kevan Lannister', 'hermanos', 'kevan-lannister';
  END IF;

  -- Tygett Lannister -> Genna Lannister (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'genna-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tygett-lannister' AND c2.slug = 'genna-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tygett Lannister', 'Genna Lannister', 'hermanos', 'genna-lannister';
  END IF;

  -- Genna Lannister -> Tytos Lannister (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tytos-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'genna-lannister' AND c2.slug = 'tytos-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Genna Lannister', 'Tytos Lannister', 'padre', 'tytos-lannister';
  END IF;

  -- Genna Lannister -> Jeyne Marbrand (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'jeyne-marbrand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'genna-lannister' AND c2.slug = 'jeyne-marbrand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Genna Lannister', 'Jeyne Marbrand', 'madre', 'jeyne-marbrand';
  END IF;

  -- Genna Lannister -> Emmon Frey (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'emmon-frey';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'genna-lannister' AND c2.slug = 'emmon-frey'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Genna Lannister', 'Emmon Frey', 'conyuges', 'emmon-frey';
  END IF;

  -- Genna Lannister -> Tywin Lannister (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tywin-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'genna-lannister' AND c2.slug = 'tywin-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Genna Lannister', 'Tywin Lannister', 'hermanos', 'tywin-lannister';
  END IF;

  -- Genna Lannister -> Kevan Lannister (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'kevan-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'genna-lannister' AND c2.slug = 'kevan-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Genna Lannister', 'Kevan Lannister', 'hermanos', 'kevan-lannister';
  END IF;

  -- Genna Lannister -> Tygett Lannister (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tygett-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'genna-lannister' AND c2.slug = 'tygett-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Genna Lannister', 'Tygett Lannister', 'hermanos', 'tygett-lannister';
  END IF;

  -- Gerion Lannister -> Tytos Lannister (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tytos-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'gerion-lannister' AND c2.slug = 'tytos-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Gerion Lannister', 'Tytos Lannister', 'padre', 'tytos-lannister';
  END IF;

  -- Gerion Lannister -> Jeyne Marbrand (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'jeyne-marbrand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'gerion-lannister' AND c2.slug = 'jeyne-marbrand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Gerion Lannister', 'Jeyne Marbrand', 'madre', 'jeyne-marbrand';
  END IF;

  -- Gerion Lannister -> Tywin Lannister (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tywin-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'gerion-lannister' AND c2.slug = 'tywin-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Gerion Lannister', 'Tywin Lannister', 'hermanos', 'tywin-lannister';
  END IF;

  -- Gerion Lannister -> Kevan Lannister (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'kevan-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'gerion-lannister' AND c2.slug = 'kevan-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Gerion Lannister', 'Kevan Lannister', 'hermanos', 'kevan-lannister';
  END IF;

  -- Gerion Lannister -> Genna Lannister (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'genna-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'gerion-lannister' AND c2.slug = 'genna-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Gerion Lannister', 'Genna Lannister', 'hermanos', 'genna-lannister';
  END IF;

  -- Gerion Lannister -> Tygett Lannister (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tygett-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'gerion-lannister' AND c2.slug = 'tygett-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Gerion Lannister', 'Tygett Lannister', 'hermanos', 'tygett-lannister';
  END IF;

  -- Jeyne Westerling -> Robb Stark (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'robb-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'jeyne-westerling' AND c2.slug = 'robb-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Jeyne Westerling', 'Robb Stark', 'conyuges', 'robb-stark';
  END IF;

  -- Roslin Frey -> Walder Frey (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'walder-frey';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'roslin-frey' AND c2.slug = 'walder-frey'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Roslin Frey', 'Walder Frey', 'padre', 'walder-frey';
  END IF;

  -- Roslin Frey -> Edmure Tully (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'edmure-tully';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'roslin-frey' AND c2.slug = 'edmure-tully'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Roslin Frey', 'Edmure Tully', 'conyuges', 'edmure-tully';
  END IF;

  -- Jeyne Poole -> Ramsay Bolton (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'ramsay-bolton';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'jeyne-poole' AND c2.slug = 'ramsay-bolton'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Jeyne Poole', 'Ramsay Bolton', 'conyuges', 'ramsay-bolton';
  END IF;

  -- Hizdahr zo Loraq -> Daenerys Targaryen (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'daenerys-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'hizdahr-zo-loraq' AND c2.slug = 'daenerys-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Hizdahr zo Loraq', 'Daenerys Targaryen', 'conyuges', 'daenerys-targaryen';
  END IF;

  -- Dalla -> Tormund Gigante (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tormund-gigante';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'dalla' AND c2.slug = 'tormund-gigante'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Dalla', 'Tormund Gigante', 'conyuges', 'tormund-gigante';
  END IF;

  -- Dalla -> Tormenta (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tormenta';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'dalla' AND c2.slug = 'tormenta'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Dalla', 'Tormenta', 'hijos', 'tormenta';
  END IF;

  -- Lynesse Hightower -> Jorah Mormont (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'jorah-mormont';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'lynesse-hightower' AND c2.slug = 'jorah-mormont'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Lynesse Hightower', 'Jorah Mormont', 'conyuges', 'jorah-mormont';
  END IF;

  -- Randyll Tarly -> Samwell Tarly (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'samwell-tarly';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'randyll-tarly' AND c2.slug = 'samwell-tarly'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Randyll Tarly', 'Samwell Tarly', 'hijos', 'samwell-tarly';
  END IF;

  -- Randyll Tarly -> Dickon Tarly (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'dickon-tarly';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'randyll-tarly' AND c2.slug = 'dickon-tarly'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Randyll Tarly', 'Dickon Tarly', 'hijos', 'dickon-tarly';
  END IF;

  -- Dickon Tarly -> Randyll Tarly (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'randyll-tarly';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'dickon-tarly' AND c2.slug = 'randyll-tarly'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Dickon Tarly', 'Randyll Tarly', 'padre', 'randyll-tarly';
  END IF;

  -- Dickon Tarly -> Samwell Tarly (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'samwell-tarly';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'dickon-tarly' AND c2.slug = 'samwell-tarly'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Dickon Tarly', 'Samwell Tarly', 'hermanos', 'samwell-tarly';
  END IF;

  -- Talisa Maegyr -> Robb Stark (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'robb-stark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'talisa-maegyr' AND c2.slug = 'robb-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Talisa Maegyr', 'Robb Stark', 'conyuges', 'robb-stark';
  END IF;

  -- Lollys Stokeworth -> Bronn (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'bronn';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'lollys-stokeworth' AND c2.slug = 'bronn'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Lollys Stokeworth', 'Bronn', 'conyuges', 'bronn';
  END IF;

  -- Arryk -> Erryk (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'erryk';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'arryk' AND c2.slug = 'erryk'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Arryk', 'Erryk', 'hermanos', 'erryk';
  END IF;

  -- Erryk -> Arryk (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'arryk';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'erryk' AND c2.slug = 'arryk'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Erryk', 'Arryk', 'hermanos', 'arryk';
  END IF;

  -- Joanna Lannister -> Tywin Lannister (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tywin-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'joanna-lannister' AND c2.slug = 'tywin-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Joanna Lannister', 'Tywin Lannister', 'conyuges', 'tywin-lannister';
  END IF;

  -- Joanna Lannister -> Cersei Lannister (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'cersei-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'joanna-lannister' AND c2.slug = 'cersei-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Joanna Lannister', 'Cersei Lannister', 'hijos', 'cersei-lannister';
  END IF;

  -- Joanna Lannister -> Jaime Lannister (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'jaime-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'joanna-lannister' AND c2.slug = 'jaime-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Joanna Lannister', 'Jaime Lannister', 'hijos', 'jaime-lannister';
  END IF;

  -- Joanna Lannister -> Tyrion Lannister (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tyrion-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'joanna-lannister' AND c2.slug = 'tyrion-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Joanna Lannister', 'Tyrion Lannister', 'hijos', 'tyrion-lannister';
  END IF;

  -- Tytos Lannister -> Jeyne Marbrand (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'jeyne-marbrand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tytos-lannister' AND c2.slug = 'jeyne-marbrand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tytos Lannister', 'Jeyne Marbrand', 'conyuges', 'jeyne-marbrand';
  END IF;

  -- Tytos Lannister -> Tywin Lannister (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tywin-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tytos-lannister' AND c2.slug = 'tywin-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tytos Lannister', 'Tywin Lannister', 'hijos', 'tywin-lannister';
  END IF;

  -- Tytos Lannister -> Kevan Lannister (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'kevan-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tytos-lannister' AND c2.slug = 'kevan-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tytos Lannister', 'Kevan Lannister', 'hijos', 'kevan-lannister';
  END IF;

  -- Tytos Lannister -> Genna Lannister (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'genna-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tytos-lannister' AND c2.slug = 'genna-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tytos Lannister', 'Genna Lannister', 'hijos', 'genna-lannister';
  END IF;

  -- Tytos Lannister -> Tygett Lannister (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tygett-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tytos-lannister' AND c2.slug = 'tygett-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tytos Lannister', 'Tygett Lannister', 'hijos', 'tygett-lannister';
  END IF;

  -- Tytos Lannister -> Gerion Lannister (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'gerion-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tytos-lannister' AND c2.slug = 'gerion-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tytos Lannister', 'Gerion Lannister', 'hijos', 'gerion-lannister';
  END IF;

  -- Jeyne Marbrand -> Tytos Lannister (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tytos-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'jeyne-marbrand' AND c2.slug = 'tytos-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Jeyne Marbrand', 'Tytos Lannister', 'conyuges', 'tytos-lannister';
  END IF;

  -- Jeyne Marbrand -> Tywin Lannister (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tywin-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'jeyne-marbrand' AND c2.slug = 'tywin-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Jeyne Marbrand', 'Tywin Lannister', 'hijos', 'tywin-lannister';
  END IF;

  -- Jeyne Marbrand -> Kevan Lannister (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'kevan-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'jeyne-marbrand' AND c2.slug = 'kevan-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Jeyne Marbrand', 'Kevan Lannister', 'hijos', 'kevan-lannister';
  END IF;

  -- Jeyne Marbrand -> Genna Lannister (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'genna-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'jeyne-marbrand' AND c2.slug = 'genna-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Jeyne Marbrand', 'Genna Lannister', 'hijos', 'genna-lannister';
  END IF;

  -- Jeyne Marbrand -> Tygett Lannister (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tygett-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'jeyne-marbrand' AND c2.slug = 'tygett-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Jeyne Marbrand', 'Tygett Lannister', 'hijos', 'tygett-lannister';
  END IF;

  -- Jeyne Marbrand -> Gerion Lannister (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'gerion-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'jeyne-marbrand' AND c2.slug = 'gerion-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Jeyne Marbrand', 'Gerion Lannister', 'hijos', 'gerion-lannister';
  END IF;

  -- Tysha -> Tyrion Lannister (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tyrion-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tysha' AND c2.slug = 'tyrion-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tysha', 'Tyrion Lannister', 'conyuges', 'tyrion-lannister';
  END IF;

  -- Steffon Baratheon -> Cassana Estermont (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'cassana-estermont';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'steffon-baratheon' AND c2.slug = 'cassana-estermont'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Steffon Baratheon', 'Cassana Estermont', 'conyuges', 'cassana-estermont';
  END IF;

  -- Steffon Baratheon -> Robert Baratheon (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'robert-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'steffon-baratheon' AND c2.slug = 'robert-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Steffon Baratheon', 'Robert Baratheon', 'hijos', 'robert-baratheon';
  END IF;

  -- Steffon Baratheon -> Stannis Baratheon (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'stannis-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'steffon-baratheon' AND c2.slug = 'stannis-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Steffon Baratheon', 'Stannis Baratheon', 'hijos', 'stannis-baratheon';
  END IF;

  -- Steffon Baratheon -> Renly Baratheon (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'renly-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'steffon-baratheon' AND c2.slug = 'renly-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Steffon Baratheon', 'Renly Baratheon', 'hijos', 'renly-baratheon';
  END IF;

  -- Cassana Estermont -> Steffon Baratheon (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'steffon-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'cassana-estermont' AND c2.slug = 'steffon-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Cassana Estermont', 'Steffon Baratheon', 'conyuges', 'steffon-baratheon';
  END IF;

  -- Cassana Estermont -> Robert Baratheon (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'robert-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'cassana-estermont' AND c2.slug = 'robert-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Cassana Estermont', 'Robert Baratheon', 'hijos', 'robert-baratheon';
  END IF;

  -- Cassana Estermont -> Stannis Baratheon (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'stannis-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'cassana-estermont' AND c2.slug = 'stannis-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Cassana Estermont', 'Stannis Baratheon', 'hijos', 'stannis-baratheon';
  END IF;

  -- Cassana Estermont -> Renly Baratheon (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'renly-baratheon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'cassana-estermont' AND c2.slug = 'renly-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Cassana Estermont', 'Renly Baratheon', 'hijos', 'renly-baratheon';
  END IF;

  -- Rhaella Targaryen -> Aerys II Targaryen (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'aerys-ii-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'rhaella-targaryen' AND c2.slug = 'aerys-ii-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Rhaella Targaryen', 'Aerys II Targaryen', 'conyuges', 'aerys-ii-targaryen';
  END IF;

  -- Rhaella Targaryen -> Rhaegar Targaryen (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'rhaegar-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'rhaella-targaryen' AND c2.slug = 'rhaegar-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Rhaella Targaryen', 'Rhaegar Targaryen', 'hijos', 'rhaegar-targaryen';
  END IF;

  -- Rhaella Targaryen -> Viserys Targaryen (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'viserys-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'rhaella-targaryen' AND c2.slug = 'viserys-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Rhaella Targaryen', 'Viserys Targaryen', 'hijos', 'viserys-targaryen';
  END IF;

  -- Rhaella Targaryen -> Daenerys Targaryen (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'daenerys-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'rhaella-targaryen' AND c2.slug = 'daenerys-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Rhaella Targaryen', 'Daenerys Targaryen', 'hijos', 'daenerys-targaryen';
  END IF;

  -- Rhaenys Targaryen -> Aegon Targaryen (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'aegon-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'rhaenys-targaryen' AND c2.slug = 'aegon-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Rhaenys Targaryen', 'Aegon Targaryen', 'padre', 'aegon-targaryen';
  END IF;

  -- Rhaenys Targaryen -> Aegon Targaryen (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'aegon-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'rhaenys-targaryen' AND c2.slug = 'aegon-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Rhaenys Targaryen', 'Aegon Targaryen', 'conyuges', 'aegon-targaryen';
  END IF;

  -- Rhaenys Targaryen -> Aenys I Targaryen (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'aenys-i-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'rhaenys-targaryen' AND c2.slug = 'aenys-i-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Rhaenys Targaryen', 'Aenys I Targaryen', 'hijos', 'aenys-i-targaryen';
  END IF;

  -- Rhaenys Targaryen -> Visenya Targaryen (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'visenya-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'rhaenys-targaryen' AND c2.slug = 'visenya-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Rhaenys Targaryen', 'Visenya Targaryen', 'hermanos', 'visenya-targaryen';
  END IF;

  -- Visenya Targaryen -> Aegon Targaryen (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'aegon-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'visenya-targaryen' AND c2.slug = 'aegon-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Visenya Targaryen', 'Aegon Targaryen', 'padre', 'aegon-targaryen';
  END IF;

  -- Visenya Targaryen -> Aegon Targaryen (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'aegon-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'visenya-targaryen' AND c2.slug = 'aegon-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Visenya Targaryen', 'Aegon Targaryen', 'conyuges', 'aegon-targaryen';
  END IF;

  -- Visenya Targaryen -> Maegor I Targaryen (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'maegor-i-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'visenya-targaryen' AND c2.slug = 'maegor-i-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Visenya Targaryen', 'Maegor I Targaryen', 'hijos', 'maegor-i-targaryen';
  END IF;

  -- Visenya Targaryen -> Rhaenys Targaryen (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'rhaenys-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'visenya-targaryen' AND c2.slug = 'rhaenys-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Visenya Targaryen', 'Rhaenys Targaryen', 'hermanos', 'rhaenys-targaryen';
  END IF;

  -- Jaehaerys II Targaryen -> Aerys II Targaryen (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'aerys-ii-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'jaehaerys-ii-targaryen' AND c2.slug = 'aerys-ii-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Jaehaerys II Targaryen', 'Aerys II Targaryen', 'hijos', 'aerys-ii-targaryen';
  END IF;

  -- Rhaego -> Khal Drogo (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'khal-drogo';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'rhaego' AND c2.slug = 'khal-drogo'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Rhaego', 'Khal Drogo', 'padre', 'khal-drogo';
  END IF;

  -- Rhaego -> Daenerys Targaryen (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'daenerys-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'rhaego' AND c2.slug = 'daenerys-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Rhaego', 'Daenerys Targaryen', 'madre', 'daenerys-targaryen';
  END IF;

  -- Rodrik Greyjoy -> Balon Greyjoy (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'balon-greyjoy';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'rodrik-greyjoy' AND c2.slug = 'balon-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Rodrik Greyjoy', 'Balon Greyjoy', 'padre', 'balon-greyjoy';
  END IF;

  -- Rodrik Greyjoy -> Theon Greyjoy (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'theon-greyjoy';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'rodrik-greyjoy' AND c2.slug = 'theon-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Rodrik Greyjoy', 'Theon Greyjoy', 'hermanos', 'theon-greyjoy';
  END IF;

  -- Rodrik Greyjoy -> Asha Greyjoy (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'asha-greyjoy';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'rodrik-greyjoy' AND c2.slug = 'asha-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Rodrik Greyjoy', 'Asha Greyjoy', 'hermanos', 'asha-greyjoy';
  END IF;

  -- Rodrik Greyjoy -> Maron Greyjoy (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'maron-greyjoy';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'rodrik-greyjoy' AND c2.slug = 'maron-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Rodrik Greyjoy', 'Maron Greyjoy', 'hermanos', 'maron-greyjoy';
  END IF;

  -- Maron Greyjoy -> Balon Greyjoy (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'balon-greyjoy';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'maron-greyjoy' AND c2.slug = 'balon-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Maron Greyjoy', 'Balon Greyjoy', 'padre', 'balon-greyjoy';
  END IF;

  -- Maron Greyjoy -> Theon Greyjoy (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'theon-greyjoy';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'maron-greyjoy' AND c2.slug = 'theon-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Maron Greyjoy', 'Theon Greyjoy', 'hermanos', 'theon-greyjoy';
  END IF;

  -- Maron Greyjoy -> Asha Greyjoy (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'asha-greyjoy';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'maron-greyjoy' AND c2.slug = 'asha-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Maron Greyjoy', 'Asha Greyjoy', 'hermanos', 'asha-greyjoy';
  END IF;

  -- Maron Greyjoy -> Rodrik Greyjoy (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'rodrik-greyjoy';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'maron-greyjoy' AND c2.slug = 'rodrik-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Maron Greyjoy', 'Rodrik Greyjoy', 'hermanos', 'rodrik-greyjoy';
  END IF;

  -- Alannys Harlaw -> Balon Greyjoy (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'balon-greyjoy';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'alannys-harlaw' AND c2.slug = 'balon-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Alannys Harlaw', 'Balon Greyjoy', 'conyuges', 'balon-greyjoy';
  END IF;

  -- Alannys Harlaw -> Theon Greyjoy (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'theon-greyjoy';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'alannys-harlaw' AND c2.slug = 'theon-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Alannys Harlaw', 'Theon Greyjoy', 'hijos', 'theon-greyjoy';
  END IF;

  -- Alannys Harlaw -> Asha Greyjoy (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'asha-greyjoy';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'alannys-harlaw' AND c2.slug = 'asha-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Alannys Harlaw', 'Asha Greyjoy', 'hijos', 'asha-greyjoy';
  END IF;

  -- Alannys Harlaw -> Rodrik Greyjoy (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'rodrik-greyjoy';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'alannys-harlaw' AND c2.slug = 'rodrik-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Alannys Harlaw', 'Rodrik Greyjoy', 'hijos', 'rodrik-greyjoy';
  END IF;

  -- Alannys Harlaw -> Maron Greyjoy (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'maron-greyjoy';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'alannys-harlaw' AND c2.slug = 'maron-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Alannys Harlaw', 'Maron Greyjoy', 'hijos', 'maron-greyjoy';
  END IF;

  -- Obara Sand -> Oberyn Martell (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'oberyn-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'obara-sand' AND c2.slug = 'oberyn-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Obara Sand', 'Oberyn Martell', 'padre', 'oberyn-martell';
  END IF;

  -- Obara Sand -> Nymeria Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'nymeria-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'obara-sand' AND c2.slug = 'nymeria-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Obara Sand', 'Nymeria Sand', 'hermanos', 'nymeria-sand';
  END IF;

  -- Obara Sand -> Tyene Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tyene-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'obara-sand' AND c2.slug = 'tyene-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Obara Sand', 'Tyene Sand', 'hermanos', 'tyene-sand';
  END IF;

  -- Obara Sand -> Sarella Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'sarella-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'obara-sand' AND c2.slug = 'sarella-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Obara Sand', 'Sarella Sand', 'hermanos', 'sarella-sand';
  END IF;

  -- Obara Sand -> Elia Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'elia-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'obara-sand' AND c2.slug = 'elia-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Obara Sand', 'Elia Sand', 'hermanos', 'elia-sand';
  END IF;

  -- Obara Sand -> Dorea Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'dorea-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'obara-sand' AND c2.slug = 'dorea-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Obara Sand', 'Dorea Sand', 'hermanos', 'dorea-sand';
  END IF;

  -- Obara Sand -> Loreza Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'loreza-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'obara-sand' AND c2.slug = 'loreza-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Obara Sand', 'Loreza Sand', 'hermanos', 'loreza-sand';
  END IF;

  -- Nymeria Sand -> Oberyn Martell (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'oberyn-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'nymeria-sand' AND c2.slug = 'oberyn-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Nymeria Sand', 'Oberyn Martell', 'padre', 'oberyn-martell';
  END IF;

  -- Nymeria Sand -> Obara Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'obara-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'nymeria-sand' AND c2.slug = 'obara-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Nymeria Sand', 'Obara Sand', 'hermanos', 'obara-sand';
  END IF;

  -- Nymeria Sand -> Tyene Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tyene-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'nymeria-sand' AND c2.slug = 'tyene-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Nymeria Sand', 'Tyene Sand', 'hermanos', 'tyene-sand';
  END IF;

  -- Nymeria Sand -> Sarella Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'sarella-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'nymeria-sand' AND c2.slug = 'sarella-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Nymeria Sand', 'Sarella Sand', 'hermanos', 'sarella-sand';
  END IF;

  -- Nymeria Sand -> Elia Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'elia-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'nymeria-sand' AND c2.slug = 'elia-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Nymeria Sand', 'Elia Sand', 'hermanos', 'elia-sand';
  END IF;

  -- Nymeria Sand -> Dorea Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'dorea-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'nymeria-sand' AND c2.slug = 'dorea-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Nymeria Sand', 'Dorea Sand', 'hermanos', 'dorea-sand';
  END IF;

  -- Nymeria Sand -> Loreza Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'loreza-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'nymeria-sand' AND c2.slug = 'loreza-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Nymeria Sand', 'Loreza Sand', 'hermanos', 'loreza-sand';
  END IF;

  -- Tyene Sand -> Oberyn Martell (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'oberyn-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tyene-sand' AND c2.slug = 'oberyn-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tyene Sand', 'Oberyn Martell', 'padre', 'oberyn-martell';
  END IF;

  -- Tyene Sand -> Obara Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'obara-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tyene-sand' AND c2.slug = 'obara-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tyene Sand', 'Obara Sand', 'hermanos', 'obara-sand';
  END IF;

  -- Tyene Sand -> Nymeria Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'nymeria-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tyene-sand' AND c2.slug = 'nymeria-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tyene Sand', 'Nymeria Sand', 'hermanos', 'nymeria-sand';
  END IF;

  -- Tyene Sand -> Sarella Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'sarella-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tyene-sand' AND c2.slug = 'sarella-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tyene Sand', 'Sarella Sand', 'hermanos', 'sarella-sand';
  END IF;

  -- Tyene Sand -> Elia Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'elia-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tyene-sand' AND c2.slug = 'elia-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tyene Sand', 'Elia Sand', 'hermanos', 'elia-sand';
  END IF;

  -- Tyene Sand -> Dorea Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'dorea-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tyene-sand' AND c2.slug = 'dorea-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tyene Sand', 'Dorea Sand', 'hermanos', 'dorea-sand';
  END IF;

  -- Tyene Sand -> Loreza Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'loreza-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tyene-sand' AND c2.slug = 'loreza-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tyene Sand', 'Loreza Sand', 'hermanos', 'loreza-sand';
  END IF;

  -- Sarella Sand -> Oberyn Martell (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'oberyn-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'sarella-sand' AND c2.slug = 'oberyn-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Sarella Sand', 'Oberyn Martell', 'padre', 'oberyn-martell';
  END IF;

  -- Sarella Sand -> Obara Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'obara-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'sarella-sand' AND c2.slug = 'obara-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Sarella Sand', 'Obara Sand', 'hermanos', 'obara-sand';
  END IF;

  -- Sarella Sand -> Nymeria Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'nymeria-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'sarella-sand' AND c2.slug = 'nymeria-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Sarella Sand', 'Nymeria Sand', 'hermanos', 'nymeria-sand';
  END IF;

  -- Sarella Sand -> Tyene Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tyene-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'sarella-sand' AND c2.slug = 'tyene-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Sarella Sand', 'Tyene Sand', 'hermanos', 'tyene-sand';
  END IF;

  -- Sarella Sand -> Elia Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'elia-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'sarella-sand' AND c2.slug = 'elia-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Sarella Sand', 'Elia Sand', 'hermanos', 'elia-sand';
  END IF;

  -- Sarella Sand -> Dorea Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'dorea-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'sarella-sand' AND c2.slug = 'dorea-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Sarella Sand', 'Dorea Sand', 'hermanos', 'dorea-sand';
  END IF;

  -- Sarella Sand -> Loreza Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'loreza-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'sarella-sand' AND c2.slug = 'loreza-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Sarella Sand', 'Loreza Sand', 'hermanos', 'loreza-sand';
  END IF;

  -- Elia Sand -> Oberyn Martell (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'oberyn-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'elia-sand' AND c2.slug = 'oberyn-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Elia Sand', 'Oberyn Martell', 'padre', 'oberyn-martell';
  END IF;

  -- Elia Sand -> Obara Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'obara-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'elia-sand' AND c2.slug = 'obara-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Elia Sand', 'Obara Sand', 'hermanos', 'obara-sand';
  END IF;

  -- Elia Sand -> Nymeria Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'nymeria-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'elia-sand' AND c2.slug = 'nymeria-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Elia Sand', 'Nymeria Sand', 'hermanos', 'nymeria-sand';
  END IF;

  -- Elia Sand -> Tyene Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tyene-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'elia-sand' AND c2.slug = 'tyene-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Elia Sand', 'Tyene Sand', 'hermanos', 'tyene-sand';
  END IF;

  -- Elia Sand -> Sarella Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'sarella-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'elia-sand' AND c2.slug = 'sarella-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Elia Sand', 'Sarella Sand', 'hermanos', 'sarella-sand';
  END IF;

  -- Elia Sand -> Dorea Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'dorea-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'elia-sand' AND c2.slug = 'dorea-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Elia Sand', 'Dorea Sand', 'hermanos', 'dorea-sand';
  END IF;

  -- Elia Sand -> Loreza Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'loreza-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'elia-sand' AND c2.slug = 'loreza-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Elia Sand', 'Loreza Sand', 'hermanos', 'loreza-sand';
  END IF;

  -- Dorea Sand -> Oberyn Martell (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'oberyn-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'dorea-sand' AND c2.slug = 'oberyn-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Dorea Sand', 'Oberyn Martell', 'padre', 'oberyn-martell';
  END IF;

  -- Dorea Sand -> Obara Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'obara-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'dorea-sand' AND c2.slug = 'obara-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Dorea Sand', 'Obara Sand', 'hermanos', 'obara-sand';
  END IF;

  -- Dorea Sand -> Nymeria Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'nymeria-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'dorea-sand' AND c2.slug = 'nymeria-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Dorea Sand', 'Nymeria Sand', 'hermanos', 'nymeria-sand';
  END IF;

  -- Dorea Sand -> Tyene Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tyene-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'dorea-sand' AND c2.slug = 'tyene-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Dorea Sand', 'Tyene Sand', 'hermanos', 'tyene-sand';
  END IF;

  -- Dorea Sand -> Sarella Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'sarella-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'dorea-sand' AND c2.slug = 'sarella-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Dorea Sand', 'Sarella Sand', 'hermanos', 'sarella-sand';
  END IF;

  -- Dorea Sand -> Elia Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'elia-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'dorea-sand' AND c2.slug = 'elia-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Dorea Sand', 'Elia Sand', 'hermanos', 'elia-sand';
  END IF;

  -- Dorea Sand -> Loreza Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'loreza-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'dorea-sand' AND c2.slug = 'loreza-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Dorea Sand', 'Loreza Sand', 'hermanos', 'loreza-sand';
  END IF;

  -- Loreza Sand -> Oberyn Martell (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'oberyn-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'loreza-sand' AND c2.slug = 'oberyn-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Loreza Sand', 'Oberyn Martell', 'padre', 'oberyn-martell';
  END IF;

  -- Loreza Sand -> Obara Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'obara-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'loreza-sand' AND c2.slug = 'obara-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Loreza Sand', 'Obara Sand', 'hermanos', 'obara-sand';
  END IF;

  -- Loreza Sand -> Nymeria Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'nymeria-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'loreza-sand' AND c2.slug = 'nymeria-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Loreza Sand', 'Nymeria Sand', 'hermanos', 'nymeria-sand';
  END IF;

  -- Loreza Sand -> Tyene Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tyene-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'loreza-sand' AND c2.slug = 'tyene-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Loreza Sand', 'Tyene Sand', 'hermanos', 'tyene-sand';
  END IF;

  -- Loreza Sand -> Sarella Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'sarella-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'loreza-sand' AND c2.slug = 'sarella-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Loreza Sand', 'Sarella Sand', 'hermanos', 'sarella-sand';
  END IF;

  -- Loreza Sand -> Elia Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'elia-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'loreza-sand' AND c2.slug = 'elia-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Loreza Sand', 'Elia Sand', 'hermanos', 'elia-sand';
  END IF;

  -- Loreza Sand -> Dorea Sand (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'dorea-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'loreza-sand' AND c2.slug = 'dorea-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Loreza Sand', 'Dorea Sand', 'hermanos', 'dorea-sand';
  END IF;

  -- Ellaria Sand -> Oberyn Martell (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'oberyn-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'ellaria-sand' AND c2.slug = 'oberyn-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Ellaria Sand', 'Oberyn Martell', 'conyuges', 'oberyn-martell';
  END IF;

  -- Ellaria Sand -> Elia Sand (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'elia-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'ellaria-sand' AND c2.slug = 'elia-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Ellaria Sand', 'Elia Sand', 'hijos', 'elia-sand';
  END IF;

  -- Ellaria Sand -> Dorea Sand (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'dorea-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'ellaria-sand' AND c2.slug = 'dorea-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Ellaria Sand', 'Dorea Sand', 'hijos', 'dorea-sand';
  END IF;

  -- Ellaria Sand -> Loreza Sand (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'loreza-sand';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'ellaria-sand' AND c2.slug = 'loreza-sand'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Ellaria Sand', 'Loreza Sand', 'hijos', 'loreza-sand';
  END IF;

  -- Meria Martell -> Doran Martell (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'doran-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'meria-martell' AND c2.slug = 'doran-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Meria Martell', 'Doran Martell', 'conyuges', 'doran-martell';
  END IF;

  -- Meria Martell -> Arianne Martell (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'arianne-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'meria-martell' AND c2.slug = 'arianne-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Meria Martell', 'Arianne Martell', 'hijos', 'arianne-martell';
  END IF;

  -- Meria Martell -> Quentyn Martell (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'quentyn-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'meria-martell' AND c2.slug = 'quentyn-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Meria Martell', 'Quentyn Martell', 'hijos', 'quentyn-martell';
  END IF;

  -- Meria Martell -> Trystane Martell (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'trystane-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'meria-martell' AND c2.slug = 'trystane-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Meria Martell', 'Trystane Martell', 'hijos', 'trystane-martell';
  END IF;

  -- Lewyn Martell -> Oberyn Martell (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'oberyn-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'lewyn-martell' AND c2.slug = 'oberyn-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Lewyn Martell', 'Oberyn Martell', 'hermanos', 'oberyn-martell';
  END IF;

  -- Lewyn Martell -> Doran Martell (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'doran-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'lewyn-martell' AND c2.slug = 'doran-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Lewyn Martell', 'Doran Martell', 'hermanos', 'doran-martell';
  END IF;

  -- Lewyn Martell -> Elia Martell (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'elia-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'lewyn-martell' AND c2.slug = 'elia-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Lewyn Martell', 'Elia Martell', 'hermanos', 'elia-martell';
  END IF;

  -- Jeor Mormont -> Jorah Mormont (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'jorah-mormont';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'jeor-mormont' AND c2.slug = 'jorah-mormont'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Jeor Mormont', 'Jorah Mormont', 'hijos', 'jorah-mormont';
  END IF;

  -- Alys Karstark -> Rickard Karstark (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'rickard-karstark';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'alys-karstark' AND c2.slug = 'rickard-karstark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Alys Karstark', 'Rickard Karstark', 'padre', 'rickard-karstark';
  END IF;

  -- Selwyn Tarth -> Brienne de Tarth (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'brienne-de-tarth';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'selwyn-tarth' AND c2.slug = 'brienne-de-tarth'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Selwyn Tarth', 'Brienne de Tarth', 'hijos', 'brienne-de-tarth';
  END IF;

  -- Jon Arryn -> Lysa Arryn (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'lysa-arryn';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'jon-arryn' AND c2.slug = 'lysa-arryn'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Jon Arryn', 'Lysa Arryn', 'conyuges', 'lysa-arryn';
  END IF;

  -- Jon Arryn -> Robert Arryn (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'robert-arryn';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'jon-arryn' AND c2.slug = 'robert-arryn'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Jon Arryn', 'Robert Arryn', 'hijos', 'robert-arryn';
  END IF;

  -- Alerie Hightower -> Mace Tyrell (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'mace-tyrell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'alerie-hightower' AND c2.slug = 'mace-tyrell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Alerie Hightower', 'Mace Tyrell', 'conyuges', 'mace-tyrell';
  END IF;

  -- Alerie Hightower -> Willas Tyrell (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'willas-tyrell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'alerie-hightower' AND c2.slug = 'willas-tyrell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Alerie Hightower', 'Willas Tyrell', 'hijos', 'willas-tyrell';
  END IF;

  -- Alerie Hightower -> Garlan Tyrell (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'garlan-tyrell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'alerie-hightower' AND c2.slug = 'garlan-tyrell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Alerie Hightower', 'Garlan Tyrell', 'hijos', 'garlan-tyrell';
  END IF;

  -- Alerie Hightower -> Loras Tyrell (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'loras-tyrell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'alerie-hightower' AND c2.slug = 'loras-tyrell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Alerie Hightower', 'Loras Tyrell', 'hijos', 'loras-tyrell';
  END IF;

  -- Alerie Hightower -> Margaery Tyrell (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'margaery-tyrell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'alerie-hightower' AND c2.slug = 'margaery-tyrell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Alerie Hightower', 'Margaery Tyrell', 'hijos', 'margaery-tyrell';
  END IF;

  -- Luthor Tyrell -> Olenna Tyrell (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'olenna-tyrell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'luthor-tyrell' AND c2.slug = 'olenna-tyrell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Luthor Tyrell', 'Olenna Tyrell', 'conyuges', 'olenna-tyrell';
  END IF;

  -- Luthor Tyrell -> Mace Tyrell (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'mace-tyrell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'luthor-tyrell' AND c2.slug = 'mace-tyrell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Luthor Tyrell', 'Mace Tyrell', 'hijos', 'mace-tyrell';
  END IF;

  -- Bethany Ryswell -> Roose Bolton (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'roose-bolton';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'bethany-ryswell' AND c2.slug = 'roose-bolton'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Bethany Ryswell', 'Roose Bolton', 'conyuges', 'roose-bolton';
  END IF;

  -- Walda Frey -> Walder Frey (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'walder-frey';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'walda-frey' AND c2.slug = 'walder-frey'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Walda Frey', 'Walder Frey', 'padre', 'walder-frey';
  END IF;

  -- Walda Frey -> Roose Bolton (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'roose-bolton';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'walda-frey' AND c2.slug = 'roose-bolton'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Walda Frey', 'Roose Bolton', 'conyuges', 'roose-bolton';
  END IF;

  -- Jyana Reed -> Howland Reed (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'howland-reed';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'jyana-reed' AND c2.slug = 'howland-reed'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Jyana Reed', 'Howland Reed', 'conyuges', 'howland-reed';
  END IF;

  -- Jyana Reed -> Jojen Reed (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'jojen-reed';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'jyana-reed' AND c2.slug = 'jojen-reed'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Jyana Reed', 'Jojen Reed', 'hijos', 'jojen-reed';
  END IF;

  -- Jyana Reed -> Meera Reed (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'meera-reed';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'jyana-reed' AND c2.slug = 'meera-reed'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Jyana Reed', 'Meera Reed', 'hijos', 'meera-reed';
  END IF;

  -- Marya Seaworth -> Davos Seaworth (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'davos-seaworth';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'marya-seaworth' AND c2.slug = 'davos-seaworth'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Marya Seaworth', 'Davos Seaworth', 'conyuges', 'davos-seaworth';
  END IF;

  -- Tormenta -> Tormund Gigante (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tormund-gigante';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tormenta' AND c2.slug = 'tormund-gigante'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tormenta', 'Tormund Gigante', 'padre', 'tormund-gigante';
  END IF;

  -- Tormenta -> Dalla (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'dalla';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tormenta' AND c2.slug = 'dalla'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tormenta', 'Dalla', 'madre', 'dalla';
  END IF;

  -- Tyrek Lannister -> Tygett Lannister (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'tygett-lannister';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'tyrek-lannister' AND c2.slug = 'tygett-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Tyrek Lannister', 'Tygett Lannister', 'padre', 'tygett-lannister';
  END IF;

  -- Volaris -> Euron Greyjoy (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'euron-greyjoy';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'volaris' AND c2.slug = 'euron-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Volaris', 'Euron Greyjoy', 'conyuges', 'euron-greyjoy';
  END IF;

  -- Marna Vance -> Walder Frey (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'walder-frey';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'marna-vance' AND c2.slug = 'walder-frey'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Marna Vance', 'Walder Frey', 'conyuges', 'walder-frey';
  END IF;

  -- Bethany Rosby -> Walder Frey (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'walder-frey';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'bethany-rosby' AND c2.slug = 'walder-frey'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Bethany Rosby', 'Walder Frey', 'conyuges', 'walder-frey';
  END IF;

  -- Shiera Crakehall -> Walder Frey (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'walder-frey';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'shiera-crakehall' AND c2.slug = 'walder-frey'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Shiera Crakehall', 'Walder Frey', 'conyuges', 'walder-frey';
  END IF;

  -- Annara Farring -> Walder Frey (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'walder-frey';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'annara-farring' AND c2.slug = 'walder-frey'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Annara Farring', 'Walder Frey', 'conyuges', 'walder-frey';
  END IF;

  -- Joyeuse Erenford -> Walder Frey (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'walder-frey';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'joyeuse-erenford' AND c2.slug = 'walder-frey'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Joyeuse Erenford', 'Walder Frey', 'conyuges', 'walder-frey';
  END IF;

  -- Daenys la Soñadora -> Aenar Targaryen (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'aenar-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'daenys-la-sonadora' AND c2.slug = 'aenar-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Daenys la Soñadora', 'Aenar Targaryen', 'padre', 'aenar-targaryen';
  END IF;

  -- Gaemon Targaryen -> Daenys la Soñadora (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'daenys-la-sonadora';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'gaemon-targaryen' AND c2.slug = 'daenys-la-sonadora'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Gaemon Targaryen', 'Daenys la Soñadora', 'conyuges', 'daenys-la-sonadora';
  END IF;

  -- Aerion Targaryen -> Aegon Targaryen (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'aegon-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'aerion-targaryen' AND c2.slug = 'aegon-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Aerion Targaryen', 'Aegon Targaryen', 'hijos', 'aegon-targaryen';
  END IF;

  -- Gendel -> Gorne (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'gorne';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'gendel' AND c2.slug = 'gorne'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Gendel', 'Gorne', 'hermanos', 'gorne';
  END IF;

  -- Gorne -> Gendel (hermano)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'gendel';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hermano'
    FROM characters c1, characters c2
    WHERE c1.slug = 'gorne' AND c2.slug = 'gendel'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Gorne', 'Gendel', 'hermanos', 'gendel';
  END IF;

  -- Nymeria de los Rhoynar -> Mors Martell (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'mors-martell';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'nymeria-de-los-rhoynar' AND c2.slug = 'mors-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Nymeria de los Rhoynar', 'Mors Martell', 'conyuges', 'mors-martell';
  END IF;

  -- Mors Martell -> Nymeria de los Rhoynar (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'nymeria-de-los-rhoynar';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'mors-martell' AND c2.slug = 'nymeria-de-los-rhoynar'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Mors Martell', 'Nymeria de los Rhoynar', 'conyuges', 'nymeria-de-los-rhoynar';
  END IF;

  -- Alicent Hightower -> Otto Hightower (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'otto-hightower';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'alicent-hightower' AND c2.slug = 'otto-hightower'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Alicent Hightower', 'Otto Hightower', 'padre', 'otto-hightower';
  END IF;

  -- Alicent Hightower -> Viserys I Targaryen (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'viserys-i-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'alicent-hightower' AND c2.slug = 'viserys-i-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Alicent Hightower', 'Viserys I Targaryen', 'conyuges', 'viserys-i-targaryen';
  END IF;

  -- Alicent Hightower -> Aegon II Targaryen (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'aegon-ii-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'alicent-hightower' AND c2.slug = 'aegon-ii-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Alicent Hightower', 'Aegon II Targaryen', 'hijos', 'aegon-ii-targaryen';
  END IF;

  -- Alicent Hightower -> Helaena Targaryen (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'helaena-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'alicent-hightower' AND c2.slug = 'helaena-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Alicent Hightower', 'Helaena Targaryen', 'hijos', 'helaena-targaryen';
  END IF;

  -- Daemon Targaryen -> Rhaenyra Targaryen (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'rhaenyra-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'daemon-targaryen' AND c2.slug = 'rhaenyra-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Daemon Targaryen', 'Rhaenyra Targaryen', 'conyuges', 'rhaenyra-targaryen';
  END IF;

  -- Aemond Targaryen -> Viserys I Targaryen (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'viserys-i-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'aemond-targaryen' AND c2.slug = 'viserys-i-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Aemond Targaryen', 'Viserys I Targaryen', 'padre', 'viserys-i-targaryen';
  END IF;

  -- Aemond Targaryen -> Alicent Hightower (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'alicent-hightower';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'aemond-targaryen' AND c2.slug = 'alicent-hightower'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Aemond Targaryen', 'Alicent Hightower', 'madre', 'alicent-hightower';
  END IF;

  -- Helaena Targaryen -> Viserys I Targaryen (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'viserys-i-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'helaena-targaryen' AND c2.slug = 'viserys-i-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Helaena Targaryen', 'Viserys I Targaryen', 'padre', 'viserys-i-targaryen';
  END IF;

  -- Helaena Targaryen -> Alicent Hightower (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'alicent-hightower';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'helaena-targaryen' AND c2.slug = 'alicent-hightower'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Helaena Targaryen', 'Alicent Hightower', 'madre', 'alicent-hightower';
  END IF;

  -- Baela Targaryen -> Daemon Targaryen (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'daemon-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'baela-targaryen' AND c2.slug = 'daemon-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Baela Targaryen', 'Daemon Targaryen', 'padre', 'daemon-targaryen';
  END IF;

  -- Corlys Velaryon -> Rhaenys Targaryen (conyuge)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'rhaenys-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'conyuge'
    FROM characters c1, characters c2
    WHERE c1.slug = 'corlys-velaryon' AND c2.slug = 'rhaenys-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Corlys Velaryon', 'Rhaenys Targaryen', 'conyuges', 'rhaenys-targaryen';
  END IF;

  -- Daeron Targaryen -> Viserys I Targaryen (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'viserys-i-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'daeron-targaryen' AND c2.slug = 'viserys-i-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Daeron Targaryen', 'Viserys I Targaryen', 'padre', 'viserys-i-targaryen';
  END IF;

  -- Daeron Targaryen -> Alicent Hightower (madre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'alicent-hightower';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'madre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'daeron-targaryen' AND c2.slug = 'alicent-hightower'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Daeron Targaryen', 'Alicent Hightower', 'madre', 'alicent-hightower';
  END IF;

  -- Addam Velaryon -> Corlys Velaryon (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'corlys-velaryon';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'addam-velaryon' AND c2.slug = 'corlys-velaryon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Addam Velaryon', 'Corlys Velaryon', 'padre', 'corlys-velaryon';
  END IF;

  -- Daena Targaryen -> Daeron II Targaryen (padre)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'daeron-ii-targaryen';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'padre'
    FROM characters c1, characters c2
    WHERE c1.slug = 'daena-targaryen' AND c2.slug = 'daeron-ii-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Daena Targaryen', 'Daeron II Targaryen', 'padre', 'daeron-ii-targaryen';
  END IF;

  -- Daena Targaryen -> Daemon Blackfyre (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'daemon-blackfyre';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'daena-targaryen' AND c2.slug = 'daemon-blackfyre'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Daena Targaryen', 'Daemon Blackfyre', 'hijos', 'daemon-blackfyre';
  END IF;

  -- Otto Hightower -> Alicent Hightower (hijo)
  SELECT slug INTO related_slug FROM characters WHERE slug = 'alicent-hightower';
  IF FOUND THEN
    INSERT INTO character_relations (character_id, related_character_id, relation_type)
    SELECT c1.id, c2.id, 'hijo'
    FROM characters c1, characters c2
    WHERE c1.slug = 'otto-hightower' AND c2.slug = 'alicent-hightower'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Unresolved: % mentions % (% = %)', 'Otto Hightower', 'Alicent Hightower', 'hijos', 'alicent-hightower';
  END IF;

END $$;

-- ============================================================
-- LOCATIONS (91)
-- ============================================================

INSERT INTO locations (name, slug, region, description)
VALUES ('Invernalia', 'invernalia', 'El Norte', 'La fortaleza ancestral de los Stark, tallada en la roca viva bajo el cielo de un bosque de pinos centenarios. Sus criptas guardan los secretos de siglos.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Desembarco del Rey', 'desembarco-del-rey', 'Las Tierras de la Corona', 'La capital de los Siete Reinos, sede del Trono de Hierro y del poder absoluto. Una ciudad de contrastes donde la riqueza y la miseria conviven bajo los muros de la Fortaleza Roja.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Harrenhal', 'harrenhal', 'Las Tierras de los Ríos', 'El castillo más grande de Poniente, construido por Harren el Rey Negro y destruido por los dragones de Aegon. Maldito según la leyenda, cambia de dueño con frecuencia.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Roca Casterly', 'roca-casterly', 'Tierras del Oeste', 'La sede de los Lannister, tallada en una montaña de oro y piedra que domina todo el oeste. Su riqueza mineral ha financiado imperios y guerras.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Altojardín', 'altojardin', 'Las Tierras del Dominio', 'La sede de los Tyrell, un castillo rodeado de jardines y campos fértiles que abastecen a medio Poniente. Su belleza oculta una política implacable.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Bastión de Tormentas', 'bastion-de-tormentas', 'Las Tierras de la Tormenta', 'La sede de los Baratheon, un castillo invulnerable situado en una roca que cae al mar. Su posesión ha sido disputada durante siglos.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Nido de Águilas', 'nido-de-aguilas', 'El Valle de Arryn', 'La fortaleza de los Arryn, situada en la cima de una montaña inaccesible. Nunca ha sido tomada por la fuerza.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Pyke', 'pyke', 'Islas de Hierro', 'La sede de los Greyjoy, un castillo de torres delgadas conectadas por puentes que se elevan sobre el mar. Su diseño refleja la mentalidad de sus habitantes.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Riverrun', 'riverrun', 'Las Tierras de los Ríos', 'La sede de los Tully, un castillo estratégicamente situado en la confluencia de dos ríos. Su posición ha sido clave en múltiples guerras.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Los Gemelos', 'los-gemelos', 'Las Tierras de los Ríos', 'La fortaleza de los Frey, construida sobre dos colinas unidas por puentes. Su posición estratégica les dio poder durante siglos.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Puerto Blanco', 'puerto-blanco', 'El Norte', 'El puerto más importante del Norte, gobernado por los Manderly. Una ciudad próspera que conecta al Norte con el resto de Poniente.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('El Último Aposento', 'el-ultimo-aposento', 'El Norte', 'La sede de los Umber, un castillo fronterizo que protege el norte de las incursiones salvajes.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Karhold', 'karhold', 'El Norte', 'La sede de los Karstark, un castillo frío y austero en el extremo norte del Norte.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('La Fortaleza Púrpura', 'la-fortaleza-purpura', 'El Norte', 'La sede de los Bolton, un castillo conocido por su historia de crueldad y tortura.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Fuerte Terror', 'fuerte-terror', 'La Isla del Oso', 'La sede de los Mormont, un castillo modesto pero fuerte en una isla remota.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Bosquespeso', 'bosquespeso', 'El Norte', 'La sede de los Glover, un castillo rodeado de bosques densos.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('La Torre de la Alegría', 'la-torre-de-la-alegria', 'El Norte', 'Una torre remota donde murió Lyanna Stark y nació Jon Nieve.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('El Muro', 'el-muro', 'El Norte', 'Una muralla de hielo de 200 metros de altura que separa los Siete Reinos del salvaje norte. Custodiada por la Guardia de la Noche.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Castillo Negro', 'castillo-negro', 'El Muro', 'La sede de la Guardia de la Noche, un castillo de piedra negra al pie del Muro.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Eastwatch', 'eastwatch', 'El Muro', 'El castillo más oriental de la Guardia de la Noche, situado en la costa.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Moat Cailin', 'moat-cailin', 'El Norte', 'Una fortaleza estratégica que controla el acceso al Norte desde el sur. Sus ruinas son testigos de mil batallas.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('La Fortaleza Roja', 'la-fortaleza-roja', 'Las Tierras de la Corona', 'La residencia real en Desembarco del Rey, hogar del Trono de Hierro.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Torreón de Maegor', 'torreon-de-maegor', 'Las Tierras de la Corona', 'La torre privada del rey dentro de la Fortaleza Roja, construida por Maegor el Cruel.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Braavos', 'braavos', 'Ciudades Libres', 'La más poderosa de las Ciudades Libres, fundada por refugiados valyrios. Su Banco de Hierro controla las finanzas de medio mundo.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Pentos', 'pentos', 'Ciudades Libres', 'Una ciudad próspera gobernada por magísteres que comercian con todo el mundo. Daenerys pasó su infancia exiliada aquí.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Astapor', 'astapor', 'Ciudades Libres', 'La ciudad de los Inmaculados, guerreros eunucos entrenados desde la infancia. Daenerys los compró y liberó.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Yunkai', 'yunkai', 'Ciudades Libres', 'Una ciudad amarilla que traficaba con esclavos. Daenerys la liberó.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Meereen', 'meereen', 'Ciudades Libres', 'La mayor de las ciudades de esclavos, con pirámides que se alzan como dedos de piedra. Daenerys la conquistó y trató de gobernar.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Volantis', 'volantis', 'Ciudades Libres', 'Una ciudad antigua dividida en dos por el río Rhoyne. Sus sacerdotes rojos adoran al Señor de la Luz.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Myr', 'myr', 'Ciudades Libres', 'Famosa por sus lentes y sus artesanos, Myr es una ciudad de comercio y espionaje.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Tyrosh', 'tyrosh', 'Ciudades Libres', 'Una ciudad de piratas y mercenarios situada en la boca del Estrecho de Bruja.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Lys', 'lys', 'Ciudades Libres', 'Una isla de placeres y perfumes cuyas casas de placeres son famosas en todo el mundo.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Norvos', 'norvos', 'Ciudades Libres', 'Una ciudad interior gobernada por sacerdotes que adoran al Gran Hombre.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Qohor', 'qohor', 'Ciudades Libres', 'La ciudad del dios oscuro, famosa por sus herrerías y el trabajo de metales preciosos.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Asshai', 'asshai', 'La Sombra', 'Una ciudad mágica situada en el extremo oriental del mundo. Melisandre proviene de aquí.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Vaes Dothrak', 'vaes-dothrak', 'Las Llanuras de la Sombra', 'La única ciudad de los dothraki, un lugar sagrado donde los khalasars se reúnen.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Antigua', 'antigua', 'Westeros', 'Una ciudad portuaria en la costa occidental de Poniente.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Los Dedos', 'los-dedos', 'Las Tierras de los Ríos', 'Una península empobrecida donde Petyr Baelish creció.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('La Isla del Oso', 'la-isla-del-oso', 'El Norte', 'Una isla remota del Norte, hogar de los Mormont.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Saltpans', 'saltpans', 'Las Tierras de los Ríos', 'Un puerto en las Tierras de los Ríos.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Fairmarket', 'fairmarket', 'Las Tierras de los Ríos', 'Un mercado justo en las Tierras de los Ríos.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Pinkmaiden', 'pinkmaiden', 'Las Tierras de los Ríos', 'Una fortaleza en las Tierras de los Ríos.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Seagard', 'seagard', 'Las Tierras de los Ríos', 'Un puerto fortificado en las Tierras de los Ríos.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Stone Hedge', 'stone-hedge', 'Las Tierras de los Ríos', 'La sede de los Bracken.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Raventree Hall', 'raventree-hall', 'Las Tierras de los Ríos', 'La sede de los Blackwood.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Darry', 'darry', 'Las Tierras de los Ríos', 'Una fortaleza en las Tierras de los Ríos.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Stoney Sept', 'stoney-sept', 'Las Tierras de los Ríos', 'Una ciudad en las Tierras de los Ríos.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Bitterbridge', 'bitterbridge', 'Las Tierras del Dominio', 'Un puente estratégico en las Tierras del Dominio.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Ashford', 'ashford', 'Las Tierras del Dominio', 'Una ciudad en las Tierras del Dominio.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Cuernos de Canaval', 'cuernos-de-canaval', 'Las Tierras del Dominio', 'La sede de los Tarly.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('La Isla de las Uvas', 'la-isla-de-las-uvas', 'Las Tierras del Dominio', 'La sede de los Redwyne, famosa por sus viñedos.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Castillo Fuerte', 'castillo-fuerte', 'Las Tierras del Dominio', 'La sede de los Florent.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('La Torre Blanca', 'la-torre-blanca', 'Las Tierras del Dominio', 'La sede de los Hightower en Antigua.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('La Torre Morena', 'la-torre-morena', 'Las Tierras de la Tormenta', 'La sede de los Dondarrion.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Marfil del Mar', 'marfil-del-mar', 'Las Tierras de la Corona', 'La sede de los Velaryon.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('La Piedra Colgada', 'la-piedra-colgada', 'Las Tierras de la Tormenta', 'La sede de los Swann.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Jardín Dorado', 'jardin-dorado', 'Las Tierras del Dominio', 'La sede de los Rowan.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Castillo de los Tres Picos', 'castillo-de-los-tres-picos', 'Las Tierras del Dominio', 'La sede de los Peake.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('La Granja de la Desolación', 'la-granja-de-la-desolacion', 'Las Tierras del Dominio', 'La sede de los Selmy.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Playa de la Claw', 'playa-de-la-claw', 'Las Tierras de la Corona', 'La sede de los Celtigar.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Sunspear', 'sunspear', 'Dorne', 'La capital de Dorne, una ciudad de palacios y jardines.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Las Islas del Verano', 'las-islas-del-verano', 'El Mar Angosto', 'Un archipiélago tropical en el Mar Angosto.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Ibben', 'ibben', 'El Mar Angosto', 'Una isla del norte del Mar Angosto, hogar de hombres velludos.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('El Estrecho de Bruja', 'el-estrecho-de-bruja', 'El Mar Angosto', 'El estrecho que separa Poniente de Essos.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Mar Angosto', 'mar-angosto', 'El Mar Angosto', 'El mar que separa Poniente de Essos.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Mar de Jade', 'mar-de-jade', 'El Mar de Jade', 'Un mar lejano al este de Essos.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('La Sombra', 'la-sombra', 'Essos', 'Una región mítica al este de Asshai.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Valyria', 'valyria', 'Essos', 'La antigua civilización de dragones y magia que fue destruida en la Perdición. Sus ruinas siguen siendo peligrosas.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('La Forge del Dragón', 'la-forge-del-dragon', 'Rocadragón', 'La fortaleza donde los Targaryen forjaron sus armas de dragón.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Starfall', 'starfall', 'Dorne', 'La sede de los Dayne, famosa por la espada La Estrella de la Mañana.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Yronwood', 'yronwood', 'Dorne', 'La sede de los Yronwood, rivales de los Martell.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Skyreach', 'skyreach', 'Dorne', 'La sede de los Fowler, que guardan los pasos montañosos.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Ghost Hill', 'ghost-hill', 'Dorne', 'La sede de los Toland, cuyo nombre es sugestivo.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Runestone', 'runestone', 'El Valle', 'La sede de los Royce, una de las casas más antiguas del Valle.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Stone Hedge', 'stone-hedge', 'Las Tierras de los Ríos', 'La sede de los Bracken, rivales de los Blackwood.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Raventree Hall', 'raventree-hall', 'Las Tierras de los Ríos', 'La sede de los Blackwood, que mantienen la fe del Bosque.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('La Granja de los Harlaw', 'la-granja-de-los-harlaw', 'Islas de Hierro', 'La sede de los Harlaw, los más cultos de las Islas de Hierro.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Viejo Wyk', 'viejo-wyk', 'Islas de Hierro', 'Una isla sagrada de los Greyjoy.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Gran Wyk', 'gran-wyk', 'Islas de Hierro', 'Una de las principales islas de los Greyjoy.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Antiguo Ghis', 'antiguo-ghis', 'Essos', 'La primera gran civilización del mundo conocido, basada en la trata de esclavos. Fundada por Grazdan el Grande, creó las primeras legiones disciplinadas antes de ser destruida por los dragones valyrios.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Oros', 'oros', 'Essos', 'Una ciudad valyria en las afueras de la península, ahora inhabitada y cursed por la Maldición de Valyria.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Tyria', 'tyria', 'Essos', 'Una antigua ciudad valyria cuyos restos permanecen en las ruinas de la península maldita.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Mantarys', 'mantarys', 'Essos', 'Una ciudad en el camino del Demonio donde, según se dice, los hombres nacen retorcidos y monstruosos.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Tolos', 'tolos', 'Essos', 'Una ciudad conocida por tener las mejores hondas del mundo, situada en la bahía de los Esclavos.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Elyria', 'elyria', 'Essos', 'Una ciudad insular en la bahía de los Esclavos que estableció lazos con las ciudades ghiscarias.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Rhoynar', 'rhoynar', 'Essos', 'Las tierras a lo largo del río Rhoyne, hogar de una civilización avanzada que fue destruida por la expansión valyria. Los supervivientes huyeron con Nymeria a Dorne.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Chroyane', 'chroyane', 'Essos', 'La Ciudad Festiva del río Rhoyne, destruida durante la Larga Noche cuando las aguas se congelaron.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Andalia', 'andalia', 'Essos', 'El antiguo reino de los ándalos en las tierras del Hacha, desde donde partieron para conquistar Poniente.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Isla del Ojo de Dioses', 'isla-del-ojo-de-dioses', 'Westeros', 'Una isla sagrada donde los primeros hombres y los hijos del bosque sellaron el Pacto que puso fin a la Era del Amanecer.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Nuevo Ghis', 'nuevo-ghis', 'Essos', 'Una ciudad ghiscaria pujante pero pequeña que aspira a ser el Antiguo Ghis renacido, con legiones de hierro formadas por hombres libres.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

INSERT INTO locations (name, slug, region, description)
VALUES ('Sarnor', 'sarnor', 'Essos', 'Una confederación de ciudades que sobrevivió a la expansión valyria gracias a su enorme llanura, pero cayó ante los dothrakis tras la Maldición.')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, region = EXCLUDED.region, description = EXCLUDED.description;

-- ============================================================
-- EVENTS (50)
-- ============================================================

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La Perdición de Valyria',
  'la-perdicion-de-valyria',
  'Desconocido',
  (SELECT id FROM locations WHERE slug = 'valyria'),
  'La destrucción de la antigua Valyria, una civilización de dragones y magia. El evento dejó cicatrices en todo el mundo conocido y forzó la huida de los Targaryen.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La Conquista de los Siete Reinos',
  'la-conquista-de-los-siete-reinos',
  '0 AC',
  (SELECT id FROM locations WHERE slug = 'desembarco-del-rey'),
  'Aegon Targaryen y sus dragones unificaron seis reinos bajo una sola corona. La Conquista alteró el calendario político de Poniente y estableció la dinastía que gobernaría durante siglos.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'El Campo de Fuego',
  'el-campo-de-fuego',
  '1 AC',
  NULL,
  'La batalla donde los dragones de Aegon destruyeron los ejércitos de los Reyes de la Roca y de la Tormenta. Fue el fin de la resistencia a la Conquista.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La Conquista de Dorne',
  'la-conquista-de-dorne',
  '1-13 AC',
  (SELECT id FROM locations WHERE slug = 'sunspear'),
  'Dorne fue la única región que resistió la conquista Targaryen mediante guerrilla. Finalmente se unió por matrimonio.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La Guerra de los Nuevepeniques',
  'la-guerra-de-los-nuevepeniques',
  '36-42 AC',
  (SELECT id FROM locations WHERE slug = 'desembarco-del-rey'),
  'Maegor luchó contra los Señores de los Nuevepeniques que se rebelaron contra el dominio Targaryen. La guerra fue brutal y costosa.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La Danza de los Dragones',
  'la-danza-de-los-dragones',
  '129-131 AC',
  (SELECT id FROM locations WHERE slug = 'desembarco-del-rey'),
  'La guerra civil que destruyó la dinastía Targaryen. Dos bandos de la misma familia se enfrentaron por el trono con dragones.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La Rebelión Blackfyre',
  'la-rebelion-blackfyre',
  '196-260 AC',
  (SELECT id FROM locations WHERE slug = 'desembarco-del-rey'),
  'Una serie de rebeliones lideradas por los bastardos de Aegon IV contra el trono legítimo. La guerra se prolongó durante décadas.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'El Torneo de Harrenhal',
  'el-torneo-de-harrenhal',
  '281 AC',
  (SELECT id FROM locations WHERE slug = 'harrenhal'),
  'El gran torneo donde Rhaegar coronó a Lyanna como reina del amor y la belleza en lugar de a su esposa. Este acto fue el inicio de la rebelión.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La Rebelión de Robert',
  'la-rebelion-de-robert',
  '282-283 AC',
  (SELECT id FROM locations WHERE slug = 'desembarco-del-rey'),
  'La fuga de Rhaegar con Lyanna Stark desencadenó una guerra que derrocó a la dinastía Targaryen. Robert Baratheon ascendió al trono tras la muerte del rey loco.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'El Asedio de Bastión de Tormentas',
  'el-asedio-de-bastion-de-tormentas',
  '282-283 AC',
  (SELECT id FROM locations WHERE slug = 'bastion-de-tormentas'),
  'Stannis defendió Bastión de Tormentas durante un asedio largo y hambriento. La llegada de Ned Stark alivió el asedio.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La Batalla del Tridente',
  'la-batalla-del-tridente',
  '283 AC',
  (SELECT id FROM locations WHERE slug = 'desembarco-del-rey'),
  'La batalla decisiva de la rebelión donde Robert mató a Rhaegar. Su martillo destrozó el pecho del príncipe y terminó con la esperanza Targaryen.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'El Saqueo de Desembarco del Rey',
  'el-saqueo-de-desembarco-del-rey',
  '283 AC',
  (SELECT id FROM locations WHERE slug = 'desembarco-del-rey'),
  'Las fuerzas Lannister entraron en la capital y saquearon la ciudad. La princesa Elia y sus hijos fueron asesinados.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La Rebelión Greyjoy',
  'la-rebelion-greyjoy',
  '289 AC',
  (SELECT id FROM locations WHERE slug = 'pyke'),
  'Balon Greyjoy se rebeló contra el trono y fue aplastado. Su hijo Theon fue enviado a Invernalia como rehén.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La Batalla de Fair Isle',
  'la-batalla-de-fair-isle',
  '289 AC',
  (SELECT id FROM locations WHERE slug = 'los-dedos'),
  'La batalla naval que destruyó la flota Greyjoy durante la rebelión.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La Guerra de los Cinco Reyes',
  'la-guerra-de-los-cinco-reyes',
  '298-300 AC',
  (SELECT id FROM locations WHERE slug = 'desembarco-del-rey'),
  'La guerra civil que siguió a la muerte de Robert. Cinco reyes se disputaron el trono, pero solo uno sobrevivió.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La Batalla de los Campamentos',
  'la-batalla-de-los-campamentos',
  '299 AC',
  NULL,
  'Robb Stark derrotó a las fuerzas Lannister y capturó a Jaime.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La Batalla de los Vados',
  'la-batalla-de-los-vados',
  '299 AC',
  NULL,
  'Edmure Tully intentó detener el avance Lannister pero fue derrotado.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La Boda Roja',
  'la-boda-roja',
  '299 AC',
  (SELECT id FROM locations WHERE slug = 'los-gemelos'),
  'La traición más famosa de Poniente. Walder Frey y Roose Bolton masacraron a Robb Stark, a su madre y a sus hombres durante una boda que debía ser de celebración.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La Batalla del Aguas Negras',
  'la-batalla-del-aguas-negras',
  '299 AC',
  (SELECT id FROM locations WHERE slug = 'desembarco-del-rey'),
  'Stannis atacó Desembarco del Rey por mar y tierra. Tyrion lideró la defensa con fuego griego y la llegada de los Tyrell cambió el curso de la batalla.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La Caída de Invernalia',
  'la-caida-de-invernalia',
  '300 AC',
  (SELECT id FROM locations WHERE slug = 'invernalia'),
  'Theon Greyjoy capturó Invernalia en nombre de su padre, pero Ramsay Bolton la recuperó y la destruyó.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La Destrucción del Septo de Baelor',
  'la-destruccion-del-septo-de-baelor',
  '300 AC',
  (SELECT id FROM locations WHERE slug = 'desembarco-del-rey'),
  'Cersei destruyó el Septo de Baelor con fuego valyrio para eliminar a sus enemigos. Margaery, Loras y miles de personas murieron.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La Batalla de los Bastardos',
  'la-batalla-de-los-bastardos',
  '300 AC',
  (SELECT id FROM locations WHERE slug = 'invernalia'),
  'Jon Nieve recuperó Invernalia de manos de Ramsay Bolton con la ayuda de los Vale. La batalla fue sangrienta pero decisiva.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La Batalla del Castillo Negro',
  'la-batalla-del-castillo-negro',
  '300 AC',
  (SELECT id FROM locations WHERE slug = 'castillo-negro'),
  'Jon Nieve defendió el Castillo Negro contra las fuerzas salvajes mientras Stannis llegaba como refuerzo.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'El Saqueo de Invernalia',
  'el-saqueo-de-invernalia',
  '300 AC',
  (SELECT id FROM locations WHERE slug = 'invernalia'),
  'Las fuerzas Bolton saquearon Invernalia después de recuperarla de los Greyjoy.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La Era del Amanecer',
  'la-era-del-amanecer',
  '-40000 AC',
  NULL,
  'La primera era del mundo, poblada por tribus bárbaras, gigantes y los hijos del bosque. Los hombres no conocían la escritura ni el metal.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La llegada de los Primeros Hombres',
  'la-llegada-de-los-primeros-hombres',
  '-8000 AC',
  NULL,
  'Los Primeros Hombres cruzaron el mar Angosto por el Brazo Roto y comenzaron a establecerse en Poniente, entrando en guerra con los hijos del bosque.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'El Pacto',
  'el-pacto',
  '-8000 AC',
  (SELECT id FROM locations WHERE slug = 'isla-del-ojo-de-dioses'),
  'Los Primeros Hombres y los hijos del bosque sellaron la paz en la isla del Ojo de Dioses, poniendo fin a siglos de guerra. Los hijos renunciaron a todas las tierras salvo los bosques.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La Edad de los Héroes',
  'la-edad-de-los-heroes',
  '-8000 AC',
  NULL,
  'Una era de miles de años durante la cual surgieron y desaparecieron reinos, se fundaron casas nobles y se realizaron grandes hazañas. Los nombres de sus reyes están envueltos en leyendas.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La Larga Noche',
  'la-larga-noche',
  '-8000 AC',
  NULL,
  'Un invierno que duró toda una generación, oscuro y letal. Los Otros surgieron de las Tierras del Eterno Invierno y amenazaron con extinguir toda luz y calor.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La Batalla por el Amanecer',
  'la-batalla-por-el-amanecer',
  '-8000 AC',
  NULL,
  'El combate decisivo en el que los Primeros Hombres y los hijos del bosque unieron fuerzas para derrotar a los Otros y acabar con la Larga Noche.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La llegada de los Ándalos',
  'la-llegada-de-los-andalos',
  '-6000 AC',
  NULL,
  'Los ándalos cruzaron el mar Angosto desde Andalia y conquistaron gran parte de Poniente, traendo la Fe de los Siete y las armas de hierro.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La llegada de los Rhoynar',
  'la-llegada-de-los-rhoynar',
  '-700 AC',
  NULL,
  'La princesa Nymeria huyó de Valyria con diez mil naves y se asentó en Dorne con los Martell, unificando la región.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La Maldición de Valyria',
  'la-maldicion-de-valyria',
  '-114 AC',
  (SELECT id FROM locations WHERE slug = 'valyria'),
  'Un cataclismo destruyó el Feudo Franco de Valyria y todo su imperio. Las Catorce Llamas erupcionaron simultáneamente, arrasando ciudades, palacios y dragones.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La Batalla de Campoestivo',
  'la-batalla-de-campoestivo',
  '-1 AC',
  NULL,
  'Argilac el Arrogante derrotó y mató a Garse VII Gardener, eliminando la casa Gardener del Dominio.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'El Siglo Sangriento',
  'el-siglo-sangriento',
  '-100 AC',
  NULL,
  'El período de caos tras la Maldición de Valyria, cuando las ciudades libres luchaban entre sí y los señores dragón supervivientes eran asesinados.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La Batalla de Reposo del Grajo',
  'la-batalla-de-reposo-del-grajo',
  '130 AC',
  NULL,
  'La princesa Rhaenys montando a Meleys enfrentó sola a Aegon II y Aemond. Aunque murió, dejó al rey Aegon II gravemente herido y a Fuegosol tullido.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La Batalla sobre el Ojo de Dioses',
  'la-batalla-sobre-el-ojo-de-dioses',
  '130 AC',
  NULL,
  'El famoso duelo entre Daemon y Aemond. Daemon saltó de Caraxes a Vhagar en pleno vuelo y mató a Aemond con Hermana Oscura mientras los dragones se precipitaban al agua.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La Primera Batalla de Ladera',
  'la-primera-batalla-de-ladera',
  '130 AC',
  NULL,
  'Los Dos Traidores, Hugh el Martillo y Ulf el Blanco, cambiaron de bando con sus dragones. El saqueo de Ladera que siguió fue uno de los episodios más brutales de la guerra.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La Segunda Batalla de Ladera',
  'la-segunda-batalla-de-ladera',
  '130 AC',
  NULL,
  'La batalla donde realmente bailaron los dragones. Murió el príncipe Daeron y Addam Velaryon demostró su lealtad con la vida. Se perdieron los dragones Bruma, Tessarion y Vermithor.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La Batalla del Camino Real',
  'la-batalla-del-camino-real',
  '131 AC',
  NULL,
  'La última batalla de la Danza, también llamada la Matanza del Barro. Lord Borros Baratheon cayó a manos de los jóvenes señores de los Ríos.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'El Asalto a Pozo Dragón',
  'el-asalto-a-pozo-dragon',
  '130 AC',
  (SELECT id FROM locations WHERE slug = 'desembarco-del-rey'),
  'La muchedumbre del Pastor irrumpió en Pozo Dragón para matar a los dragones encadenados. Murieron cinco dragones y el príncipe Joffrey Velaryon.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La Batalla del Gaznate',
  'la-batalla-del-gaznate',
  '129 AC',
  NULL,
  'Las naves de la Triarquía derrotaron a la flota de Corlys Velaryon. Perecieron Jacaerys Velaryon y su dragón Vermax.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La Caída de Rhaenyra',
  'la-caida-de-rhaenyra',
  '130 AC',
  NULL,
  'Rhaenyra huyó de Desembarco del Rey y llegó a Rocadragón, donde Aegon II la apresó y la devoró con el dragón Fuegosol ante los ojos de su hijo.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La Primera Rebelión Blackfyre',
  'la-primera-rebelion-blackfyre',
  '196 AC',
  NULL,
  'Daemon Blackfyre reclamó el trono contra Daeron II. La rebelión terminó en la Batalla del Prado Hierbarroja donde Daemon y sus hijos mayores cayeron bajo las flechas de Cuervo de Sangre.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La Segunda Rebelión Blackfyre',
  'la-segunda-rebelion-blackfyre',
  '211 AC',
  NULL,
  'Una conspiración para devolver a los Fuegoscuro que fue descubierta por Cuervo de Sangre antes de comenzar, en el torneo nupcial de Murosblancos.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La Tercera Rebelión Blackfyre',
  'la-tercera-rebelion-blackfyre',
  '219 AC',
  NULL,
  'Haegon I Blackfyre y Aceroamargo acometieron la tercera rebelión. Haegon murió tras la batalla y Aceroamargo fue enviado al Muro pero liberado en el camino.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La Cuarta Rebelión Blackfyre',
  'la-cuarta-rebelion-blackfyre',
  '236 AC',
  NULL,
  'Daemon III Blackfyre y Aceroamargo desembarcaron en el Garfio de Massey pero fueron derrotados en la Batalla del Puente del Aguastortas. Aceroamargo murió poco después en las Tierras de la Discordia.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La Peste de la Gran Primavera',
  'la-peste-de-la-gran-primavera',
  '209 AC',
  (SELECT id FROM locations WHERE slug = 'desembarco-del-rey'),
  'Una peste devastadora que mató al rey Daeron II, al septón supremo y a un tercio de la población de Desembarco del Rey.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'El Gran Consejo del 101',
  'el-gran-consejo-del-101',
  '101 AC',
  (SELECT id FROM locations WHERE slug = 'desembarco-del-rey'),
  'El consejo que decidió que el trono pasaría a Viserys I en lugar de a Rhaenys, estableciendo el precedente de que el hombre tiene prioridad sobre la mujer.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

INSERT INTO events (name, slug, year, location_id, description)
VALUES (
  'La Conquista de Dorne por Daeron I',
  'la-conquista-de-dorne-por-daeron-i',
  '157-161 AC',
  NULL,
  'Daeron I el Joven Dragón conquistó Dorne pero no pudo mantenerla. Murió emboscado al cruzar el Sendahuesos.'
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name, year = EXCLUDED.year, description = EXCLUDED.description;

-- ============================================================
-- EVENT CHARACTERS
-- ============================================================

DO $$
DECLARE
  ev RECORD;
  ch_name TEXT;
  char_slug TEXT;
BEGIN
  -- La Conquista de los Siete Reinos -> Aegon Targaryen
  SELECT slug INTO char_slug FROM characters WHERE slug = 'aegon-targaryen';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-conquista-de-los-siete-reinos' AND c1.slug = 'aegon-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Conquista de los Siete Reinos', 'Aegon Targaryen';
  END IF;

  -- El Campo de Fuego -> Aegon Targaryen
  SELECT slug INTO char_slug FROM characters WHERE slug = 'aegon-targaryen';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'el-campo-de-fuego' AND c1.slug = 'aegon-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'El Campo de Fuego', 'Aegon Targaryen';
  END IF;

  -- La Conquista de Dorne -> Aegon Targaryen
  SELECT slug INTO char_slug FROM characters WHERE slug = 'aegon-targaryen';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-conquista-de-dorne' AND c1.slug = 'aegon-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Conquista de Dorne', 'Aegon Targaryen';
  END IF;

  -- La Guerra de los Nuevepeniques -> Maegor I Targaryen
  SELECT slug INTO char_slug FROM characters WHERE slug = 'maegor-i-targaryen';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-guerra-de-los-nuevepeniques' AND c1.slug = 'maegor-i-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Guerra de los Nuevepeniques', 'Maegor I Targaryen';
  END IF;

  -- La Danza de los Dragones -> Aegon II Targaryen
  SELECT slug INTO char_slug FROM characters WHERE slug = 'aegon-ii-targaryen';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-danza-de-los-dragones' AND c1.slug = 'aegon-ii-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Danza de los Dragones', 'Aegon II Targaryen';
  END IF;

  -- La Danza de los Dragones -> Rhaenyra Targaryen
  SELECT slug INTO char_slug FROM characters WHERE slug = 'rhaenyra-targaryen';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-danza-de-los-dragones' AND c1.slug = 'rhaenyra-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Danza de los Dragones', 'Rhaenyra Targaryen';
  END IF;

  -- La Rebelión Blackfyre -> Daemon Blackfyre
  SELECT slug INTO char_slug FROM characters WHERE slug = 'daemon-blackfyre';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-rebelion-blackfyre' AND c1.slug = 'daemon-blackfyre'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Rebelión Blackfyre', 'Daemon Blackfyre';
  END IF;

  -- La Rebelión Blackfyre -> Aegor Rivers
  SELECT slug INTO char_slug FROM characters WHERE slug = 'aegor-rivers';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-rebelion-blackfyre' AND c1.slug = 'aegor-rivers'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Rebelión Blackfyre', 'Aegor Rivers';
  END IF;

  -- La Rebelión Blackfyre -> Brynden Rivers
  SELECT slug INTO char_slug FROM characters WHERE slug = 'brynden-rivers';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-rebelion-blackfyre' AND c1.slug = 'brynden-rivers'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Rebelión Blackfyre', 'Brynden Rivers';
  END IF;

  -- El Torneo de Harrenhal -> Rhaegar Targaryen
  SELECT slug INTO char_slug FROM characters WHERE slug = 'rhaegar-targaryen';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'el-torneo-de-harrenhal' AND c1.slug = 'rhaegar-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'El Torneo de Harrenhal', 'Rhaegar Targaryen';
  END IF;

  -- El Torneo de Harrenhal -> Lyanna Stark
  SELECT slug INTO char_slug FROM characters WHERE slug = 'lyanna-stark';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'el-torneo-de-harrenhal' AND c1.slug = 'lyanna-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'El Torneo de Harrenhal', 'Lyanna Stark';
  END IF;

  -- El Torneo de Harrenhal -> Robert Baratheon
  SELECT slug INTO char_slug FROM characters WHERE slug = 'robert-baratheon';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'el-torneo-de-harrenhal' AND c1.slug = 'robert-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'El Torneo de Harrenhal', 'Robert Baratheon';
  END IF;

  -- El Torneo de Harrenhal -> Brandon Stark
  SELECT slug INTO char_slug FROM characters WHERE slug = 'brandon-stark';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'el-torneo-de-harrenhal' AND c1.slug = 'brandon-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'El Torneo de Harrenhal', 'Brandon Stark';
  END IF;

  -- La Rebelión de Robert -> Robert Baratheon
  SELECT slug INTO char_slug FROM characters WHERE slug = 'robert-baratheon';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-rebelion-de-robert' AND c1.slug = 'robert-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Rebelión de Robert', 'Robert Baratheon';
  END IF;

  -- La Rebelión de Robert -> Eddard Stark
  SELECT slug INTO char_slug FROM characters WHERE slug = 'eddard-stark';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-rebelion-de-robert' AND c1.slug = 'eddard-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Rebelión de Robert', 'Eddard Stark';
  END IF;

  -- La Rebelión de Robert -> Lyanna Stark
  SELECT slug INTO char_slug FROM characters WHERE slug = 'lyanna-stark';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-rebelion-de-robert' AND c1.slug = 'lyanna-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Rebelión de Robert', 'Lyanna Stark';
  END IF;

  -- La Rebelión de Robert -> Rhaegar Targaryen
  SELECT slug INTO char_slug FROM characters WHERE slug = 'rhaegar-targaryen';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-rebelion-de-robert' AND c1.slug = 'rhaegar-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Rebelión de Robert', 'Rhaegar Targaryen';
  END IF;

  -- El Asedio de Bastión de Tormentas -> Stannis Baratheon
  SELECT slug INTO char_slug FROM characters WHERE slug = 'stannis-baratheon';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'el-asedio-de-bastion-de-tormentas' AND c1.slug = 'stannis-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'El Asedio de Bastión de Tormentas', 'Stannis Baratheon';
  END IF;

  -- El Asedio de Bastión de Tormentas -> Mace Tyrell
  SELECT slug INTO char_slug FROM characters WHERE slug = 'mace-tyrell';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'el-asedio-de-bastion-de-tormentas' AND c1.slug = 'mace-tyrell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'El Asedio de Bastión de Tormentas', 'Mace Tyrell';
  END IF;

  -- La Batalla del Tridente -> Robert Baratheon
  SELECT slug INTO char_slug FROM characters WHERE slug = 'robert-baratheon';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-batalla-del-tridente' AND c1.slug = 'robert-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Batalla del Tridente', 'Robert Baratheon';
  END IF;

  -- La Batalla del Tridente -> Rhaegar Targaryen
  SELECT slug INTO char_slug FROM characters WHERE slug = 'rhaegar-targaryen';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-batalla-del-tridente' AND c1.slug = 'rhaegar-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Batalla del Tridente', 'Rhaegar Targaryen';
  END IF;

  -- El Saqueo de Desembarco del Rey -> Robert Baratheon
  SELECT slug INTO char_slug FROM characters WHERE slug = 'robert-baratheon';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'el-saqueo-de-desembarco-del-rey' AND c1.slug = 'robert-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'El Saqueo de Desembarco del Rey', 'Robert Baratheon';
  END IF;

  -- El Saqueo de Desembarco del Rey -> Tywin Lannister
  SELECT slug INTO char_slug FROM characters WHERE slug = 'tywin-lannister';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'el-saqueo-de-desembarco-del-rey' AND c1.slug = 'tywin-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'El Saqueo de Desembarco del Rey', 'Tywin Lannister';
  END IF;

  -- La Rebelión Greyjoy -> Balon Greyjoy
  SELECT slug INTO char_slug FROM characters WHERE slug = 'balon-greyjoy';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-rebelion-greyjoy' AND c1.slug = 'balon-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Rebelión Greyjoy', 'Balon Greyjoy';
  END IF;

  -- La Rebelión Greyjoy -> Robert Baratheon
  SELECT slug INTO char_slug FROM characters WHERE slug = 'robert-baratheon';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-rebelion-greyjoy' AND c1.slug = 'robert-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Rebelión Greyjoy', 'Robert Baratheon';
  END IF;

  -- La Rebelión Greyjoy -> Eddard Stark
  SELECT slug INTO char_slug FROM characters WHERE slug = 'eddard-stark';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-rebelion-greyjoy' AND c1.slug = 'eddard-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Rebelión Greyjoy', 'Eddard Stark';
  END IF;

  -- La Rebelión Greyjoy -> Jorah Mormont
  SELECT slug INTO char_slug FROM characters WHERE slug = 'jorah-mormont';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-rebelion-greyjoy' AND c1.slug = 'jorah-mormont'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Rebelión Greyjoy', 'Jorah Mormont';
  END IF;

  -- La Batalla de Fair Isle -> Robert Baratheon
  SELECT slug INTO char_slug FROM characters WHERE slug = 'robert-baratheon';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-batalla-de-fair-isle' AND c1.slug = 'robert-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Batalla de Fair Isle', 'Robert Baratheon';
  END IF;

  -- La Batalla de Fair Isle -> Stannis Baratheon
  SELECT slug INTO char_slug FROM characters WHERE slug = 'stannis-baratheon';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-batalla-de-fair-isle' AND c1.slug = 'stannis-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Batalla de Fair Isle', 'Stannis Baratheon';
  END IF;

  -- La Guerra de los Cinco Reyes -> Robb Stark
  SELECT slug INTO char_slug FROM characters WHERE slug = 'robb-stark';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-guerra-de-los-cinco-reyes' AND c1.slug = 'robb-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Guerra de los Cinco Reyes', 'Robb Stark';
  END IF;

  -- La Guerra de los Cinco Reyes -> Stannis Baratheon
  SELECT slug INTO char_slug FROM characters WHERE slug = 'stannis-baratheon';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-guerra-de-los-cinco-reyes' AND c1.slug = 'stannis-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Guerra de los Cinco Reyes', 'Stannis Baratheon';
  END IF;

  -- La Guerra de los Cinco Reyes -> Renly Baratheon
  SELECT slug INTO char_slug FROM characters WHERE slug = 'renly-baratheon';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-guerra-de-los-cinco-reyes' AND c1.slug = 'renly-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Guerra de los Cinco Reyes', 'Renly Baratheon';
  END IF;

  -- La Guerra de los Cinco Reyes -> Balon Greyjoy
  SELECT slug INTO char_slug FROM characters WHERE slug = 'balon-greyjoy';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-guerra-de-los-cinco-reyes' AND c1.slug = 'balon-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Guerra de los Cinco Reyes', 'Balon Greyjoy';
  END IF;

  -- La Guerra de los Cinco Reyes -> Joffrey Baratheon
  SELECT slug INTO char_slug FROM characters WHERE slug = 'joffrey-baratheon';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-guerra-de-los-cinco-reyes' AND c1.slug = 'joffrey-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Guerra de los Cinco Reyes', 'Joffrey Baratheon';
  END IF;

  -- La Batalla de los Campamentos -> Robb Stark
  SELECT slug INTO char_slug FROM characters WHERE slug = 'robb-stark';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-batalla-de-los-campamentos' AND c1.slug = 'robb-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Batalla de los Campamentos', 'Robb Stark';
  END IF;

  -- La Batalla de los Campamentos -> Jaime Lannister
  SELECT slug INTO char_slug FROM characters WHERE slug = 'jaime-lannister';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-batalla-de-los-campamentos' AND c1.slug = 'jaime-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Batalla de los Campamentos', 'Jaime Lannister';
  END IF;

  -- La Batalla de los Vados -> Edmure Tully
  SELECT slug INTO char_slug FROM characters WHERE slug = 'edmure-tully';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-batalla-de-los-vados' AND c1.slug = 'edmure-tully'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Batalla de los Vados', 'Edmure Tully';
  END IF;

  -- La Batalla de los Vados -> Tywin Lannister
  SELECT slug INTO char_slug FROM characters WHERE slug = 'tywin-lannister';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-batalla-de-los-vados' AND c1.slug = 'tywin-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Batalla de los Vados', 'Tywin Lannister';
  END IF;

  -- La Boda Roja -> Robb Stark
  SELECT slug INTO char_slug FROM characters WHERE slug = 'robb-stark';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-boda-roja' AND c1.slug = 'robb-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Boda Roja', 'Robb Stark';
  END IF;

  -- La Boda Roja -> Catelyn Tully
  SELECT slug INTO char_slug FROM characters WHERE slug = 'catelyn-tully';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-boda-roja' AND c1.slug = 'catelyn-tully'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Boda Roja', 'Catelyn Tully';
  END IF;

  -- La Boda Roja -> Walder Frey
  SELECT slug INTO char_slug FROM characters WHERE slug = 'walder-frey';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-boda-roja' AND c1.slug = 'walder-frey'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Boda Roja', 'Walder Frey';
  END IF;

  -- La Boda Roja -> Roose Bolton
  SELECT slug INTO char_slug FROM characters WHERE slug = 'roose-bolton';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-boda-roja' AND c1.slug = 'roose-bolton'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Boda Roja', 'Roose Bolton';
  END IF;

  -- La Batalla del Aguas Negras -> Stannis Baratheon
  SELECT slug INTO char_slug FROM characters WHERE slug = 'stannis-baratheon';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-batalla-del-aguas-negras' AND c1.slug = 'stannis-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Batalla del Aguas Negras', 'Stannis Baratheon';
  END IF;

  -- La Batalla del Aguas Negras -> Tyrion Lannister
  SELECT slug INTO char_slug FROM characters WHERE slug = 'tyrion-lannister';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-batalla-del-aguas-negras' AND c1.slug = 'tyrion-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Batalla del Aguas Negras', 'Tyrion Lannister';
  END IF;

  -- La Batalla del Aguas Negras -> Cersei Lannister
  SELECT slug INTO char_slug FROM characters WHERE slug = 'cersei-lannister';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-batalla-del-aguas-negras' AND c1.slug = 'cersei-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Batalla del Aguas Negras', 'Cersei Lannister';
  END IF;

  -- La Caída de Invernalia -> Theon Greyjoy
  SELECT slug INTO char_slug FROM characters WHERE slug = 'theon-greyjoy';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-caida-de-invernalia' AND c1.slug = 'theon-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Caída de Invernalia', 'Theon Greyjoy';
  END IF;

  -- La Caída de Invernalia -> Ramsay Bolton
  SELECT slug INTO char_slug FROM characters WHERE slug = 'ramsay-bolton';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-caida-de-invernalia' AND c1.slug = 'ramsay-bolton'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Caída de Invernalia', 'Ramsay Bolton';
  END IF;

  -- La Caída de Invernalia -> Bran Stark
  SELECT slug INTO char_slug FROM characters WHERE slug = 'bran-stark';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-caida-de-invernalia' AND c1.slug = 'bran-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Caída de Invernalia', 'Bran Stark';
  END IF;

  -- La Caída de Invernalia -> Rickon Stark
  SELECT slug INTO char_slug FROM characters WHERE slug = 'rickon-stark';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-caida-de-invernalia' AND c1.slug = 'rickon-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Caída de Invernalia', 'Rickon Stark';
  END IF;

  -- La Destrucción del Septo de Baelor -> Cersei Lannister
  SELECT slug INTO char_slug FROM characters WHERE slug = 'cersei-lannister';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-destruccion-del-septo-de-baelor' AND c1.slug = 'cersei-lannister'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Destrucción del Septo de Baelor', 'Cersei Lannister';
  END IF;

  -- La Destrucción del Septo de Baelor -> Margaery Tyrell
  SELECT slug INTO char_slug FROM characters WHERE slug = 'margaery-tyrell';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-destruccion-del-septo-de-baelor' AND c1.slug = 'margaery-tyrell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Destrucción del Septo de Baelor', 'Margaery Tyrell';
  END IF;

  -- La Destrucción del Septo de Baelor -> Loras Tyrell
  SELECT slug INTO char_slug FROM characters WHERE slug = 'loras-tyrell';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-destruccion-del-septo-de-baelor' AND c1.slug = 'loras-tyrell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Destrucción del Septo de Baelor', 'Loras Tyrell';
  END IF;

  -- La Batalla de los Bastardos -> Jon Nieve
  SELECT slug INTO char_slug FROM characters WHERE slug = 'jon-nieve';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-batalla-de-los-bastardos' AND c1.slug = 'jon-nieve'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Batalla de los Bastardos', 'Jon Nieve';
  END IF;

  -- La Batalla de los Bastardos -> Ramsay Bolton
  SELECT slug INTO char_slug FROM characters WHERE slug = 'ramsay-bolton';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-batalla-de-los-bastardos' AND c1.slug = 'ramsay-bolton'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Batalla de los Bastardos', 'Ramsay Bolton';
  END IF;

  -- La Batalla de los Bastardos -> Sansa Stark
  SELECT slug INTO char_slug FROM characters WHERE slug = 'sansa-stark';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-batalla-de-los-bastardos' AND c1.slug = 'sansa-stark'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Batalla de los Bastardos', 'Sansa Stark';
  END IF;

  -- La Batalla del Castillo Negro -> Jon Nieve
  SELECT slug INTO char_slug FROM characters WHERE slug = 'jon-nieve';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-batalla-del-castillo-negro' AND c1.slug = 'jon-nieve'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Batalla del Castillo Negro', 'Jon Nieve';
  END IF;

  -- La Batalla del Castillo Negro -> Tormund Gigante
  SELECT slug INTO char_slug FROM characters WHERE slug = 'tormund-gigante';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-batalla-del-castillo-negro' AND c1.slug = 'tormund-gigante'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Batalla del Castillo Negro', 'Tormund Gigante';
  END IF;

  -- La Batalla del Castillo Negro -> Stannis Baratheon
  SELECT slug INTO char_slug FROM characters WHERE slug = 'stannis-baratheon';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-batalla-del-castillo-negro' AND c1.slug = 'stannis-baratheon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Batalla del Castillo Negro', 'Stannis Baratheon';
  END IF;

  -- El Saqueo de Invernalia -> Theon Greyjoy
  SELECT slug INTO char_slug FROM characters WHERE slug = 'theon-greyjoy';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'el-saqueo-de-invernalia' AND c1.slug = 'theon-greyjoy'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'El Saqueo de Invernalia', 'Theon Greyjoy';
  END IF;

  -- El Saqueo de Invernalia -> Ramsay Bolton
  SELECT slug INTO char_slug FROM characters WHERE slug = 'ramsay-bolton';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'el-saqueo-de-invernalia' AND c1.slug = 'ramsay-bolton'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'El Saqueo de Invernalia', 'Ramsay Bolton';
  END IF;

  -- La Edad de los Héroes -> Brandon el Constructor
  SELECT slug INTO char_slug FROM characters WHERE slug = 'brandon-el-constructor';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-edad-de-los-heroes' AND c1.slug = 'brandon-el-constructor'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Edad de los Héroes', 'Brandon el Constructor';
  END IF;

  -- La Edad de los Héroes -> Garth Manoverde
  SELECT slug INTO char_slug FROM characters WHERE slug = 'garth-manoverde';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-edad-de-los-heroes' AND c1.slug = 'garth-manoverde'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Edad de los Héroes', 'Garth Manoverde';
  END IF;

  -- La Edad de los Héroes -> Lann el Astuto
  SELECT slug INTO char_slug FROM characters WHERE slug = 'lann-el-astuto';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-edad-de-los-heroes' AND c1.slug = 'lann-el-astuto'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Edad de los Héroes', 'Lann el Astuto';
  END IF;

  -- La Edad de los Héroes -> Durran Pesardedioses
  SELECT slug INTO char_slug FROM characters WHERE slug = 'durran-pesardedioses';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-edad-de-los-heroes' AND c1.slug = 'durran-pesardedioses'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Edad de los Héroes', 'Durran Pesardedioses';
  END IF;

  -- La llegada de los Rhoynar -> Nymeria de los Rhoynar
  SELECT slug INTO char_slug FROM characters WHERE slug = 'nymeria-de-los-rhoynar';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-llegada-de-los-rhoynar' AND c1.slug = 'nymeria-de-los-rhoynar'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La llegada de los Rhoynar', 'Nymeria de los Rhoynar';
  END IF;

  -- La llegada de los Rhoynar -> Mors Martell
  SELECT slug INTO char_slug FROM characters WHERE slug = 'mors-martell';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-llegada-de-los-rhoynar' AND c1.slug = 'mors-martell'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La llegada de los Rhoynar', 'Mors Martell';
  END IF;

  -- La Batalla de Campoestivo -> Argilac el Arrogante
  SELECT slug INTO char_slug FROM characters WHERE slug = 'argilac-el-arrogante';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-batalla-de-campoestivo' AND c1.slug = 'argilac-el-arrogante'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Batalla de Campoestivo', 'Argilac el Arrogante';
  END IF;

  -- La Batalla de Campoestivo -> Garse VII Gardener
  SELECT slug INTO char_slug FROM characters WHERE slug = 'garse-vii-gardener';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-batalla-de-campoestivo' AND c1.slug = 'garse-vii-gardener'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Batalla de Campoestivo', 'Garse VII Gardener';
  END IF;

  -- La Batalla de Reposo del Grajo -> Rhaenys Targaryen
  SELECT slug INTO char_slug FROM characters WHERE slug = 'rhaenys-targaryen';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-batalla-de-reposo-del-grajo' AND c1.slug = 'rhaenys-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Batalla de Reposo del Grajo', 'Rhaenys Targaryen';
  END IF;

  -- La Batalla de Reposo del Grajo -> Aegon II Targaryen
  SELECT slug INTO char_slug FROM characters WHERE slug = 'aegon-ii-targaryen';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-batalla-de-reposo-del-grajo' AND c1.slug = 'aegon-ii-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Batalla de Reposo del Grajo', 'Aegon II Targaryen';
  END IF;

  -- La Batalla de Reposo del Grajo -> Aemond Targaryen
  SELECT slug INTO char_slug FROM characters WHERE slug = 'aemond-targaryen';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-batalla-de-reposo-del-grajo' AND c1.slug = 'aemond-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Batalla de Reposo del Grajo', 'Aemond Targaryen';
  END IF;

  -- La Batalla sobre el Ojo de Dioses -> Daemon Targaryen
  SELECT slug INTO char_slug FROM characters WHERE slug = 'daemon-targaryen';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-batalla-sobre-el-ojo-de-dioses' AND c1.slug = 'daemon-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Batalla sobre el Ojo de Dioses', 'Daemon Targaryen';
  END IF;

  -- La Batalla sobre el Ojo de Dioses -> Aemond Targaryen
  SELECT slug INTO char_slug FROM characters WHERE slug = 'aemond-targaryen';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-batalla-sobre-el-ojo-de-dioses' AND c1.slug = 'aemond-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Batalla sobre el Ojo de Dioses', 'Aemond Targaryen';
  END IF;

  -- La Primera Batalla de Ladera -> Hugh el Martillo
  SELECT slug INTO char_slug FROM characters WHERE slug = 'hugh-el-martillo';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-primera-batalla-de-ladera' AND c1.slug = 'hugh-el-martillo'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Primera Batalla de Ladera', 'Hugh el Martillo';
  END IF;

  -- La Primera Batalla de Ladera -> Ulf el Blanco
  SELECT slug INTO char_slug FROM characters WHERE slug = 'ulf-el-blanco';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-primera-batalla-de-ladera' AND c1.slug = 'ulf-el-blanco'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Primera Batalla de Ladera', 'Ulf el Blanco';
  END IF;

  -- La Segunda Batalla de Ladera -> Daeron Targaryen
  SELECT slug INTO char_slug FROM characters WHERE slug = 'daeron-targaryen';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-segunda-batalla-de-ladera' AND c1.slug = 'daeron-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Segunda Batalla de Ladera', 'Daeron Targaryen';
  END IF;

  -- La Segunda Batalla de Ladera -> Addam Velaryon
  SELECT slug INTO char_slug FROM characters WHERE slug = 'addam-velaryon';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-segunda-batalla-de-ladera' AND c1.slug = 'addam-velaryon'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Segunda Batalla de Ladera', 'Addam Velaryon';
  END IF;

  -- La Caída de Rhaenyra -> Rhaenyra Targaryen
  SELECT slug INTO char_slug FROM characters WHERE slug = 'rhaenyra-targaryen';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-caida-de-rhaenyra' AND c1.slug = 'rhaenyra-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Caída de Rhaenyra', 'Rhaenyra Targaryen';
  END IF;

  -- La Caída de Rhaenyra -> Aegon II Targaryen
  SELECT slug INTO char_slug FROM characters WHERE slug = 'aegon-ii-targaryen';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-caida-de-rhaenyra' AND c1.slug = 'aegon-ii-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Caída de Rhaenyra', 'Aegon II Targaryen';
  END IF;

  -- La Primera Rebelión Blackfyre -> Daemon Blackfyre
  SELECT slug INTO char_slug FROM characters WHERE slug = 'daemon-blackfyre';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-primera-rebelion-blackfyre' AND c1.slug = 'daemon-blackfyre'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Primera Rebelión Blackfyre', 'Daemon Blackfyre';
  END IF;

  -- La Primera Rebelión Blackfyre -> Aegor Rivers
  SELECT slug INTO char_slug FROM characters WHERE slug = 'aegor-rivers';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-primera-rebelion-blackfyre' AND c1.slug = 'aegor-rivers'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Primera Rebelión Blackfyre', 'Aegor Rivers';
  END IF;

  -- La Primera Rebelión Blackfyre -> Brynden Rivers
  SELECT slug INTO char_slug FROM characters WHERE slug = 'brynden-rivers';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-primera-rebelion-blackfyre' AND c1.slug = 'brynden-rivers'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Primera Rebelión Blackfyre', 'Brynden Rivers';
  END IF;

  -- La Primera Rebelión Blackfyre -> Daeron II Targaryen
  SELECT slug INTO char_slug FROM characters WHERE slug = 'daeron-ii-targaryen';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-primera-rebelion-blackfyre' AND c1.slug = 'daeron-ii-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Primera Rebelión Blackfyre', 'Daeron II Targaryen';
  END IF;

  -- La Segunda Rebelión Blackfyre -> Brynden Rivers
  SELECT slug INTO char_slug FROM characters WHERE slug = 'brynden-rivers';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-segunda-rebelion-blackfyre' AND c1.slug = 'brynden-rivers'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Segunda Rebelión Blackfyre', 'Brynden Rivers';
  END IF;

  -- La Tercera Rebelión Blackfyre -> Aegor Rivers
  SELECT slug INTO char_slug FROM characters WHERE slug = 'aegor-rivers';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-tercera-rebelion-blackfyre' AND c1.slug = 'aegor-rivers'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Tercera Rebelión Blackfyre', 'Aegor Rivers';
  END IF;

  -- La Tercera Rebelión Blackfyre -> Brynden Rivers
  SELECT slug INTO char_slug FROM characters WHERE slug = 'brynden-rivers';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-tercera-rebelion-blackfyre' AND c1.slug = 'brynden-rivers'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Tercera Rebelión Blackfyre', 'Brynden Rivers';
  END IF;

  -- La Cuarta Rebelión Blackfyre -> Aegon V Targaryen
  SELECT slug INTO char_slug FROM characters WHERE slug = 'aegon-v-targaryen';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-cuarta-rebelion-blackfyre' AND c1.slug = 'aegon-v-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Cuarta Rebelión Blackfyre', 'Aegon V Targaryen';
  END IF;

  -- La Cuarta Rebelión Blackfyre -> Aegor Rivers
  SELECT slug INTO char_slug FROM characters WHERE slug = 'aegor-rivers';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-cuarta-rebelion-blackfyre' AND c1.slug = 'aegor-rivers'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Cuarta Rebelión Blackfyre', 'Aegor Rivers';
  END IF;

  -- La Peste de la Gran Primavera -> Daeron II Targaryen
  SELECT slug INTO char_slug FROM characters WHERE slug = 'daeron-ii-targaryen';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-peste-de-la-gran-primavera' AND c1.slug = 'daeron-ii-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Peste de la Gran Primavera', 'Daeron II Targaryen';
  END IF;

  -- El Gran Consejo del 101 -> Viserys I Targaryen
  SELECT slug INTO char_slug FROM characters WHERE slug = 'viserys-i-targaryen';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'el-gran-consejo-del-101' AND c1.slug = 'viserys-i-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'El Gran Consejo del 101', 'Viserys I Targaryen';
  END IF;

  -- El Gran Consejo del 101 -> Rhaenys Targaryen
  SELECT slug INTO char_slug FROM characters WHERE slug = 'rhaenys-targaryen';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'el-gran-consejo-del-101' AND c1.slug = 'rhaenys-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'El Gran Consejo del 101', 'Rhaenys Targaryen';
  END IF;

  -- La Conquista de Dorne por Daeron I -> Daeron I Targaryen
  SELECT slug INTO char_slug FROM characters WHERE slug = 'daeron-i-targaryen';
  IF FOUND THEN
    INSERT INTO event_characters (event_id, character_id)
    SELECT e1.id, c1.id
    FROM events e1, characters c1
    WHERE e1.slug = 'la-conquista-de-dorne-por-daeron-i' AND c1.slug = 'daeron-i-targaryen'
    ON CONFLICT DO NOTHING;
  ELSE
    RAISE NOTICE 'Event %: unresolved character %', 'La Conquista de Dorne por Daeron I', 'Daeron I Targaryen';
  END IF;

END $$;

SET session_replication_role = 'origin';

-- ============================================================
-- MIGRATION SUMMARY
-- ============================================================
-- Houses:     47
-- Characters: 250
-- Locations:  91
-- Events:     50
-- Total:      438

-- Done!
