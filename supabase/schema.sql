-- =====================================================
-- ARCHIVO DE PONIENTE - Supabase Schema
-- =====================================================

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- =====================================================
-- TABLES
-- =====================================================

-- Casas nobles
CREATE TABLE houses (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL UNIQUE,
  slug TEXT NOT NULL UNIQUE,   -- para URLs limpias y upserts idempotentes
  region TEXT,
  words TEXT,               -- lema de la casa
  seat TEXT,                -- castillo/asiento
  sigil_url TEXT,
  colors TEXT,
  description TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- Personajes
CREATE TABLE characters (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
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

-- Relaciones familiares
CREATE TABLE character_relations (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  character_id UUID REFERENCES characters(id) ON DELETE CASCADE,
  related_character_id UUID REFERENCES characters(id) ON DELETE CASCADE,
  relation_type TEXT CHECK (relation_type IN ('padre','madre','hijo','hija','cónyuge','hermano','hermana')),
  UNIQUE (character_id, related_character_id, relation_type)
);

-- Lugares
CREATE TABLE locations (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  slug TEXT NOT NULL UNIQUE,   -- para URLs limpias y upserts idempotentes
  region TEXT,
  description TEXT,
  map_x NUMERIC,
  map_y NUMERIC,
  image_url TEXT
);

-- Eventos
CREATE TABLE events (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  title TEXT NOT NULL,
  slug TEXT NOT NULL UNIQUE,   -- para URLs limpias y upserts idempotentes
  year_in_universe TEXT,
  description TEXT,
  location_id UUID REFERENCES locations(id) ON DELETE SET NULL
);

CREATE TABLE event_characters (
  event_id UUID REFERENCES events(id) ON DELETE CASCADE,
  character_id UUID REFERENCES characters(id) ON DELETE CASCADE,
  PRIMARY KEY (event_id, character_id)
);

-- Historial de revisiones (para moderación)
CREATE TABLE revisions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  table_name TEXT NOT NULL,
  record_id UUID NOT NULL,
  changed_by TEXT,
  diff JSONB,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- Better Auth genera sus propias tablas (user, session, account, verification)
-- en el esquema public. Profiles extiende con el rol.
-- NOTA: El tipo de `id` debe ajustarse al que genere Better Auth
-- (por defecto suele ser texto, no uuid) antes de fijar este esquema.
CREATE TABLE profiles (
  id TEXT PRIMARY KEY REFERENCES "user"(id) ON DELETE CASCADE,
  role TEXT DEFAULT 'viewer' CHECK (role IN ('viewer','editor','admin')),
  created_at TIMESTAMPTZ DEFAULT now()
);

-- =====================================================
-- INDEXES
-- =====================================================

CREATE INDEX idx_characters_house_id ON characters(house_id);
CREATE INDEX idx_characters_name ON characters(name);
CREATE INDEX idx_houses_name ON houses(name);
CREATE INDEX idx_houses_slug ON houses(slug);
CREATE INDEX idx_locations_name ON locations(name);
CREATE INDEX idx_locations_slug ON locations(slug);
CREATE INDEX idx_events_slug ON events(slug);
CREATE INDEX idx_events_year ON events(year_in_universe);
CREATE INDEX idx_events_location_id ON events(location_id);
CREATE INDEX idx_event_characters_event ON event_characters(event_id);
CREATE INDEX idx_event_characters_character ON event_characters(character_id);
CREATE INDEX idx_character_relations_character ON character_relations(character_id);
CREATE INDEX idx_character_relations_related ON character_relations(related_character_id);
CREATE INDEX idx_revisions_table ON revisions(table_name);
CREATE INDEX idx_revisions_record ON revisions(record_id);

-- Búsqueda full-text (repite el patrón en houses/locations)
ALTER TABLE characters ADD COLUMN search_vector TSVECTOR
  GENERATED ALWAYS AS (
    to_tsvector('spanish', coalesce(name,'') || ' ' || coalesce(description,''))
  ) STORED;
CREATE INDEX idx_characters_search ON characters USING gin (search_vector);

ALTER TABLE houses ADD COLUMN search_vector TSVECTOR
  GENERATED ALWAYS AS (
    to_tsvector('spanish', coalesce(name,'') || ' ' || coalesce(description,''))
  ) STORED;
CREATE INDEX idx_houses_search ON houses USING gin (search_vector);

ALTER TABLE locations ADD COLUMN search_vector TSVECTOR
  GENERATED ALWAYS AS (
    to_tsvector('spanish', coalesce(name,'') || ' ' || coalesce(description,''))
  ) STORED;
CREATE INDEX idx_locations_search ON locations USING gin (search_vector);

ALTER TABLE events ADD COLUMN search_vector TSVECTOR
  GENERATED ALWAYS AS (
    to_tsvector('spanish', coalesce(title,'') || ' ' || coalesce(description,''))
  ) STORED;
CREATE INDEX idx_events_search ON events USING gin (search_vector);

-- =====================================================
-- ROW LEVEL SECURITY (RLS)
-- =====================================================

-- Habilitar RLS en tablas de contenido
ALTER TABLE houses ENABLE ROW LEVEL SECURITY;
ALTER TABLE characters ENABLE ROW LEVEL SECURITY;
ALTER TABLE locations ENABLE ROW LEVEL SECURITY;
ALTER TABLE events ENABLE ROW LEVEL SECURITY;
ALTER TABLE character_relations ENABLE ROW LEVEL SECURITY;
ALTER TABLE event_characters ENABLE ROW LEVEL SECURITY;
ALTER TABLE revisions ENABLE ROW LEVEL SECURITY;

-- Lectura pública. No se agregan políticas de insert/update/delete para
-- anon/authenticated: sin una política que lo permita, esos roles no pueden
-- escribir. Solo la service_role key (usada desde el servidor, nunca desde
-- el navegador) puede saltarse RLS.
CREATE POLICY "lectura_publica" ON houses FOR SELECT USING (true);
CREATE POLICY "lectura_publica" ON characters FOR SELECT USING (true);
CREATE POLICY "lectura_publica" ON locations FOR SELECT USING (true);
CREATE POLICY "lectura_publica" ON events FOR SELECT USING (true);
CREATE POLICY "lectura_publica" ON character_relations FOR SELECT USING (true);
CREATE POLICY "lectura_publica" ON event_characters FOR SELECT USING (true);

-- Revisiones: solo admin puede leer
CREATE POLICY "admin_read_revisions" ON revisions FOR SELECT
  USING (true);  -- El servidor filtra por rol antes de consultar

-- =====================================================
-- FULL-TEXT SEARCH FUNCTION
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
