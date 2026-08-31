import { describe, it, expect, beforeEach } from 'vitest'
import { mount } from '@vue/test-utils'
import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '@/views/HomeView.vue'
import { useHousesStore } from '@/stores/houses'
import { useUiStore } from '@/stores/ui'

const router = createRouter({
  history: createWebHistory(),
  routes: [
    { path: '/', component: HomeView },
    { path: '/houses/:slug', component: { template: '<div />' } },
    { path: '/characters', component: { template: '<div />' } },
  ],
})

describe('HomeView', () => {
  beforeEach(() => {
    useHousesStore.setState({ selectedId: 'stark' })
    useUiStore.setState({ activeHouse: 'stark', activeHouseClass: 'house-stark' })
  })

  it('renders the opening/hero section', async () => {
    const wrapper = mount(HomeView, {
      global: { plugins: [router] },
    })
    await router.isReady()

    expect(wrapper.find('.opening').exists()).toBe(true)
  })

  it('displays the main title text', async () => {
    const wrapper = mount(HomeView, {
      global: { plugins: [router] },
    })
    await router.isReady()

    expect(wrapper.text()).toContain('La memoria')
    expect(wrapper.text()).toContain('reino')
  })

  it('displays the subtitle', async () => {
    const wrapper = mount(HomeView, {
      global: { plugins: [router] },
    })
    await router.isReady()

    expect(wrapper.text()).toContain('Crónicas de los Siete Reinos')
  })

  it('renders the catalogue section', async () => {
    const wrapper = mount(HomeView, {
      global: { plugins: [router] },
    })
    await router.isReady()

    expect(wrapper.find('.catalogue').exists()).toBe(true)
  })

  it('shows all house names', async () => {
    const wrapper = mount(HomeView, {
      global: { plugins: [router] },
    })
    await router.isReady()

    expect(wrapper.text()).toContain('Stark')
    expect(wrapper.text()).toContain('Lannister')
    expect(wrapper.text()).toContain('Targaryen')
    expect(wrapper.text()).toContain('Baratheon')
    expect(wrapper.text()).toContain('Tyrell')
    expect(wrapper.text()).toContain('Martell')
    expect(wrapper.text()).toContain('Greyjoy')
    expect(wrapper.text()).toContain('Arryn')
    expect(wrapper.text()).toContain('Tully')
  })

  it('renders the monograph for selected house', async () => {
    const wrapper = mount(HomeView, {
      global: { plugins: [router] },
    })
    await router.isReady()

    expect(wrapper.find('.monograph').exists()).toBe(true)
    expect(wrapper.text()).toContain('Stark')
    expect(wrapper.text()).toContain('Invernalia')
  })

  it('renders the chronology section', async () => {
    const wrapper = mount(HomeView, {
      global: { plugins: [router] },
    })
    await router.isReady()

    expect(wrapper.find('.chronology').exists()).toBe(true)
  })

  it('renders the mysteries section', async () => {
    const wrapper = mount(HomeView, {
      global: { plugins: [router] },
    })
    await router.isReady()

    expect(wrapper.find('.forbidden').exists()).toBe(true)
  })

  it('renders the books section', async () => {
    const wrapper = mount(HomeView, {
      global: { plugins: [router] },
    })
    await router.isReady()

    expect(wrapper.find('.volumes').exists()).toBe(true)
  })
})
