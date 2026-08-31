<script setup lang="ts">
import { useRouter } from 'vue-router'
import { Shield } from 'lucide-vue-next'

const router = useRouter()
</script>

<template>
  <div class="not-found">
    <div class="not-found-content">
      <Shield class="not-found-icon" />
      <h1>404</h1>
      <p class="not-found-text">
        Esta página ha sido borrada de los archivos del reino.
      </p>
      <p class="not-found-sub">
        Ningún registro la recuerda; ningún maestro la preservó.
      </p>
      <button class="not-found-btn" @click="router.push('/')">
        Volver al archivo
      </button>
    </div>
  </div>
</template>

<style scoped>
.not-found {
  min-height: calc(100vh - 352px);
  display: grid;
  place-items: center;
  padding: 40px;
}

.not-found-content {
  text-align: center;
}

.not-found-icon {
  width: 60px;
  height: 60px;
  color: var(--house);
  opacity: 0.4;
  margin-bottom: 30px;
}

.not-found h1 {
  font: 500 clamp(80px, 15vw, 200px) / 0.7 var(--font-serif);
  margin: 0;
  color: var(--color-foreground);
  letter-spacing: -0.06em;
}

.not-found-text {
  font: italic 22px var(--font-serif);
  color: var(--color-muted-foreground);
  margin: 20px 0 8px;
}

.not-found-sub {
  font-size: 10px;
  text-transform: uppercase;
  letter-spacing: 0.15em;
  color: var(--color-muted-foreground);
  margin: 0 0 40px;
}

.not-found-btn {
  border: 0;
  border-bottom: 1px solid var(--house);
  background: none;
  color: var(--color-foreground);
  cursor: pointer;
  text-transform: uppercase;
  letter-spacing: 0.14em;
  font-size: 8px;
  padding: 0 0 8px;
  transition: color 0.2s;
}

.not-found-btn:hover {
  color: var(--house);
}
</style>
