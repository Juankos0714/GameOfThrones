-- =====================================================
-- ARCHIVO DE PONIENTE — Migración completa
-- Copia y pega este archivo en: Supabase → SQL Editor → Run
-- =====================================================

-- =====================================================
-- PARTE 1: Better Auth tables
-- =====================================================

CREATE TABLE IF NOT EXISTS "user" (
  id TEXT PRIMARY KEY DEFAULT replace(replace(cast(gen_random_uuid() as text), '-', ''), cast(gen_random_uuid() as text), ''),
  name TEXT NOT NULL DEFAULT '',
  email TEXT NOT NULL UNIQUE,
  "emailVerified" BOOLEAN NOT NULL DEFAULT FALSE,
  image TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS session (
  id TEXT PRIMARY KEY DEFAULT replace(replace(cast(gen_random_uuid() as text), '-', ''), cast(gen_random_uuid() as text), ''),
  "userId" TEXT NOT NULL REFERENCES "user"(id) ON DELETE CASCADE,
  "expiresAt" TIMESTAMPTZ NOT NULL,
  token TEXT NOT NULL UNIQUE,
  "ipAddress" TEXT,
  "userAgent" TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS account (
  id TEXT PRIMARY KEY DEFAULT replace(replace(cast(gen_random_uuid() as text), '-', ''), cast(gen_random_uuid() as text), ''),
  "userId" TEXT NOT NULL REFERENCES "user"(id) ON DELETE CASCADE,
  "accountId" TEXT NOT NULL,
  "providerId" TEXT NOT NULL,
  "password" TEXT,
  "accessToken" TEXT,
  "refreshToken" TEXT,
  "idToken" TEXT,
  "accessTokenExpiresAt" TIMESTAMPTZ,
  "refreshTokenExpiresAt" TIMESTAMPTZ,
  scope TEXT,
  "idTokenExpiresAt" TIMESTAMPTZ,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS verification (
  id TEXT PRIMARY KEY DEFAULT replace(replace(cast(gen_random_uuid() as text), '-', ''), cast(gen_random_uuid() as text), ''),
  identifier TEXT NOT NULL,
  value TEXT NOT NULL,
  "expiresAt" TIMESTAMPTZ NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_session_userId ON session("userId");
CREATE INDEX IF NOT EXISTS idx_session_token ON session(token);
CREATE INDEX IF NOT EXISTS idx_account_userId ON account("userId");
CREATE INDEX IF NOT EXISTS idx_account_providerId ON account("providerId");
CREATE INDEX IF NOT EXISTS idx_verification_identifier ON verification(identifier);

-- =====================================================
-- PARTE 2: Content tables (schema)
-- =====================================================

CREATE EXTENSION IF NOT EXISTS "pgcrypto";

CREATE TABLE IF NOT EXISTS houses (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL UNIQUE,
  slug TEXT NOT NULL UNIQUE,
  region TEXT,
  words TEXT,
  seat TEXT,
  sigil_url TEXT,
  colors TEXT,
  description TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS characters (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  slug TEXT UNIQUE,
  aliases TEXT[],
  house_id UUID REFERENCES houses(id) ON DELETE SET NULL,
  culture TEXT,
  status TEXT DEFAULT 'desconocido' CHECK (status IN ('vivo','muerto','desconocido')),
  born TEXT,
  died TEXT,
  description TEXT,
  image_url TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS character_relations (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  character_id UUID REFERENCES characters(id) ON DELETE CASCADE,
  related_character_id UUID REFERENCES characters(id) ON DELETE CASCADE,
  relation_type TEXT CHECK (relation_type IN ('padre','madre','hijo','hija','cónyuge','hermano','hermana')),
  UNIQUE (character_id, related_character_id, relation_type)
);

CREATE TABLE IF NOT EXISTS locations (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  slug TEXT NOT NULL UNIQUE,
  region TEXT,
  description TEXT,
  map_x NUMERIC,
  map_y NUMERIC,
  image_url TEXT
);

CREATE TABLE IF NOT EXISTS events (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  title TEXT NOT NULL,
  slug TEXT NOT NULL UNIQUE,
  year_in_universe TEXT,
  description TEXT,
  location_id UUID REFERENCES locations(id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS event_characters (
  event_id UUID REFERENCES events(id) ON DELETE CASCADE,
  character_id UUID REFERENCES characters(id) ON DELETE CASCADE,
  PRIMARY KEY (event_id, character_id)
);

CREATE TABLE IF NOT EXISTS revisions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  table_name TEXT NOT NULL,
  record_id UUID NOT NULL,
  changed_by TEXT,
  diff JSONB,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS profiles (
  id TEXT PRIMARY KEY REFERENCES "user"(id) ON DELETE CASCADE,
  role TEXT DEFAULT 'viewer' CHECK (role IN ('viewer','editor','admin')),
  created_at TIMESTAMPTZ DEFAULT now()
);

-- =====================================================
-- PARTE 3: Indexes
-- =====================================================

CREATE INDEX IF NOT EXISTS idx_characters_house_id ON characters(house_id);
CREATE INDEX IF NOT EXISTS idx_characters_name ON characters(name);
CREATE INDEX IF NOT EXISTS idx_characters_slug ON characters(slug);
CREATE INDEX IF NOT EXISTS idx_houses_name ON houses(name);
CREATE INDEX IF NOT EXISTS idx_houses_slug ON houses(slug);
CREATE INDEX IF NOT EXISTS idx_locations_name ON locations(name);
CREATE INDEX IF NOT EXISTS idx_locations_slug ON locations(slug);
CREATE INDEX IF NOT EXISTS idx_events_slug ON events(slug);
CREATE INDEX IF NOT EXISTS idx_events_year ON events(year_in_universe);
CREATE INDEX IF NOT EXISTS idx_events_location_id ON events(location_id);
CREATE INDEX IF NOT EXISTS idx_event_characters_event ON event_characters(event_id);
CREATE INDEX IF NOT EXISTS idx_event_characters_character ON event_characters(character_id);
CREATE INDEX IF NOT EXISTS idx_character_relations_character ON character_relations(character_id);
CREATE INDEX IF NOT EXISTS idx_character_relations_related ON character_relations(related_character_id);
CREATE INDEX IF NOT EXISTS idx_revisions_table ON revisions(table_name);
CREATE INDEX IF NOT EXISTS idx_revisions_record ON revisions(record_id);

-- =====================================================
-- PARTE 4: Full-text search
-- =====================================================

ALTER TABLE characters ADD COLUMN IF NOT EXISTS search_vector TSVECTOR
  GENERATED ALWAYS AS (
    to_tsvector('spanish', coalesce(name,'') || ' ' || coalesce(description,''))
  ) STORED;
CREATE INDEX IF NOT EXISTS idx_characters_search ON characters USING gin (search_vector);

ALTER TABLE houses ADD COLUMN IF NOT EXISTS search_vector TSVECTOR
  GENERATED ALWAYS AS (
    to_tsvector('spanish', coalesce(name,'') || ' ' || coalesce(description,''))
  ) STORED;
CREATE INDEX IF NOT EXISTS idx_houses_search ON houses USING gin (search_vector);

ALTER TABLE locations ADD COLUMN IF NOT EXISTS search_vector TSVECTOR
  GENERATED ALWAYS AS (
    to_tsvector('spanish', coalesce(name,'') || ' ' || coalesce(description,''))
  ) STORED;
CREATE INDEX IF NOT EXISTS idx_locations_search ON locations USING gin (search_vector);

ALTER TABLE events ADD COLUMN IF NOT EXISTS search_vector TSVECTOR
  GENERATED ALWAYS AS (
    to_tsvector('spanish', coalesce(title,'') || ' ' || coalesce(description,''))
  ) STORED;
CREATE INDEX IF NOT EXISTS idx_events_search ON events USING gin (search_vector);

-- =====================================================
-- PARTE 5: RLS (Row Level Security)
-- =====================================================

ALTER TABLE houses ENABLE ROW LEVEL SECURITY;
ALTER TABLE characters ENABLE ROW LEVEL SECURITY;
ALTER TABLE locations ENABLE ROW LEVEL SECURITY;
ALTER TABLE events ENABLE ROW LEVEL SECURITY;
ALTER TABLE character_relations ENABLE ROW LEVEL SECURITY;
ALTER TABLE event_characters ENABLE ROW LEVEL SECURITY;
ALTER TABLE revisions ENABLE ROW LEVEL SECURITY;

-- Drop existing policies to avoid conflicts
DO $$ BEGIN
  DROP POLICY IF EXISTS "lectura_publica" ON houses;
  DROP POLICY IF EXISTS "lectura_publica" ON characters;
  DROP POLICY IF EXISTS "lectura_publica" ON locations;
  DROP POLICY IF EXISTS "lectura_publica" ON events;
  DROP POLICY IF EXISTS "lectura_publica" ON character_relations;
  DROP POLICY IF EXISTS "lectura_publica" ON event_characters;
  DROP POLICY IF EXISTS "admin_read_revisions" ON revisions;
EXCEPTION WHEN OTHERS THEN NULL;
END $$;

-- Public read access for all content tables
CREATE POLICY "lectura_publica" ON houses FOR SELECT USING (true);
CREATE POLICY "lectura_publica" ON characters FOR SELECT USING (true);
CREATE POLICY "lectura_publica" ON locations FOR SELECT USING (true);
CREATE POLICY "lectura_publica" ON events FOR SELECT USING (true);
CREATE POLICY "lectura_publica" ON character_relations FOR SELECT USING (true);
CREATE POLICY "lectura_publica" ON event_characters FOR SELECT USING (true);
CREATE POLICY "admin_read_revisions" ON revisions FOR SELECT USING (true);

-- =====================================================
-- PARTE 6: Full-text search function
-- =====================================================

CREATE OR REPLACE FUNCTION search_all(query TEXT)
RETURNS TABLE (
  entity_type TEXT,
  entity_id UUID,
  title TEXT,
  subtitle TEXT,
  rank REAL
) AS $$
BEGIN
  RETURN QUERY
  SELECT
    'character'::TEXT,
    c.id,
    c.name,
    h.name AS subtitle,
    ts_rank(c.search_vector, plainto_tsquery('spanish', query)) AS rank
  FROM characters c
  LEFT JOIN houses h ON c.house_id = h.id
  WHERE c.search_vector @@ plainto_tsquery('spanish', query)

  UNION ALL

  SELECT
    'house'::TEXT,
    h.id,
    h.name,
    h.region AS subtitle,
    ts_rank(h.search_vector, plainto_tsquery('spanish', query)) AS rank
  FROM houses h
  WHERE h.search_vector @@ plainto_tsquery('spanish', query)

  UNION ALL

  SELECT
    'location'::TEXT,
    l.id,
    l.name,
    l.region AS subtitle,
    ts_rank(l.search_vector, plainto_tsquery('spanish', query)) AS rank
  FROM locations l
  WHERE l.search_vector @@ plainto_tsquery('spanish', query)

  UNION ALL

  SELECT
    'event'::TEXT,
    e.id,
    e.title,
    e.year_in_universe AS subtitle,
    ts_rank(e.search_vector, plainto_tsquery('spanish', query)) AS rank
  FROM events e
  WHERE e.search_vector @@ plainto_tsquery('spanish', query)

  ORDER BY rank DESC;
END;
$$ LANGUAGE plpgsql STABLE;

-- =====================================================
-- PARTE 7: Seed data (4 casas, 10 personajes, 4 lugares, 4 eventos)
-- =====================================================

INSERT INTO houses (id, name, slug, region, words, seat, colors, description) VALUES
('a0000000-0000-0000-0000-000000000001', 'Stark', 'stark', 'El Norte', 'Se acerca el invierno', 'Invernalia', 'gris, blanco', 'Una estirpe antigua que gobernó el Norte como Reyes del Invierno antes de inclinarse ante el dragón.'),
('a0000000-0000-0000-0000-000000000002', 'Lannister', 'lannister', 'Tierras del Oeste', 'Oye mi rugido', 'Roca Casterly', 'dorado, carmesí', 'Una dinastía cuya riqueza mineral sostiene una maquinaria de alianzas, préstamos y silencios calculados.'),
('a0000000-0000-0000-0000-000000000003', 'Targaryen', 'targaryen', 'Rocadragón', 'Fuego y sangre', 'Rocadragón', 'púrpura, negro', 'La última gran sangre de Valyria unificó seis reinos mediante dragones y dejó una corona marcada por profecía y ruina.'),
('a0000000-0000-0000-0000-000000000004', 'Baratheon', 'baratheon', 'Tierras de la Tormenta', 'Nuestra es la furia', 'Bastión de Tormentas', 'negro, dorado', 'Forjada entre la tormenta y la conquista, su línea convirtió una rebelión victoriosa en una dinastía fracturada.')
ON CONFLICT (name) DO NOTHING;

INSERT INTO characters (id, name, aliases, house_id, culture, status, born, description) VALUES
('b0000000-0000-0000-0000-000000000001', 'Eddard Stark', ARRAY['Ned']::text[], 'a0000000-0000-0000-0000-000000000001', 'Norteño', 'muerto', '263 AC', 'Señor de Invernalia y Guarda del Rey. Hombre de honor inquebrantable.'),
('b0000000-0000-0000-0000-000000000002', 'Sansa Stark', ARRAY[]::text[], 'a0000000-0000-0000-0000-000000000001', 'Norteño', 'vivo', '286 AC', 'Hija de Eddard y Catelyn. Reina del Norte.'),
('b0000000-0000-0000-0000-000000000003', 'Arya Stark', ARRAY['Arya del Pie Descalzo']::text[], 'a0000000-0000-0000-0000-000000000001', 'Norteño', 'vivo', '289 AC', 'Hija menor de Ned Stark, cuyo viaje la forjó en algo extraordinario.'),
('b0000000-0000-0000-0000-000000000004', 'Bran Stark', ARRAY['Bran el Roto']::text[], 'a0000000-0000-0000-0000-000000000001', 'Norteño', 'vivo', '290 AC', 'El hijo que cayó y se levantó como el Cuervos de Tres Ojos.'),
('b0000000-0000-0000-0000-000000000005', 'Jon Nieve', ARRAY['Aegon Targaryen']::text[], 'a0000000-0000-0000-0000-000000000001', 'Norteño', 'vivo', '283 AC', 'Hijo secreto de Rhaegar Targaryen y Lyanna Stark.'),
('b0000000-0000-0000-0000-000000000006', 'Tywin Lannister', ARRAY[]::text[], 'a0000000-0000-0000-0000-000000000002', 'Occidental', 'muerto', '242 AC', 'Señor de Roca Casterly y Mano del Rey. Estratega implacable.'),
('b0000000-0000-0000-0000-000000000007', 'Cersei Lannister', ARRAY[]::text[], 'a0000000-0000-0000-0000-000000000002', 'Occidental', 'muerto', '266 AC', 'Reina de los Siete Reinos, hija de Tywin.'),
('b0000000-0000-0000-0000-000000000008', 'Tyrion Lannister', ARRAY['El Duende']::text[], 'a0000000-0000-0000-0000-000000000002', 'Occidental', 'vivo', '273 AC', 'El menor de los Lannister, cuya agudeza mental le permitió sobrevivir.'),
('b0000000-0000-0000-0000-000000000009', 'Daenerys Targaryen', ARRAY['Madre de Dragones']::text[], 'a0000000-0000-0000-0000-000000000003', 'Valyrio', 'muerto', '284 AC', 'La última Targaryen, que nació en la tormenta y conquistó ciudades.'),
('b0000000-0000-0000-0000-000000000010', 'Robert Baratheon', ARRAY[]::text[], 'a0000000-0000-0000-0000-000000000004', 'Andal', 'muerto', '262 AC', 'Rey de los Siete Reinos, cuya rebelión cambió el destino de Poniente.')
ON CONFLICT DO NOTHING;

INSERT INTO locations (id, name, slug, region, description, map_x, map_y) VALUES
('c0000000-0000-0000-0000-000000000001', 'Invernalia', 'invernalia', 'El Norte', 'La fortaleza ancestral de los Stark.', 400, 80),
('c0000000-0000-0000-0000-000000000002', 'Roca Casterly', 'roca-casterly', 'Tierras del Oeste', 'La sede de los Lannister.', 120, 250),
('c0000000-0000-0000-0000-000000000003', 'Desembarco del Rey', 'desembarco-del-rey', 'Corona', 'La capital de los Siete Reinos.', 350, 300),
('c0000000-0000-0000-0000-000000000004', 'Rocadragón', 'rocadragon', 'Islas del Estrecho', 'La isla fortaleza de los Targaryen.', 500, 350)
ON CONFLICT (slug) DO NOTHING;

INSERT INTO events (id, title, slug, year_in_universe, description, location_id) VALUES
('d0000000-0000-0000-0000-000000000001', 'La llegada del rey', 'la-llegada-del-rey', '298 AC', 'Robert Baratheon viaja al Norte.', 'c0000000-0000-0000-0000-000000000001'),
('d0000000-0000-0000-0000-000000000002', 'La Boda Roja', 'la-boda-roja', '299 AC', 'La traición más famosa de Poniente.', 'c0000000-0000-0000-0000-000000000001'),
('d0000000-0000-0000-0000-000000000003', 'La Conquista de los Siete Reinos', 'la-conquista-de-los-siete-reinos', '0 AC', 'Aegon Targaryen unificó seis reinos.', 'c0000000-0000-0000-0000-000000000004'),
('d0000000-0000-0000-0000-000000000004', 'Batalla del Bosque Real', 'batalla-del-bosque-real', '299 AC', 'Stannis asedia Desembarco del Rey.', 'c0000000-0000-0000-0000-000000000003')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO character_relations (character_id, related_character_id, relation_type) VALUES
('b0000000-0000-0000-0000-000000000001', 'b0000000-0000-0000-0000-000000000002', 'padre'),
('b0000000-0000-0000-0000-000000000001', 'b0000000-0000-0000-0000-000000000003', 'padre'),
('b0000000-0000-0000-0000-000000000001', 'b0000000-0000-0000-0000-000000000004', 'padre'),
('b0000000-0000-0000-0000-000000000002', 'b0000000-0000-0000-0000-000000000003', 'hermana'),
('b0000000-0000-0000-0000-000000000002', 'b0000000-0000-0000-0000-000000000004', 'hermana'),
('b0000000-0000-0000-0000-000000000003', 'b0000000-0000-0000-0000-000000000004', 'hermana')
ON CONFLICT DO NOTHING;

INSERT INTO event_characters (event_id, character_id) VALUES
('d0000000-0000-0000-0000-000000000001', 'b0000000-0000-0000-0000-000000000001'),
('d0000000-0000-0000-0000-000000000001', 'b0000000-0000-0000-0000-000000000010'),
('d0000000-0000-0000-0000-000000000002', 'b0000000-0000-0000-0000-000000000002'),
('d0000000-0000-0000-0000-000000000003', 'b0000000-0000-0000-0000-000000000009')
ON CONFLICT DO NOTHING;

-- =====================================================
-- ¡Migración completa! 🎉
-- =====================================================
