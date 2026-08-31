# Instructions

- Following Playwright test failed.
- Explain why, be concise, respect Playwright best practices.
- Provide a snippet of code with the fix, if possible.

# Test info

- Name: houses.spec.ts >> Houses >> home page shows all 9 houses in the catalogue
- Location: src\__tests__\e2e\houses.spec.ts:4:3

# Error details

```
Error: page.goto: Target page, context or browser has been closed
```

# Test source

```ts
  1  | import { test, expect } from '@playwright/test'
  2  | 
  3  | test.describe('Houses', () => {
  4  |   test('home page shows all 9 houses in the catalogue', async ({ page }) => {
> 5  |     await page.goto('/')
     |                ^ Error: page.goto: Target page, context or browser has been closed
  6  |     const houseNames = ['Stark', 'Lannister', 'Targaryen', 'Baratheon', 'Tyrell', 'Martell', 'Greyjoy', 'Arryn', 'Tully']
  7  | 
  8  |     for (const name of houseNames) {
  9  |       await expect(page.locator('.house-index')).toContainText(name)
  10 |     }
  11 |   })
  12 | 
  13 |   test('monograph displays Stark house by default', async ({ page }) => {
  14 |     await page.goto('/')
  15 |     await expect(page.locator('.monograph')).toContainText('Stark')
  16 |     await expect(page.locator('.monograph')).toContainText('Invernalia')
  17 |   })
  18 | 
  19 |   test('monograph displays house members', async ({ page }) => {
  20 |     await page.goto('/')
  21 |     await expect(page.locator('.registry')).toContainText('Eddard Stark')
  22 |     await expect(page.locator('.registry')).toContainText('Sansa Stark')
  23 |     await expect(page.locator('.registry')).toContainText('Arya Stark')
  24 |   })
  25 | 
  26 |   test('monograph displays allies and rivals', async ({ page }) => {
  27 |     await page.goto('/')
  28 |     await expect(page.locator('.politics')).toContainText('Aliados')
  29 |     await expect(page.locator('.politics')).toContainText('Rivales')
  30 |   })
  31 | 
  32 |   test('house chapters are navigable', async ({ page }) => {
  33 |     await page.goto('/')
  34 |     await page.locator('.chapter-nav a').first().click()
  35 |     await expect(page.locator('#chapter-1')).toBeVisible()
  36 |   })
  37 | 
  38 |   test('timeline events are visible on home', async ({ page }) => {
  39 |     await page.goto('/')
  40 |     await expect(page.locator('.chronology')).toBeVisible()
  41 |     await expect(page.locator('.timeline-scroll')).toBeVisible()
  42 |   })
  43 | })
  44 | 
  45 | test.describe('House detail pages', () => {
  46 |   const houses = [
  47 |     { slug: 'stark', name: 'Stark' },
  48 |     { slug: 'lannister', name: 'Lannister' },
  49 |     { slug: 'targaryen', name: 'Targaryen' },
  50 |   ]
  51 | 
  52 |   for (const house of houses) {
  53 |     test(`detail page for ${house.name} loads correctly`, async ({ page }) => {
  54 |       await page.goto(`/houses/${house.slug}`)
  55 |       await expect(page.locator('h2').first()).toContainText(house.name, { timeout: 5000 })
  56 |     })
  57 |   }
  58 | })
  59 | 
```