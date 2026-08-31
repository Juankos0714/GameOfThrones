import { describe, it, expect, beforeEach } from 'vitest'
import { mount } from '@vue/test-utils'
import HouseAtmosphere from '@/components/wiki/HouseAtmosphere.vue'
import { useUiStore } from '@/stores/ui'

describe('HouseAtmosphere', () => {
  beforeEach(() => {
    useUiStore.setState({ activeHouse: 'stark' })
  })

  it('renders the atmosphere container', () => {
    const wrapper = mount(HouseAtmosphere)
    expect(wrapper.find('.house-atmosphere').exists()).toBe(true)
  })

  it('applies the correct atmosphere class for stark', () => {
    const wrapper = mount(HouseAtmosphere)
    expect(wrapper.find('.atmo-winter').exists()).toBe(true)
  })

  it('renders particles', () => {
    const wrapper = mount(HouseAtmosphere)
    const particles = wrapper.findAll('.atmo-particle')
    expect(particles.length).toBeGreaterThan(0)
  })

  it('renders background layers', () => {
    const wrapper = mount(HouseAtmosphere)
    expect(wrapper.find('.atmo-bg').exists()).toBe(true)
    expect(wrapper.find('.atmo-fog').exists()).toBe(true)
    expect(wrapper.find('.atmo-vignette').exists()).toBe(true)
  })

  it('has aria-hidden for accessibility', () => {
    const wrapper = mount(HouseAtmosphere)
    expect(wrapper.find('[aria-hidden="true"]').exists()).toBe(true)
  })

  it('sets opacity via CSS variable', () => {
    const wrapper = mount(HouseAtmosphere)
    const el = wrapper.find('.house-atmosphere')
    expect(el.attributes('style')).toContain('--atmo-intensity')
  })

  it('all atmosphere types render without errors', () => {
    const types = ['stark', 'lannister', 'targaryen', 'baratheon', 'tyrell', 'martell', 'greyjoy', 'arryn', 'tully']
    const classMap: Record<string, string> = {
      stark: 'atmo-winter',
      lannister: 'atmo-gold',
      targaryen: 'atmo-fire',
      baratheon: 'atmo-storm',
      tyrell: 'atmo-garden',
      martell: 'atmo-desert',
      greyjoy: 'atmo-sea',
      arryn: 'atmo-mountain',
      tully: 'atmo-river',
    }

    types.forEach((house) => {
      useUiStore.setState({ activeHouse: house as any })
      const wrapper = mount(HouseAtmosphere)
      expect(wrapper.find(`.${classMap[house]}`).exists()).toBe(true)
      wrapper.unmount()
    })
  })
})
