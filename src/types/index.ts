/**
 * Houses (existing hardcoded data)
 */
export interface House {
  id: string
  slug: string
  name: string
  motto: string
  sigil: string
  region: string
  seat: string
  founded: string
  material: string
  summary: string
  history: string
  palette: HousePalette
  members: HouseMember[]
  allies: string[]
  rivals: string[]
  lands: string[]
  events: string[]
}

export interface HousePalette {
  primary: string
  deep: string
}

export interface HouseMember {
  name: string
  title: string
  status: 'alive' | 'deceased' | 'unknown'
}

/**
 * Characters (existing hardcoded data)
 */
export interface Character {
  id: string
  slug: string
  name: string
  aliases: string[]
  titles: string[]
  houseId: string
  biography: string
  status: 'alive' | 'deceased' | 'unknown'
  portrait: string | null
  timeline: string
}

/**
 * Books
 */
export interface Book {
  id: string
  slug: string
  title: string
  description: string
  cover: string | null
  order: number
}

export interface Chapter {
  id: string
  bookId: string
  pov: string
  title: string
  number: number
}

/**
 * Places
 */
export interface Place {
  id: string
  slug: string
  name: string
  region: string
  description: string
  coordinates: { x: number; y: number }
}

/**
 * Events
 */
export interface TimelineEvent {
  id: string
  title: string
  description: string
  date: number
  placeId?: string
  bookId?: string
}

/**
 * Battles
 */
export interface Battle {
  id: string
  name: string
  date: string
  combatants: string[]
  description: string
  outcome: string
  houseIds: string[]
}

/**
 * Prophecies & Mysteries
 */
export interface Prophecy {
  id: string
  title: string
  description: string
  evidence: string
  interpretation: string
  status: 'canon' | 'evidence' | 'interpretation' | 'theory' | 'unresolved'
}

/**
 * Genealogy
 */
export interface GenealogyRelation {
  id: string
  parentId: string
  childId: string
  type: 'blood' | 'marriage' | 'adoption'
}

export interface CharacterRelation {
  id: string
  characterAId: string
  characterBId: string
  type: string
}

/**
 * Objects & Dragons
 */
export interface Artifact {
  id: string
  name: string
  description: string
  ownerId?: string
}

export interface Dragon {
  id: string
  name: string
  rider?: string
  status: 'alive' | 'deceased'
  description: string
}

/**
 * User & Auth
 */
export interface User {
  id: string
  email: string
  role: 'viewer' | 'editor' | 'admin'
}

export interface AuthState {
  user: User | null
  isAuthenticated: boolean
}

/**
 * UI State
 */
export type HouseSlug = 'stark' | 'lannister' | 'targaryen' | 'baratheon' | 'tyrell' | 'martell' | 'greyjoy' | 'arryn' | 'tully'

export interface UiState {
  activeHouse: HouseSlug
  menuOpen: boolean
  theme: 'dark' | 'light'
  globalSearch: string
  loading: boolean
}

/**
 * Supabase Database Schema Types (new schema)
 */
export interface DbHouse {
  id: string
  name: string
  region: string | null
  words: string | null
  seat: string | null
  sigil_url: string | null
  colors: string | null
  description: string | null
  created_at: string
}

export interface DbCharacter {
  id: string
  name: string
  aliases: string[] | null
  house_id: string | null
  culture: string | null
  status: string
  born: string | null
  died: string | null
  description: string | null
  image_url: string | null
  created_at: string
}

export interface DbLocation {
  id: string
  name: string
  region: string | null
  description: string | null
  map_x: number | null
  map_y: number | null
  image_url: string | null
}

export interface DbEvent {
  id: string
  title: string
  year_in_universe: string | null
  description: string | null
  location_id: string | null
}

export interface DbCharacterRelation {
  id: string
  character_id: string
  related_character_id: string
  relation_type: string
}

export interface DbRevision {
  id: string
  table_name: string
  record_id: string
  changed_by: string | null
  diff: Record<string, unknown> | null
  created_at: string
}

export interface DbProfile {
  id: string
  role: 'viewer' | 'editor' | 'admin'
  created_at: string
}

/**
 * Search result from the full-text search function
 */
export interface SearchResultRow {
  entity_type: string
  entity_id: string
  title: string
  subtitle: string
  rank: number
}
