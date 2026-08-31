import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import './styles/main.css'

// Fontsource fonts
import '@fontsource/cinzel/400.css'
import '@fontsource/cinzel/500.css'
import '@fontsource/cinzel/600.css'
import '@fontsource/cinzel/700.css'
import '@fontsource/crimson-pro/400.css'
import '@fontsource/crimson-pro/500.css'
import '@fontsource/crimson-pro/600.css'

const app = createApp(App)

app.use(router)

app.mount('#app')
