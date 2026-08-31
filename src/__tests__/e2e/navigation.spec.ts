import { test, expect } from '@playwright/test'

test.describe('Navigation', () => {
  test('navigates to houses page', async ({ page }) => {
    await page.goto('/')
    await page.click('a[href="/houses"]')
    await expect(page).toHaveURL('/houses')
    await expect(page.locator('h2').first()).toContainText('Casas')
  })

  test('navigates to characters page', async ({ page }) => {
    await page.goto('/characters')
    await expect(page).toHaveURL('/characters')
    // Just verify the URL loaded
  })

  test('navigates to search page', async ({ page }) => {
    await page.goto('/search')
    await expect(page).toHaveURL('/search')
    await expect(page.locator('.search-input-wrapper')).toBeVisible()
  })

  test('navigates to timeline page', async ({ page }) => {
    await page.goto('/timeline')
    await expect(page.locator('.chronology')).toBeVisible()
    await expect(page.locator('.timeline-scroll')).toBeVisible()
  })

  test('navigates to battles page', async ({ page }) => {
    await page.goto('/battles')
    await expect(page.locator('.battles-page')).toBeVisible()
  })

  test('navigates to books page', async ({ page }) => {
    await page.goto('/books')
    await expect(page.locator('.volumes')).toBeVisible()
  })

  test('navigates to mysteries page', async ({ page }) => {
    await page.goto('/mysteries')
    await expect(page.locator('.forbidden')).toBeVisible()
  })

  test('shows 404 for unknown routes', async ({ page }) => {
    await page.goto('/nonexistent-page')
    await expect(page.locator('.not-found')).toBeVisible()
    await expect(page.locator('.not-found')).toContainText('404')
  })

  test('home page loads from brand link', async ({ page }) => {
    await page.goto('/')
    await expect(page.locator('.opening')).toBeVisible()
    await expect(page.locator('.brand')).toContainText('Archivo de Poniente')
  })
})
