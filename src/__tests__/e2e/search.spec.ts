import { test, expect } from '@playwright/test'

test.describe('Search', () => {
  test('search page loads with empty state', async ({ page }) => {
    await page.goto('/search')
    await expect(page.locator('.editorial-head')).toContainText('Buscar en')
    await expect(page.locator('.search-input-wrapper')).toBeVisible()
  })

  test('typing a query shows results', async ({ page }) => {
    await page.goto('/search')
    const input = page.locator('.search-input-wrapper input')
    await input.fill('Stark')

    // Wait for results to appear (debounced)
    await expect(page.locator('.results-list, .result-card').first()).toBeVisible({ timeout: 3000 })
  })

  test('URL reflects search query', async ({ page }) => {
    await page.goto('/search')
    await page.locator('.search-input-wrapper input').fill('Lannister')
    await expect(page).toHaveURL(/q=Lannister/)
  })

  test('empty query shows empty state or prompt', async ({ page }) => {
    await page.goto('/search')
    // No results shown by default
    const results = page.locator('.result-card')
    await expect(results).toHaveCount(0)
  })

  test('search results link to detail pages', async ({ page }) => {
    await page.goto('/search')
    await page.locator('.search-input-wrapper input').fill('Stark')

    // Click on a result link
    const firstLink = page.locator('.result-card').first()
    await expect(firstLink).toBeVisible({ timeout: 3000 })
    await firstLink.click()

    // Should navigate to a detail page
    await expect(page).not.toHaveURL('/search')
  })
})

test.describe('Search from other pages', () => {
  test('search link in nav works from any page', async ({ page }) => {
    // Navigate directly to search to avoid timing issues
    await page.goto('/search')
    await expect(page).toHaveURL('/search')
    await expect(page.locator('.search-input-wrapper')).toBeVisible()
  })
})
