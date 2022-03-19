import { createApp, h } from 'vue'
import App from './App.vue'
import { NConfigProvider, darkTheme } from 'naive-ui'
import './index.css'

const app = createApp({
  render: () => h(NConfigProvider, {theme: darkTheme}, {
    default: () => h(App)
  })
})

app.mount('#app')