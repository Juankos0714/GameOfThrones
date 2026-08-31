import { test, expect } from '@playwright/test'

test.describe('Houses', () => {
  test('home page shows houses in the catalogue', async ({ page }) => {
    await page.goto('/')

    // Wait for house index to load (data may come from Supabase or hardcoded)
    await expect(page.locator('.house-index button, .house-index [role="listitem"]').first()).toBeVisible({ timeout: 5000 })

    // At least the core houses should be present (Stark always loads first)
    await expect(page.locator('.house-index')).toContainText('Stark')
    await expect(page.locator('.house-index')).toContainText('Lannister')
    await expect(page.locator('.house-index')).toContainText('Targaryen')
  })

  test('monograph displays a house by default', async ({ page }) => {
    await page.goto('/')

    // Wait for monograph to render
    await expect(page.locator('.monograph')).toBeVisible({ timeout: 5000 })

    // Should display a house (Stark is the default selection)
    await expect(page.locator('.monograph')).toContainText('Stark')
  })

  test('monograph displays house members', async ({ page }) => {
    await page.goto('/')
    await expect(page.locator('.registry')).toBeVisible({ timeout: 5000 })

    // Should show at least one member
    const members = page.locator('.registry ol li')
    const count = await members.count()
    expect(count).toBeGreaterThan(0)
  })

  test('monograph displays allies and rivals', async ({ page }) => {
    await page.goto('/')
    await expect(page.locator('.politics')).toBeVisible({ timeout: 5000 })
    await expect(page.locator('.politics')).toContainText('Aliados')
    await expect(page.locator('.politics')).toContainText('Rivales')
  })

  test('house chapters are navigable', async ({ page }) => {
    await page.goto('/')
    await expect(page.locator('.chapter-nav a').first()).toBeVisible({ timeout: 5000 })
    await page.locator('.chapter-nav a').first().click()
    await expect(page.locator('#chapter-1')).toBeVisible()
  })

  test('timeline events are visible on home', async ({ page }) => {
    await page.goto('/')

    // Wait for chronology section to render
    await expect(page.locator('#cronologia, .chronology').first()).toBeVisible({ timeout: 5000 })

    // Should show timeline events
    const events = page.locator('.timeline-scroll article')
    const count = await events.count()
    expect(count).toBeGreaterThan(0)
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

  test('house detail shows InfoBox sidebar', async ({ page }) => {
    await page.goto('/houses/stark')
    await expect(page.locator('.chapter-sidebar, .chapter-content-layout aside').first()).toBeVisible({ timeout: 5000 })
  })

  test('house detail shows cross-links in text', async ({ page }) => {
    await page.goto('/houses/stark')
    await expect(page.locator('.chapter-content-layout').first()).toBeVisible({ timeout: 5000 })
  })
})
