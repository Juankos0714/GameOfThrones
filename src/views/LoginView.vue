<script setup lang="ts">
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { signInEmail, signUpEmail } from '@/services/auth-client'
import { Shield, Mail, Lock } from 'lucide-vue-next'

const router = useRouter()
const email = ref('')
const password = ref('')
const loading = ref(false)
const error = ref('')

async function handleLogin() {
  if (!email.value || !password.value) {
    error.value = 'Complete todos los campos.'
    return
  }

  loading.value = true
  error.value = ''

  try {
    const { error: authError } = await signInEmail(email.value, password.value)

    if (authError) {
      error.value = authError.message || 'Error al iniciar sesión.'
      return
    }

    router.push('/')
  } catch (e) {
    error.value = e instanceof Error ? e.message : 'Error desconocido.'
  } finally {
    loading.value = false
  }
}

async function handleSignUp() {
  if (!email.value || !password.value) {
    error.value = 'Complete todos los campos.'
    return
  }

  loading.value = true
  error.value = ''

  try {
    const { error: authError } = await signUpEmail(email.value, password.value, email.value.split('@')[0])

    if (authError) {
      error.value = authError.message || 'Error al registrarse.'
      return
    }

    error.value = 'Cuenta creada. Revise su correo para confirmar.'
  } catch (e) {
    error.value = e instanceof Error ? e.message : 'Error desconocido.'
  } finally {
    loading.value = false
  }
}
</script>

<template>
  <div class="login-page">
    <div class="login-card">
      <div class="login-header">
        <Shield :size="32" />
        <h1>Archivo de Poniente</h1>
        <p>Acceda para editar y contribuir al códice.</p>
      </div>

      <form class="login-form" @submit.prevent="handleLogin">
        <div class="form-group">
          <label for="email">
            <Mail :size="14" />
            Correo electrónico
          </label>
          <input
            id="email"
            v-model="email"
            type="email"
            placeholder="usuario@ejemplo.com"
            required
            autocomplete="email"
          />
        </div>

        <div class="form-group">
          <label for="password">
            <Lock :size="14" />
            Contraseña
          </label>
          <input
            id="password"
            v-model="password"
            type="password"
            placeholder="••••••••"
            required
            autocomplete="current-password"
            minlength="8"
          />
        </div>

        <p v-if="error" class="form-error">{{ error }}</p>

        <button type="submit" class="btn-primary" :disabled="loading">
          {{ loading ? 'Entrando...' : 'Iniciar sesión' }}
        </button>

        <button type="button" class="btn-secondary" :disabled="loading" @click="handleSignUp">
          Crear cuenta
        </button>
      </form>
    </div>
  </div>
</template>

<style scoped>
.login-page {
  min-height: calc(100vh - 352px);
  display: grid;
  place-items: center;
  padding: 40px 20px;
}

.login-card {
  width: 100%;
  max-width: 400px;
  border: 1px solid var(--border);
  background: color-mix(in srgb, var(--house-deep) 40%, var(--color-background));
}

.login-header {
  text-align: center;
  padding: 40px 30px 30px;
  border-bottom: 1px solid var(--border);
}

.login-header svg {
  color: var(--house);
  margin-bottom: 16px;
}

.login-header h1 {
  font: 500 28px var(--font-serif);
  margin: 0 0 8px;
}

.login-header p {
  font-size: 11px;
  color: var(--color-muted-foreground);
  margin: 0;
}

.login-form {
  padding: 30px;
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.form-group label {
  display: flex;
  align-items: center;
  gap: 8px;
  font-size: 8px;
  text-transform: uppercase;
  letter-spacing: 0.15em;
  color: var(--house);
  margin-bottom: 8px;
}

.form-group input {
  width: 100%;
  padding: 14px 16px;
  border: 1px solid var(--border);
  background: var(--color-background);
  color: var(--color-foreground);
  font: 14px var(--font-serif);
  outline: none;
  transition: border-color 0.2s;
}

.form-group input:focus {
  border-color: var(--house);
}

.form-group input::placeholder {
  color: #5c574d;
}

.form-error {
  font-size: 12px;
  color: #8a5a5a;
  margin: 0;
  text-align: center;
}

.btn-primary {
  width: 100%;
  padding: 14px;
  border: 0;
  background: var(--house);
  color: #0b0c0c;
  font: 600 10px/1 var(--font-sans);
  text-transform: uppercase;
  letter-spacing: 0.15em;
  cursor: pointer;
  transition: opacity 0.2s;
}

.btn-primary:hover {
  opacity: 0.9;
}

.btn-primary:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}

.btn-secondary {
  width: 100%;
  padding: 14px;
  border: 1px solid var(--border);
  background: transparent;
  color: var(--color-muted-foreground);
  font: 500 10px/1 var(--font-sans);
  text-transform: uppercase;
  letter-spacing: 0.15em;
  cursor: pointer;
  transition: all 0.2s;
}

.btn-secondary:hover {
  border-color: var(--house);
  color: var(--house);
}

.btn-secondary:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}
</style>
