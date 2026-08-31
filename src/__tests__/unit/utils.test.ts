import { describe, it, expect, vi } from 'vitest'
import { cn, padNumber, slugify, debounce } from '@/utils'

describe('cn', () => {
  it('merges class names', () => {
    const result = cn('foo', 'bar')
    expect(result).toContain('foo')
    expect(result).toContain('bar')
  })

  it('handles conditional classes', () => {
    const result = cn('base', false && 'hidden', 'end')
    expect(result).toContain('base')
    expect(result).not.toContain('hidden')
    expect(result).toContain('end')
  })
})

describe('padNumber', () => {
  it('pads with leading zeros', () => {
    expect(padNumber(1)).toBe('01')
    expect(padNumber(9)).toBe('09')
    expect(padNumber(10)).toBe('10')
  })

  it('respects custom length', () => {
    expect(padNumber(1, 3)).toBe('001')
    expect(padNumber(42, 4)).toBe('0042')
  })
})

describe('slugify', () => {
  it('converts to lowercase slug', () => {
    expect(slugify('Eddard Stark')).toBe('eddard-stark')
    expect(slugify('Casa Lannister')).toBe('casa-lannister')
  })

  it('handles special characters', () => {
    expect(slugify('¡Hola!')).toBe('hola')
    expect(slugify('Targaryen (fuego)')).toBe('targaryen-fuego')
  })

  it('removes leading/trailing hyphens', () => {
    expect(slugify('  hello  ')).toBe('hello')
  })
})

describe('debounce', () => {
  it('delays function execution', () => {
    vi.useFakeTimers()
    const fn = vi.fn()
    const debounced = debounce(fn, 300)

    debounced()
    expect(fn).not.toHaveBeenCalled()

    vi.advanceTimersByTime(300)
    expect(fn).toHaveBeenCalledOnce()

    vi.useRealTimers()
  })

  it('cancels previous calls', () => {
    vi.useFakeTimers()
    const fn = vi.fn()
    const debounced = debounce(fn, 300)

    debounced()
    debounced()
    debounced()

    vi.advanceTimersByTime(300)
    expect(fn).toHaveBeenCalledOnce()

    vi.useRealTimers()
  })
})
