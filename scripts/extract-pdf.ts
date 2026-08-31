/**
 * scripts/extract-pdf.ts
 *
 * Extrae texto de los PDFs de ASOIAF y lo guarda en data/extracted/
 * Uso: npx tsx scripts/extract-pdf.ts [nombre-archivo]
 *
 * Si no se pasa nombre, extrae todos los PDFs de src/books/
 */

import { readFileSync, writeFileSync, mkdirSync } from 'node:fs'
import { resolve, basename } from 'node:path'
import * as pdfjsLib from 'pdfjs-dist/legacy/build/pdf.mjs'

const PROJECT_ROOT = resolve(import.meta.dirname ?? '.', '..')
const BOOKS_DIR = resolve(PROJECT_ROOT, 'src', 'books')
const OUTPUT_DIR = resolve(PROJECT_ROOT, 'data', 'extracted')

// PDFs de ASOIAF (excluimos "Muerte de la luz" que no es ASOIAF)
const ASOIAF_PDFS = [
  'Juego de tronos ed ilustrada - George R R Martin.pdf',
  'Choque de reyes - George R. R. Martin.pdf',
  'Tormenta de espadas ed ilustrada - George R R Martin.pdf',
  'Festin de cuervos - George R. R. Martin.pdf',
  'Y la muerte su legado - George R R Martin.pdf',
  'El caballero de los Siete Reinos Ilustrado - George R R Martin.pdf',
  'El mundo de hielo y fuego Trad Espana - George R R Martin.pdf',
]

async function extractPdf(filename: string): Promise<{ text: string; pages: number }> {
  const path = resolve(BOOKS_DIR, filename)
  console.log(`📖 Extrayendo: ${filename}`)

  const data = new Uint8Array(readFileSync(path))
  const doc = await pdfjsLib.getDocument({ data }).promise

  console.log(`   📄 Páginas: ${doc.numPages}`)

  let fullText = ''

  for (let i = 1; i <= doc.numPages; i++) {
    const page = await doc.getPage(i)
    const content = await page.getTextContent()
    const pageText = content.items
      .map((item: any) => item.str)
      .join(' ')
    fullText += pageText + '\n\n'
  }

  console.log(`   📝 Caracteres: ${fullText.length.toLocaleString()}`)

  return { text: fullText, pages: doc.numPages }
}

function sanitizeFilename(filename: string): string {
  return basename(filename, '.pdf')
    .toLowerCase()
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-|-$/g, '')
}

async function main() {
  // Crear directorio de salida
  mkdirSync(OUTPUT_DIR, { recursive: true })

  const targetPdf = process.argv[2]

  const pdfsToProcess = targetPdf
    ? ASOIAF_PDFS.filter((f) => f.toLowerCase().includes(targetPdf.toLowerCase()))
    : ASOIAF_PDFS

  if (pdfsToProcess.length === 0) {
    console.error(`❌ No se encontró ningún PDF que coincida con "${targetPdf}"`)
    console.log('PDFs disponibles:')
    ASOIAF_PDFS.forEach((f) => console.log(`  - ${f}`))
    process.exit(1)
  }

  console.log(`\n═══════════════════════════════════════════════`)
  console.log(`  📚 EXTRACTOR DE PDFs — ASOIAF`)
  console.log(`═══════════════════════════════════════════════\n`)

  for (const pdf of pdfsToProcess) {
    try {
      const { text, pages } = await extractPdf(pdf)
      const outputName = sanitizeFilename(pdf) + '.txt'
      const outputPath = resolve(OUTPUT_DIR, outputName)

      writeFileSync(outputPath, text, 'utf-8')
      console.log(`   ✅ Guardado: ${outputName} (${pages} páginas)\n`)
    } catch (err) {
      console.error(`   ❌ Error procesando ${pdf}:`, err)
    }
  }

  console.log(`\n═══════════════════════════════════════════════`)
  console.log(`  ✨ Extracción completada`)
  console.log(`═══════════════════════════════════════════════`)
}

main()
