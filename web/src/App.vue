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
  },
	health: 100,
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
			Start.Dialog(e.data.type, e.data.title, e.data.content, e.data.posBtn, e.data.negBtn, e.data.respMsg)
      break;
    case 'hud':
			state.health = e.data.health
      break;
    case 'progress':
      Start.Progress(e.data.type, e.data.status, e.data.duration, e.data.indicator, e.data.placement)
      break;
    case 'notify':
      Start.Notify(e.data.type, e.data.message, duration)
      break;
  }
}

document.addEventListener('keyup', (e) => {
  if (e.key === 'Enter') {
    window.dispatchEvent(
        new MessageEvent('message', {
          data: {
            action: 'dialog',
						type: 'error',
						title: 'Enter',
						content: 'You pressed enter',
						posBtn: 'OK',
						negBtn: 'Cancel',
						posMsg: 'OK',
						negMsg: 'Cancel',
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
				<Feedback/>
        <Hud :health="state.health"/>
        <Carhud/>
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
	height: 100vh;
	margin: 0 auto;
}
</style>