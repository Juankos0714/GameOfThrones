import { test, expect } from '@playwright/test'

test.describe('Smoke', () => {
  test('home page loads', async ({ page }) => {
    await page.goto('/')
    await expect(page.locator('.opening')).toBeVisible()
    await expect(page.locator('h1')).toContainText('La memoria')
  })

  test('page title is correct', async ({ page }) => {
    await page.goto('/')
    await expect(page).toHaveTitle(/Archivo de Poniente/)
  })

  test('masthead renders with brand', async ({ page }) => {
    await page.goto('/')
    await expect(page.locator('.brand')).toContainText('Archivo de Poniente')
  })

  test('navigation links are present', async ({ page }) => {
    await page.goto('/')
    const nav = page.locator('.nav-main')
    await expect(nav).toContainText('casas')
    await expect(nav).toContainText('personajes')
    await expect(nav).toContainText('buscar')
  })

  test('footer renders', async ({ page }) => {
    await page.goto('/')
    await expect(page.locator('.site-footer')).toContainText('Archivo de Poniente')
  })
})
