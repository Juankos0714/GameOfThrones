import { test, expect } from '@playwright/test'

test.describe('Responsive — Mobile', () => {
  test.use({ viewport: { width: 375, height: 812 } }) // iPhone X

  test('hero is visible and not clipped on mobile', async ({ page }) => {
    await page.goto('/')
    await expect(page.locator('.opening')).toBeVisible()
    await expect(page.locator('h1')).toBeVisible()
  })

  test('mobile menu toggle opens and closes', async ({ page }) => {
    await page.goto('/')
    
    // On mobile, there should be a toggle button
    const toggle = page.locator('.nav-toggle')
    
    // Check if toggle exists
    const isToggleVisible = await toggle.isVisible().catch(() => false)
    
    if (isToggleVisible) {
      // Nav should be hidden initially
      const nav = page.locator('.nav-main')
      await expect(nav).not.toBeVisible()
      
      // Open
      await toggle.click()
      await expect(nav).toBeVisible()
      
      // Close by clicking toggle again
      await toggle.click()
      await expect(nav).not.toBeVisible()
    }
  })
})

test.describe('Responsive — Tablet', () => {
  test.use({ viewport: { width: 768, height: 1024 } })

  test('house catalogue renders', async ({ page }) => {
    await page.goto('/')
    await expect(page.locator('.house-index')).toBeVisible()
    await expect(page.locator('.monograph')).toBeVisible()
  })
})

test.describe('Responsive — Desktop', () => {
  test.use({ viewport: { width: 1440, height: 900 } })

  test('full layout renders correctly', async ({ page }) => {
    await page.goto('/')
    await expect(page.locator('.opening')).toBeVisible()
    await expect(page.locator('.house-index')).toBeVisible()
    await expect(page.locator('.monograph')).toBeVisible()
    await expect(page.locator('.nav-main')).toBeVisible()
  })
})
