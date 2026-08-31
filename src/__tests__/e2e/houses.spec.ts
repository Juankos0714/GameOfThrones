import { test, expect } from '@playwright/test'

test.describe('Houses', () => {
  test('home page shows all 9 houses in the catalogue', async ({ page }) => {
    await page.goto('/')
    const houseNames = ['Stark', 'Lannister', 'Targaryen', 'Baratheon', 'Tyrell', 'Martell', 'Greyjoy', 'Arryn', 'Tully']

    for (const name of houseNames) {
      await expect(page.locator('.house-index')).toContainText(name)
    }
  })

  test('monograph displays Stark house by default', async ({ page }) => {
    await page.goto('/')
    await expect(page.locator('.monograph')).toContainText('Stark')
    await expect(page.locator('.monograph')).toContainText('Invernalia')
  })

  test('monograph displays house members', async ({ page }) => {
    await page.goto('/')
    await expect(page.locator('.registry')).toContainText('Eddard Stark')
    await expect(page.locator('.registry')).toContainText('Sansa Stark')
    await expect(page.locator('.registry')).toContainText('Arya Stark')
  })

  test('monograph displays allies and rivals', async ({ page }) => {
    await page.goto('/')
    await expect(page.locator('.politics')).toContainText('Aliados')
    await expect(page.locator('.politics')).toContainText('Rivales')
  })

  test('house chapters are navigable', async ({ page }) => {
    await page.goto('/')
    await page.locator('.chapter-nav a').first().click()
    await expect(page.locator('#chapter-1')).toBeVisible()
  })

  test('timeline events are visible on home', async ({ page }) => {
    await page.goto('/')
    await expect(page.locator('.chronology')).toBeVisible()
    await expect(page.locator('.timeline-scroll')).toBeVisible()
  })
})

test.describe('House detail pages', () => {
  const houses = [
    { slug: 'stark', name: 'Stark' },
    { slug: 'lannister', name: 'Lannister' },
    { slug: 'targaryen', name: 'Targaryen' },
  ]

  for (const house of houses) {
    test(`detail page for ${house.name} loads correctly`, async ({ page }) => {
      await page.goto(`/houses/${house.slug}`)
      await expect(page.locator('h2').first()).toContainText(house.name, { timeout: 5000 })
    })
  }
})
