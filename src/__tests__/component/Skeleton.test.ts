import { describe, it, expect } from 'vitest'
import { mount } from '@vue/test-utils'
import Skeleton from '@/components/ui/Skeleton.vue'

describe('Skeleton', () => {
  it('renders with default styles', () => {
    const wrapper = mount(Skeleton)
    const el = wrapper.find('.skeleton')
    expect(el.exists()).toBe(true)
  })

  it('applies default width of 100%', () => {
    const wrapper = mount(Skeleton)
    const el = wrapper.find('.skeleton')
    expect(el.attributes('style')).toContain('width: 100%')
  })

  it('applies default height of 1em', () => {
    const wrapper = mount(Skeleton)
    const el = wrapper.find('.skeleton')
    expect(el.attributes('style')).toContain('height: 1em')
  })

  it('accepts custom width prop', () => {
    const wrapper = mount(Skeleton, {
      props: { width: '200px' },
    })
    const el = wrapper.find('.skeleton')
    expect(el.attributes('style')).toContain('width: 200px')
  })

  it('accepts custom height prop', () => {
    const wrapper = mount(Skeleton, {
      props: { height: '40px' },
    })
    const el = wrapper.find('.skeleton')
    expect(el.attributes('style')).toContain('height: 40px')
  })

  it('applies rounded class when rounded prop is true', () => {
    const wrapper = mount(Skeleton, {
      props: { rounded: true },
    })
    const el = wrapper.find('.skeleton')
    expect(el.classes()).toContain('skeleton--rounded')
  })

  it('does not apply rounded class by default', () => {
    const wrapper = mount(Skeleton)
    const el = wrapper.find('.skeleton')
    expect(el.classes()).not.toContain('skeleton--rounded')
  })

  it('has aria-hidden for accessibility', () => {
    const wrapper = mount(Skeleton)
    const el = wrapper.find('.skeleton')
    expect(el.attributes('aria-hidden')).toBe('true')
  })

  it('accepts percentage width', () => {
    const wrapper = mount(Skeleton, {
      props: { width: '50%' },
    })
    const el = wrapper.find('.skeleton')
    expect(el.attributes('style')).toContain('width: 50%')
  })

  it('accepts rem height', () => {
    const wrapper = mount(Skeleton, {
      props: { height: '2rem' },
    })
    const el = wrapper.find('.skeleton')
    expect(el.attributes('style')).toContain('height: 2rem')
  })
})
