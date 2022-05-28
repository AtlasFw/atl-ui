<script setup>
import { onMounted, onUnmounted, reactive } from 'vue';
import Start from './common/index.js'
import Hud from './components/Hud.vue';
import Carhud from './components/Carhud.vue';
import Feedback from './components/Feedback.vue';
import { NMessageProvider, NDialogProvider, NNotificationProvider } from 'naive-ui'

const state = reactive({
  global: {
    duration: 5000,
    max: 3,
    position: 'top-right',
  }
});

const handleMessage = (e) => {
  const duration = e.data.duration || state.global.duration
  switch (e.data.action) {
    case 'startup':

      break
    case 'advNotify':
      Start.AdvNotify(e.data.type, e.data.title, e.data.description, e.data.content, duration, e.data.meta, e.data.avatar)
      break;
    case 'alert':

      break;
    case 'carhud':

      break;
    case 'dialog':

      break;
    case 'hud':

      break;
    case 'image':

      break;
    case 'progress':
      Start.Progress(e.data.type, e.data.status, e.data.duration, e.data.indicator, e.data.placement)
      break;
    case 'notify':
      Start.Notify(e.data.type, e.data.message, duration)
      break;
    case 'spinner':

      break;
  }
}

document.addEventListener('keyup', (e) => {
  if (e.key === 'Escape') {
    window.dispatchEvent(
        new MessageEvent('message', {
          data: {
            action: 'progress',
            type: 'circle',
            status: 'success',
            duration: (Math.floor(Math.random() * 5000) + 1000),
          }
        })
    )
  }
})

onMounted(() => window.addEventListener('message', handleMessage));
onUnmounted(() => window.removeEventListener('message', handleMessage));
</script>

<template>
  <NMessageProvider :placement="state.global.position" :max="state.global.max">
    <NNotificationProvider :placement="state.global.position" :max="state.global.max">
      <NDialogProvider>
        <Hud/>
        <Carhud/>
        <Feedback/>
      </NDialogProvider>
    </NNotificationProvider>
  </NMessageProvider>
</template>

<style>
@import url('https://fonts.googleapis.com/css2?family=Lato:wght@700&display=swap');

#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>