/**
 * Supabase Database types
 * Generated from the schema.sql
 */

export interface Database {
  public: {
    Tables: {
      houses: {
        Row: {
          id: string
          slug: string
          name: string
          motto: string
          sigil: string
          region: string
          seat: string
          founded: string
          history: string
          palette: HousePalette
          atmosphere: string
        }
        Insert: Omit<HouseRow, 'id'>
        Update: Partial<Omit<HouseRow, 'id'>>
      }
      characters: {
        Row: {
          id: string
          slug: string
          name: string
          aliases: string[]
          titles: string[]
          house_id: string
          biography: string
          status: string
          portrait: string | null
          timeline: string
        }
        Insert: Omit<CharacterRow, 'id'>
        Update: Partial<Omit<CharacterRow, 'id'>>
      }
      books: {
        Row: {
          id: string
          slug: string
          title: string
          description: string
          cover: string | null
          order: number
        }
        Insert: Omit<BookRow, 'id'>
        Update: Partial<Omit<BookRow, 'id'>>
      }
      chapters: {
        Row: {
          id: string
          book_id: string
          pov: string
          title: string
          number: number
        }
        Insert: Omit<ChapterRow, 'id'>
        Update: Partial<Omit<ChapterRow, 'id'>>
      }
      places: {
        Row: {
          id: string
          slug: string
          name: string
          region: string
          description: string
          coordinates: { x: number; y: number }
        }
        Insert: Omit<PlaceRow, 'id'>
        Update: Partial<Omit<PlaceRow, 'id'>>
      }
      events: {
        Row: {
          id: string
          title: string
          description: string
          date: number
          place_id: string | null
          book_id: string | null
        }
        Insert: Omit<EventRow, 'id'>
        Update: Partial<Omit<EventRow, 'id'>>
      }
      battles: {
        Row: {
          id: string
          name: string
          date: string
          combatants: string[]
          description: string
          outcome: string
        }
        Insert: Omit<BattleRow, 'id'>
        Update: Partial<Omit<BattleRow, 'id'>>
      }
      prophecies: {
        Row: {
          id: string
          title: string
          description: string
          evidence: string
          interpretation: string
          status: string
        }
        Insert: Omit<ProphecyRow, 'id'>
        Update: Partial<Omit<ProphecyRow, 'id'>>
      }
      genealogy_relations: {
        Row: {
          id: string
          parent_id: string
          child_id: string
          type: string
        }
        Insert: Omit<GenealogyRow, 'id'>
        Update: Partial<Omit<GenealogyRow, 'id'>>
      }
      character_relations: {
        Row: {
          id: string
          character_a_id: string
          character_b_id: string
          type: string
        }
        Insert: Omit<CharacterRelationRow, 'id'>
        Update: Partial<Omit<CharacterRelationRow, 'id'>>
      }
      objects: {
        Row: {
          id: string
          name: string
          description: string
          owner_id: string | null
        }
        Insert: Omit<ObjectRow, 'id'>
        Update: Partial<Omit<ObjectRow, 'id'>>
      }
      dragons: {
        Row: {
          id: string
          name: string
          rider: string | null
          status: string
          description: string
        }
        Insert: Omit<DragonRow, 'id'>
        Update: Partial<Omit<DragonRow, 'id'>>
      }
    }
    Views: Record<string, never>
    Functions: Record<string, never>
  }
}

// Type aliases for convenience
type HouseRow = Database['public']['Tables']['houses']['Row']
type CharacterRow = Database['public']['Tables']['characters']['Row']
type BookRow = Database['public']['Tables']['books']['Row']
type ChapterRow = Database['public']['Tables']['chapters']['Row']
type PlaceRow = Database['public']['Tables']['places']['Row']
type EventRow = Database['public']['Tables']['events']['Row']
type BattleRow = Database['public']['Tables']['battles']['Row']
type ProphecyRow = Database['public']['Tables']['prophecies']['Row']
type GenealogyRow = Database['public']['Tables']['genealogy_relations']['Row']
type CharacterRelationRow = Database['public']['Tables']['character_relations']['Row']
type ObjectRow = Database['public']['Tables']['objects']['Row']
type DragonRow = Database['public']['Tables']['dragons']['Row']

interface HousePalette {
  primary: string
  deep: string
}
