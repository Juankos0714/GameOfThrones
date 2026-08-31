/// <reference types="vitest" />
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import tailwindcss from '@tailwindcss/vite'
import { fileURLToPath, URL } from 'node:url'

export default defineConfig({
  plugins: [
    vue(),
    tailwindcss(),
  ],
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url)),
    },
  },
  server: {
    port: 5173,
    host: true,
  },
  build: {
    rollupOptions: {
      output: {
        manualChunks(id) {
          // Vue ecosystem — always needed
          if (id.includes('node_modules/vue/') ||
              id.includes('node_modules/vue-router/') ||
              id.includes('node_modules/vue-zustand/') ||
              id.includes('node_modules/vue-qs/') ||
              id.includes('node_modules/vue-sonner/')) {
            return 'vue-vendor'
          }

          // Motion & animation
          if (id.includes('node_modules/motion-v/') ||
              id.includes('node_modules/@motionone/')) {
            return 'motion-vendor'
          }

          // Supabase — large, only needed when DB is configured
          if (id.includes('node_modules/@supabase/')) {
            return 'supabase-vendor'
          }

          // TanStack Table — only used by HousesView & CharactersView
          if (id.includes('node_modules/@tanstack/')) {
            return 'table-vendor'
          }

          // Charts — only used if chart pages exist
          if (id.includes('node_modules/chart.js/') ||
              id.includes('node_modules/vue-chartjs/')) {
            return 'chart-vendor'
          }

          // VueUse — small-ish, used across app
          if (id.includes('node_modules/@vueuse/')) {
            return 'vueuse-vendor'
          }

          // Auth — heavier, only on login/moderation
          if (id.includes('node_modules/better-auth/') ||
              id.includes('node_modules/hono/')) {
            return 'auth-vendor'
          }

          // Heavy PDF processing — only on books page
          if (id.includes('node_modules/pdfjs-dist/')) {
            return 'pdf-vendor'
          }

          // Server-only packages that leak into client bundle
          if (id.includes('node_modules/pg/') ||
              id.includes('node_modules/csv-parse/') ||
              id.includes('node_modules/dotenv/') ||
              id.includes('node_modules/@types/pg')) {
            return 'server-only'
          }

          // Utilities — small, can stay together
          if (id.includes('node_modules/zod/') ||
              id.includes('node_modules/clsx/') ||
              id.includes('node_modules/tailwind-merge/') ||
              id.includes('node_modules/lucide-vue-next/') ||
              id.includes('node_modules/@atlaskit/pragmatic-drag-and-drop/')) {
            return 'utils-vendor'
          }
        },
      },
    },
    chunkSizeWarningLimit: 150,
  },
  test: {
    globals: true,
    environment: 'jsdom',
    include: ['src/**/*.{test,spec}.ts', 'src/**/*.{test,spec}.vue'],
    exclude: ['src/__tests__/e2e/**', 'node_modules/**'],
    setupFiles: ['./src/test-setup.ts'],
  },
})
