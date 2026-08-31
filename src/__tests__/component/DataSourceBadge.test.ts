import { describe, it, expect } from 'vitest'
import { mount } from '@vue/test-utils'
import DataSourceBadge from '@/components/ui/DataSourceBadge.vue'

describe('DataSourceBadge', () => {
  it('renders Supabase badge when source is supabase', () => {
    const wrapper = mount(DataSourceBadge, {
      props: { source: 'supabase' },
    })
    expect(wrapper.text()).toContain('Supabase')
    expect(wrapper.classes()).toContain('data-source-badge--supabase')
  })

  it('renders Offline badge when source is hardcoded', () => {
    const wrapper = mount(DataSourceBadge, {
      props: { source: 'hardcoded' },
    })
    expect(wrapper.text()).toContain('Offline')
    expect(wrapper.classes()).toContain('data-source-badge--hardcoded')
  })

  it('has a dot indicator', () => {
    const wrapper = mount(DataSourceBadge, {
      props: { source: 'supabase' },
    })
    const dot = wrapper.find('.data-source-badge__dot')
    expect(dot.exists()).toBe(true)
  })

  it('has correct title attribute for supabase', () => {
    const wrapper = mount(DataSourceBadge, {
      props: { source: 'supabase' },
    })
    expect(wrapper.attributes('title')).toContain('Supabase')
  })

  it('has correct title attribute for hardcoded', () => {
    const wrapper = mount(DataSourceBadge, {
      props: { source: 'hardcoded' },
    })
    expect(wrapper.attributes('title')).toContain('Datos de prueba')
  })

  it('renders as a span element', () => {
    const wrapper = mount(DataSourceBadge, {
      props: { source: 'supabase' },
    })
    expect(wrapper.element.tagName).toBe('SPAN')
  })

  it('has proper class structure', () => {
    const wrapper = mount(DataSourceBadge, {
      props: { source: 'supabase' },
    })
    expect(wrapper.classes()).toContain('data-source-badge')
  })
})
