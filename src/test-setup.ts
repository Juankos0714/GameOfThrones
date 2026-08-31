import '@testing-library/jest-dom/vitest'
import { vi } from 'vitest'
import { defineComponent, h } from 'vue'

// Mock motion-v for jsdom environment
const StubComponent = defineComponent({
  name: 'MotionStub',
  props: {
    as: { type: String, default: 'div' },
    class: { type: [String, Object, Array], default: '' },
  },
  setup(props, { slots }) {
    return () => h(props.as, { class: props.class }, slots.default?.())
  },
})

vi.mock('motion-v', () => ({
  Motion: StubComponent,
  AnimatePresence: StubComponent,
  MotionConfig: StubComponent,
}))

// Mock window.matchMedia for jsdom
Object.defineProperty(window, 'matchMedia', {
  writable: true,
  value: (query: string) => ({
    matches: false,
    media: query,
    onchange: null,
    addListener: () => {},
    removeListener: () => {},
    addEventListener: () => {},
    removeEventListener: () => {},
    dispatchEvent: () => false,
  }),
})
