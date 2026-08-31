-- =====================================================
-- ARCHIVO DE PONIENTE - Seed Data
-- =====================================================
-- Datos de prueba para desarrollo.
-- Descripciones originales (no texto literal de los libros).
-- Usa nombres de dominio público del universo.

-- ── CASAS ──

INSERT INTO houses (id, name, slug, region, words, seat, colors, description) VALUES
('a0000000-0000-0000-0000-000000000001', 'Stark', 'stark', 'El Norte', 'Se acerca el invierno', 'Invernalia', 'gris, blanco', 'Una estirpe antigua que gobernó el Norte como Reyes del Invierno antes de inclinarse ante el dragón. Su autoridad nace de una continuidad casi geológica: criptas, arcianos y juramentos conservan una memoria que precede a los Siete Reinos.'),
('a0000000-0000-0000-0000-000000000002', 'Lannister', 'lannister', 'Tierras del Oeste', 'Oye mi rugido', 'Roca Casterly', 'dorado, carmesí', 'Una dinastía cuya riqueza mineral sostiene una maquinaria de alianzas, préstamos y silencios calculados. De Lann el Astuto a Tywin, la casa convirtió la reputación en moneda y el matrimonio en una extensión de la guerra.'),
('a0000000-0000-0000-0000-000000000003', 'Targaryen', 'targaryen', 'Rocadragón', 'Fuego y sangre', 'Rocadragón', 'púrpura, negro', 'La última gran sangre de Valyria unificó seis reinos mediante dragones y dejó una corona marcada por profecía y ruina. La Conquista alteró el calendario político de Poniente.'),
('a0000000-0000-0000-0000-000000000004', 'Baratheon', 'baratheon', 'Tierras de la Tormenta', 'Nuestra es la furia', 'Bastión de Tormentas', 'negro, dorado', 'Forjada entre la tormenta y la conquista, su línea convirtió una rebelión victoriosa en una dinastía fracturada. Orys Baratheon fundó la casa sobre la herencia Durrandon.');

-- ── PERSONAJES ──

INSERT INTO characters (id, name, aliases, house_id, culture, status, born, description) VALUES
('b0000000-0000-0000-0000-000000000001', 'Eddard Stark', ARRAY['Ned'], 'a0000000-0000-0000-0000-000000000001', 'Norteño', 'muerto', '263 AC', 'Señor de Invernalia y Guarda del Rey. Hombre de honor inquebrantable cuya rectitud le costó la vida en la corte de Desembarco del Rey.'),
('b0000000-0000-0000-0000-000000000002', 'Sansa Stark', ARRAY[], 'a0000000-0000-0000-0000-000000000001', 'Norteño', 'vivo', '286 AC', 'Hija de Eddard y Catelyn. Reina del Norte, aprendió supervivencia y política en las cortes más peligrosas de Poniente.'),
('b0000000-0000-0000-0000-000000000003', 'Arya Stark', ARRAY['Arya del Pie Descalzo'], 'a0000000-0000-0000-0000-000000000001', 'Norteño', 'vivo', '289 AC', 'Hija menor de Ned Stark, cuyo viaje por los caminos más oscuros de Poniente la forjó en algo que ninguna escuela de asesinos podría haber anticipado.'),
('b0000000-0000-0000-0000-000000000004', 'Bran Stark', ARRAY['Bran el Roto'], 'a0000000-0000-0000-0000-000000000001', 'Norteño', 'vivo', '290 AC', 'El hijo que cayó y se levantó como el Cuervos de Tres Ojos, guardián de la memoria del mundo.'),
('b0000000-0000-0000-0000-000000000005', 'Jon Nieve', ARRAY['Aegon Targaryen', 'Alborada'], 'a0000000-0000-0000-0000-000000000001', 'Norteño', 'vivo', '283 AC', 'Hijo secreto de Rhaegar Targaryen y Lyanna Stark, criado como bastardo en Invernalia. Lord Comandante de la Guardia de la Noche.'),
('b0000000-0000-0000-0000-000000000006', 'Tywin Lannister', ARRAY[], 'a0000000-0000-0000-0000-000000000002', 'Occidental', 'muerto', '242 AC', 'Señor de Roca Casterly y Mano del Rey. Estratega implacable cuya obsesión por la dinastía destruyó tanto a sus enemigos como a su propia familia.'),
('b0000000-0000-0000-0000-000000000007', 'Cersei Lannister', ARRAY[], 'a0000000-0000-0000-0000-000000000002', 'Occidental', 'muerto', '266 AC', 'Reina de los Siete Reinos, hija de Tywin. Mujer de voluntad férrea cuyo amor por sus hijos fue tanto su fortaleza como su ruina.'),
('b0000000-0000-0000-0000-000000000008', 'Tyrion Lannister', ARRAY['El Duende', 'El Enano'], 'a0000000-0000-0000-0000-000000000002', 'Occidental', 'vivo', '273 AC', 'El menor de los Lannister, cuya agudeza mental ySentido del humor le permitieron sobrevivir donde la fuerza habría fracasado.'),
('b0000000-0000-0000-0000-000000000009', 'Daenerys Targaryen', ARRAY['Madre de Dragones', 'Daenerys Florentina'], 'a0000000-0000-0000-0000-000000000003', 'Valyrio', 'muerto', '284 AC', 'La última Targaryen, que nació en la tormenta, conquistó ciudades y murió en la luz de su propio dragón.'),
('b0000000-0000-0000-0000-000000000010', 'Robert Baratheon', ARRAY[], 'a0000000-0000-0000-0000-000000000004', 'Andal', 'muerto', '262 AC', 'Rey de los Siete Reinos, cuya rebelión contra los Targaryen cambió el destino de Poniente. Cazador y guerrero, pero pobre administrador de reinos.');

-- ── LUGARES ──

INSERT INTO locations (id, name, slug, region, description, map_x, map_y) VALUES
('c0000000-0000-0000-0000-000000000001', 'Invernalia', 'invernalia', 'El Norte', 'La fortaleza ancestral de los Stark, tallada en la roca viva bajo el cielo de un bosque de pinos centenarios.', 400, 80),
('c0000000-0000-0000-0000-000000000002', 'Roca Casterly', 'roca-casterly', 'Tierras del Oeste', 'La sede de los Lannister, tallada en una montaña de oro y piedra que domina todo el oeste.', 120, 250),
('c0000000-0000-0000-0000-000000000003', 'Desembarco del Rey', 'desembarco-del-rey', 'Corona', 'La capital de los Siete Reinos, sede del Trono de Hierro y del poder absoluto.', 350, 300),
('c0000000-0000-0000-0000-000000000004', 'Rocadragón', 'rocadragon', 'Islas del Estrecho', 'La isla fortaleza de los Targaryen, desde donde Aegon Conquistó seis reinos.', 500, 350);

-- ── EVENTOS ──

INSERT INTO events (id, title, slug, year_in_universe, description, location_id) VALUES
('d0000000-0000-0000-0000-000000000001', 'La llegada del rey', 'la-llegada-del-rey', '298 AC', 'Robert Baratheon viaja al Norte para pedir a Ned Stark que sea su Mano del Rey.', 'c0000000-0000-0000-0000-000000000001'),
('d0000000-0000-0000-0000-000000000002', 'La Boda Roja', 'la-boda-roja', '299 AC', 'La traición más famosa de Poniente. Robb Stark y su ejército son masacrados en una boda.', 'c0000000-0000-0000-0000-000000000001'),
('d0000000-0000-0000-0000-000000000003', 'La Conquista de los Siete Reinos', 'la-conquista-de-los-siete-reinos', '0 AC', 'Aegon Targaryen y sus dragones unificaron seis reinos bajo una sola corona.', 'c0000000-0000-0000-0000-000000000004'),
('d0000000-0000-0000-0000-000000000004', 'Batalla del Bosque Real', 'batalla-del-bosque-real', '299 AC', 'Stannis asedia Desembarco del Rey. La intervención de los Tyrell cambia el curso de la guerra.', 'c0000000-0000-0000-0000-000000000003');

-- ── RELACIONES FAMILIARES ──

INSERT INTO character_relations (character_id, related_character_id, relation_type) VALUES
('b0000000-0000-0000-0000-000000000001', 'b0000000-0000-0000-0000-000000000002', 'padre'),
('b0000000-0000-0000-0000-000000000001', 'b0000000-0000-0000-0000-000000000003', 'padre'),
('b0000000-0000-0000-0000-000000000001', 'b0000000-0000-0000-0000-000000000004', 'padre'),
('b0000000-0000-0000-0000-000000000002', 'b0000000-0000-0000-0000-000000000003', 'hermana'),
('b0000000-0000-0000-0000-000000000002', 'b0000000-0000-0000-0000-000000000004', 'hermana'),
('b0000000-0000-0000-0000-000000000003', 'b0000000-0000-0000-0000-000000000004', 'hermana');

-- ── RELACIONES ENTRE EVENTOS Y PERSONAJES ──

INSERT INTO event_characters (event_id, character_id) VALUES
('d0000000-0000-0000-0000-000000000001', 'b0000000-0000-0000-0000-000000000001'),
('d0000000-0000-0000-0000-000000000001', 'b0000000-0000-0000-0000-000000000010'),
('d0000000-0000-0000-0000-000000000002', 'b0000000-0000-0000-0000-000000000002'),
('d0000000-0000-0000-0000-000000000003', 'b0000000-0000-0000-0000-000000000009');
