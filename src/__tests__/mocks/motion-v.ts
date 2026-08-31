import { defineComponent, h } from 'vue'

export const Motion = defineComponent({
  name: 'MotionMock',
  props: ['as', 'initial', 'animate', 'exit', 'transition', 'whileHover', 'whileTap', 'whileInView', 'viewport', 'layout', 'layoutDependency', 'class'],
  setup(props, { slots }) {
    return () => h(props.as || 'div', { class: props.class }, slots.default?.())
  },
})

export const AnimatePresence = defineComponent({
  name: 'AnimatePresenceMock',
  props: ['mode'],
  setup(_props, { slots }) {
    return () => slots.default?.()
  },
})

export const MotionConfig = defineComponent({
  name: 'MotionConfigMock',
  props: ['transition', 'reducedMotion'],
  setup(_props, { slots }) {
    return () => slots.default?.()
  },
})
