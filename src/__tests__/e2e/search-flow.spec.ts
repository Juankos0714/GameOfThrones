import { test, expect } from '@playwright/test'

test.describe('Search → Character Detail → Cross-Link Flow', () => {
  test('search for a character and navigate to their detail page', async ({ page }) => {
    // 1. Go to search page
    await page.goto('/search')
    await expect(page.locator('.search-input-wrapper')).toBeVisible()

    // 2. Search for "Stark" (should find houses and characters)
    const input = page.locator('.search-input-wrapper input')
    await input.fill('Stark')

    // 3. Wait for results to appear (debounced search)
    await expect(page.locator('.result-card').first()).toBeVisible({ timeout: 5000 })

    // 4. Verify we have multiple result types
    const results = page.locator('.result-card')
    const count = await results.count()
    expect(count).toBeGreaterThanOrEqual(2)

    // 5. Click on a character result (look for "Personaje" type label)
    const characterResult = page.locator('.result-card').filter({ hasText: 'Personaje' }).first()
    if (await characterResult.count() > 0) {
      await characterResult.click()

      // 6. Should navigate to a character detail page (not search anymore)
      await expect(page).not.toHaveURL('/search')

      // 7. Character detail page should show the character name
      await expect(page.locator('h1, .character-meta h1, .monograph-hero h2').first()).toBeVisible({ timeout: 5000 })
    }
  })

  test('search for a house and navigate to house detail', async ({ page }) => {
    await page.goto('/search')
    const input = page.locator('.search-input-wrapper input')
    await input.fill('Lannister')

    await expect(page.locator('.result-card').first()).toBeVisible({ timeout: 5000 })

    // Click on a house result
    const houseResult = page.locator('.result-card').filter({ hasText: 'Casa' }).first()
    if (await houseResult.count() > 0) {
      await houseResult.click()

      // Should navigate to house detail
      await expect(page).not.toHaveURL('/search')
      await expect(page.locator('.monograph, .chapter-content-layout').first()).toBeVisible({ timeout: 5000 })
    }
  })

  test('URL syncs search query with vue-qs', async ({ page }) => {
    await page.goto('/search')
    await page.locator('.search-input-wrapper input').fill('Targaryen')

    // URL should contain the query parameter
    await expect(page).toHaveURL(/q=Targaryen/)

    // Clear and search again
    await page.locator('.search-input-wrapper input').fill('Bran')
    await expect(page).toHaveURL(/q=Bran/)
  })

  test('clear search resets results', async ({ page }) => {
    await page.goto('/search')
    await page.locator('.search-input-wrapper input').fill('Stark')
    await expect(page.locator('.result-card').first()).toBeVisible({ timeout: 5000 })

    // Click clear button if present
    const clearBtn = page.locator('.clear-btn')
    if (await clearBtn.isVisible()) {
      await clearBtn.click()
      await expect(page.locator('.result-card')).toHaveCount(0)
    }
  })

  test('search results show correct type labels', async ({ page }) => {
    await page.goto('/search')
    await page.locator('.search-input-wrapper input').fill('Stark')
    await expect(page.locator('.result-card').first()).toBeVisible({ timeout: 5000 })

    // Verify type labels are present
    const typeLabels = page.locator('.result-type span')
    const count = await typeLabels.count()
    expect(count).toBeGreaterThan(0)

    // At least one should be "Casa" or "Personaje"
    const firstLabel = await typeLabels.first().textContent()
    expect(['Casa', 'Personaje', 'Lugar', 'Evento', 'Libro']).toContain(firstLabel?.trim())
  })

  test('cross-link from character detail goes to house page', async ({ page }) => {
    // Navigate directly to a character detail page
    await page.goto('/characters/jon-nieve')

    // Should show character info
    await expect(page.locator('.character-meta h1, h1').first()).toContainText('Jon', { timeout: 5000 })

    // Look for house cross-link
    const houseLink = page.locator('.house-link, a[href*="/houses/"]').first()
    if (await houseLink.isVisible()) {
      await houseLink.click()

      // Should navigate to a house detail page
      await expect(page).toHaveURL(/\/houses\//)
      await expect(page.locator('.monograph, .chapter-content-layout').first()).toBeVisible({ timeout: 5000 })
    }
  })

  test('back link from character detail returns to character list', async ({ page }) => {
    await page.goto('/characters/jon-nieve')
    await expect(page.locator('.character-meta h1, h1').first()).toContainText('Jon', { timeout: 5000 })

    // Look for back link
    const backLink = page.locator('.back-link, a[href="/characters"]').first()
    if (await backLink.isVisible()) {
      await backLink.click()
      await expect(page).toHaveURL('/characters')
    }
  })

  test('house detail page loads from direct URL', async ({ page }) => {
    await page.goto('/houses/stark')

    // Should show house detail with InfoBox
    await expect(page.locator('.monograph, .chapter-content-layout').first()).toBeVisible({ timeout: 5000 })
    await expect(page.locator('h2').first()).toContainText('Stark')
  })
})
