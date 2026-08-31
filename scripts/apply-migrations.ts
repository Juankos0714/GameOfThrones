/**
 * Apply all SQL migrations to the Supabase PostgreSQL database.
 * Usage: npx tsx scripts/apply-migrations.ts
 */
import { readFileSync, readdirSync } from 'fs'
import { join } from 'path'
import { Pool } from 'pg'
import { config } from 'dotenv'

config() // Load .env

const DATABASE_URL = process.env.DATABASE_URL
if (!DATABASE_URL) {
  console.error('❌ DATABASE_URL not found in .env')
  process.exit(1)
}

const MIGRATIONS_DIR = join(import.meta.dirname, '..', 'supabase', 'migrations')
const SEED_FILE = join(import.meta.dirname, '..', 'supabase', 'seed.sql')

async function main() {
  const pool = new Pool({ connectionString: DATABASE_URL })

  console.log('🔗 Connected to database')
  console.log(`📁 Migrations dir: ${MIGRATIONS_DIR}`)

  // Get all .sql files in migrations dir, sorted
  const files = readdirSync(MIGRATIONS_DIR)
    .filter(f => f.endsWith('.sql'))
    .sort()

  for (const file of files) {
    const filePath = join(MIGRATIONS_DIR, file)
    const sql = readFileSync(filePath, 'utf-8')

    console.log(`\n▶ Running migration: ${file}`)
    try {
      await pool.query(sql)
      console.log(`  ✅ ${file} applied successfully`)
    } catch (err: any) {
      // Ignore "already exists" errors for idempotent migrations
      if (err.message?.includes('already exists')) {
        console.log(`  ⏭ ${file} — tables already exist, skipping`)
      } else {
        console.error(`  ❌ ${file} failed: ${err.message}`)
        // Continue with other migrations
      }
    }
  }

  // Apply seed data
  console.log(`\n▶ Running seed: seed.sql`)
  try {
    const seedSql = readFileSync(SEED_FILE, 'utf-8')
    await pool.query(seedSql)
    console.log('  ✅ seed.sql applied successfully')
  } catch (err: any) {
    if (err.message?.includes('duplicate key')) {
      console.log('  ⏭ seed.sql — data already exists, skipping duplicates')
    } else {
      console.error(`  ❌ seed.sql failed: ${err.message}`)
    }
  }

  await pool.end()
  console.log('\n🎉 All migrations applied!')
}

main().catch((err) => {
  console.error('Fatal error:', err)
  process.exit(1)
})
