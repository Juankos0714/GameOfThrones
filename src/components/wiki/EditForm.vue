<script setup lang="ts">
import { ref, computed } from 'vue'
import { z } from 'zod'

/**
 * Reusable edit form with zod validation.
 * Used for proposing changes to houses, characters, etc.
 */

const props = defineProps<{
  entityType: 'house' | 'character' | 'location' | 'event'
  entityName: string
  initialData?: Record<string, any>
}>()

const emit = defineEmits<{
  submit: [data: Record<string, any>]
  cancel: []
}>()

// Zod schemas per entity type
const houseSchema = z.object({
  name: z.string().min(1, 'El nombre es obligatorio').max(100),
  region: z.string().min(1, 'La región es obligatoria'),
  words: z.string().max(200).optional(),
  seat: z.string().max(200).optional(),
  colors: z.string().max(100).optional(),
  description: z.string().max(2000).optional(),
})

const characterSchema = z.object({
  name: z.string().min(1, 'El nombre es obligatorio').max(100),
  culture: z.string().max(100).optional(),
  status: z.enum(['vivo', 'muerto', 'desconocido']),
  born: z.string().max(50).optional(),
  died: z.string().max(50).optional(),
  description: z.string().max(2000).optional(),
})

const locationSchema = z.object({
  name: z.string().min(1, 'El nombre es obligatorio').max(100),
  region: z.string().max(100).optional(),
  description: z.string().max(2000).optional(),
})

const eventSchema = z.object({
  title: z.string().min(1, 'El título es obligatorio').max(200),
  year_in_universe: z.string().max(50).optional(),
  description: z.string().max(2000).optional(),
})

const schemas = {
  house: houseSchema,
  character: characterSchema,
  location: locationSchema,
  event: eventSchema,
} as const

const formData = ref<Record<string, any>>({
  ...props.initialData,
})

const errors = ref<Record<string, string>>({})

function validate(): boolean {
  errors.value = {}
  const schema = schemas[props.entityType]
  const result = schema.safeParse(formData.value)

  if (!result.success) {
    result.error.issues.forEach((issue) => {
      const field = issue.path[0] as string
      if (!errors.value[field]) {
        errors.value[field] = issue.message
      }
    })
    return false
  }

  return true
}

function handleSubmit() {
  if (validate()) {
    emit('submit', { ...formData.value })
  }
}

const fieldLabels: Record<string, string> = {
  name: 'Nombre',
  region: 'Región',
  words: 'Lema',
  seat: 'Sede',
  colors: 'Colores',
  description: 'Descripción',
  culture: 'Cultura',
  status: 'Estado',
  born: 'Nacimiento',
  died: 'Muerte',
  title: 'Título',
  year_in_universe: 'Año en el universo',
}

const fieldOrder: Record<string, string[]> = {
  house: ['name', 'region', 'words', 'seat', 'colors', 'description'],
  character: ['name', 'culture', 'status', 'born', 'died', 'description'],
  location: ['name', 'region', 'description'],
  event: ['title', 'year_in_universe', 'description'],
}
</script>

<template>
  <form class="edit-form" @submit.prevent="handleSubmit">
    <header class="form-header">
      <h3>Proponer cambio — {{ entityName }}</h3>
      <p class="form-subtitle">
        Su edición será revisada por un administrador antes de publicarse.
      </p>
    </header>

    <div class="form-body">
      <div
        v-for="field in fieldOrder[entityType]"
        :key="field"
        class="form-group"
        :class="{ 'has-error': errors[field] }"
      >
        <label :for="`field-${field}`">
          {{ fieldLabels[field] || field }}
          <span v-if="field === 'name' || field === 'title'" class="required">*</span>
        </label>

        <select
          v-if="field === 'status'"
          :id="`field-${field}`"
          v-model="formData[field]"
        >
          <option value="vivo">Vivo</option>
          <option value="muerto">Muerto</option>
          <option value="desconocido">Desconocido</option>
        </select>

        <textarea
          v-else-if="field === 'description'"
          :id="`field-${field}`"
          v-model="formData[field]"
          rows="4"
          :placeholder="`Descripción de ${entityName}...`"
        />

        <input
          v-else
          :id="`field-${field}`"
          v-model="formData[field]"
          type="text"
          :placeholder="fieldLabels[field] || field"
        />

        <span v-if="errors[field]" class="field-error">{{ errors[field] }}</span>
      </div>
    </div>

    <footer class="form-footer">
      <button type="button" class="btn-cancel" @click="emit('cancel')">
        Cancelar
      </button>
      <button type="submit" class="btn-submit">
        Enviar para revisión
      </button>
    </footer>
  </form>
</template>

<style scoped>
.edit-form {
  border: 1px solid var(--border);
  background: color-mix(in srgb, var(--house-deep) 40%, var(--color-background));
}

.form-header {
  padding: 24px 30px;
  border-bottom: 1px solid var(--border);
}

.form-header h3 {
  font: 500 20px var(--font-serif);
  margin: 0;
}

.form-subtitle {
  font-size: 11px;
  color: var(--color-muted-foreground);
  margin: 6px 0 0;
}

.form-body {
  padding: 30px;
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.form-group label {
  display: block;
  font-size: 8px;
  text-transform: uppercase;
  letter-spacing: 0.15em;
  color: var(--house);
  margin-bottom: 8px;
}

.required {
  color: #8a5a5a;
}

.form-group input,
.form-group select,
.form-group textarea {
  width: 100%;
  padding: 12px 14px;
  border: 1px solid var(--border);
  background: var(--color-background);
  color: var(--color-foreground);
  font: 14px var(--font-serif);
  outline: none;
  transition: border-color 0.2s;
}

.form-group input:focus,
.form-group select:focus,
.form-group textarea:focus {
  border-color: var(--house);
}

.form-group textarea {
  resize: vertical;
  min-height: 100px;
}

.form-group select {
  cursor: pointer;
}

.has-error input,
.has-error select,
.has-error textarea {
  border-color: #8a5a5a;
}

.field-error {
  display: block;
  font-size: 11px;
  color: #8a5a5a;
  margin-top: 6px;
}

.form-footer {
  padding: 20px 30px;
  border-top: 1px solid var(--border);
  display: flex;
  gap: 12px;
  justify-content: flex-end;
}

.btn-cancel {
  padding: 10px 20px;
  border: 1px solid var(--border);
  background: transparent;
  color: var(--color-muted-foreground);
  font-size: 9px;
  text-transform: uppercase;
  letter-spacing: 0.12em;
  cursor: pointer;
  transition: all 0.2s;
}

.btn-cancel:hover {
  border-color: var(--house);
  color: var(--house);
}

.btn-submit {
  padding: 10px 20px;
  border: 0;
  background: var(--house);
  color: #0b0c0c;
  font: 600 9px/1 var(--font-sans);
  text-transform: uppercase;
  letter-spacing: 0.12em;
  cursor: pointer;
  transition: opacity 0.2s;
}

.btn-submit:hover {
  opacity: 0.9;
}
</style>
