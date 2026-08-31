# Archivo de Poniente

Un códice interactivo de las Casas, linajes, lugares y misterios de Poniente.

> Proyecto de fans, no oficial, no afiliado a George R. R. Martin, HBO ni las editoriales.

## Stack Tecnológico

- **Frontend:** Vue 3 (Composition API + `<script setup>`) + TypeScript + Vite
- **Estilos:** Tailwind CSS 4 + CSS personalizado
- **Estado global:** Zustand via [`vue-zustand`](https://github.com/wobsoriano/vue-zustand)
- **Estado en la URL:** [`vue-qs`](https://github.com/iamsomraj/vue-qs) — filtros tipados sincronizados con la URL
- **Router:** Vue Router 4
- **Backend:** Supabase (PostgreSQL + Storage)
- **Auth:** Better Auth (`better-auth/vue` en el cliente, Hono en el servidor)
- **Servidor:** Hono — endpoints de auth y escritura protegida
- **Tabla:** [`@tanstack/vue-table`](https://tanstack.com/table/v8) — listados con orden, filtro y paginación
- **Animación:** [`motion-v`](https://motion.dev/docs/vue) — transiciones y microinteracciones
- **Validación:** Zod — formularios de edición
- **Drag & Drop:** [`@atlaskit/pragmatic-drag-and-drop`](https://github.com/atlassian/pragmatic-drag-and-drop) — cola de moderación
- **Gráficas:** Chart.js + `vue-chartjs`
- **Tipografía:** Fontsource — Cinzel (títulos) + Crimson Pro (cuerpo)
- **Iconos:** Lucide Vue Next
- **Utilidades:** VueUse, clsx, tailwind-merge
- **Testing:** Vitest (unit) + Playwright (e2e)

## Inicio Rápido

```bash
# Instalar dependencias
npm install

# Copiar variables de entorno
cp .env.example .env
# Editar .env con tus credenciales de Supabase

# Iniciar servidor de desarrollo (frontend)
npm run dev

# Iniciar servidor de Better Auth (en otra terminal)
cd server && npx tsx index.ts

# Build para producción
npm run build

# Typecheck
npm run typecheck
```

## Configuración

1. Copia `.env.example` a `.env` y configura las variables:

   - `VITE_SUPABASE_URL` — URL de tu proyecto Supabase
   - `VITE_SUPABASE_ANON_KEY` — Key anónima de Supabase (lectura + Storage)
   - `DATABASE_URL` — Conexión Postgres de Supabase (usada por Better Auth)
   - `BETTER_AUTH_SECRET` — Secret para firmar sesiones
   - `SUPABASE_SERVICE_ROLE_KEY` — Solo en el servidor, nunca en el cliente

2. Ejecuta el SQL de `supabase/schema.sql` en tu panel de Supabase para crear todas las tablas, relaciones e índices.

3. Ejecuta `supabase/seed.sql` para cargar datos de prueba.

4. Configura las políticas RLS (incluidas en el schema SQL).

## Autenticación y Autorización

- Better Auth corre contra la misma base Postgres de Supabase
- El navegador nunca llama a Supabase directamente para escribir
- Toda escritura pasa por un endpoint propio que valida la sesión y el rol
- Roles: `viewer` (lectura) / `editor` (edición) / `admin` (moderación)

## Estructura del Proyecto

```
src/
├── assets/          # Imágenes, iconos, texturas, fuentes, estilos
├── components/      # Componentes reutilizables
│   ├── ui/          # Componentes base
│   └── wiki/        # InfoBox, CrossLink, Timeline, etc.
├── composables/     # Lógica reutilizable (useHouses, useSearch, etc.)
├── features/        # Feature modules (houses, characters, etc.)
├── router/          # Vue Router con lazy loading
├── stores/          # Zustand stores (vue-zustand)
├── styles/          # CSS principal
├── types/           # Interfaces TypeScript
├── utils/           # Funciones utilitarias
├── services/        # Capa de servicios (Supabase, Better Auth)
├── views/           # Componentes de página
└── __tests__/       # Tests unit, component y e2e
server/              # Better Auth + endpoints protegidos
supabase/            # Schema SQL, migraciones, seed data
scripts/             # Scripts de carga y generación
```

## Funcionalidades

- **9 Casas** de Poniente con datos completos y dinámica visual por casa
- **Personajes** con ficha detallada y enlaces cruzados
- **Atlas interactivo** de Poniente (SVG con zoom/pan)
- **Cronología** de eventos mayores
- **Búsqueda global** con vue-qs (URL sync)
- **Cola de moderación** con pragmatic-drag-and-drop
- **Genealogía** de casas
- **Misterios** y profecías
- **Libros** de la saga
- **Responsive** completo (desktop, tablet, móvil)
- **Transiciones** y animaciones con motion-v
- **Autenticación** con Better Auth (email/password)
- **RLS** para datos de contenido

## Tests

```bash
# Tests unitarios y de componentes
npm run test:run

# Typecheck
npm run typecheck

# E2E (requiere Playwright instalado)
npm run test:e2e
```

## Despliegue

```bash
npm run build
# El resultado está en dist/
```

## Nota Legal

Este es un proyecto de fans, no oficial. No reproduce texto literal de los libros ni usa imágenes con copyright. Las descripciones son originales. Usa placeholders, arte propio o ilustraciones con licencia libre.
