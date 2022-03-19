<script setup>
import { onMounted, onUnmounted, reactive } from 'vue';
import Hud from './components/Hud.vue';
import Carhud from './components/Carhud.vue';
import Feedback from './components/Feedback.vue';
import { NMessageProvider, NDialogProvider } from 'naive-ui'

const state = reactive({
  global: {
    duration: 5000,
    max: 5,
    position: 'top',
  }
});

const handleMessage = (e) => {
  switch (e.data.type) {
    case 'startup':

      break
    case 'adv-notify':

      break;
    case 'alert':

      break;
    case 'badge':

      break;
    case 'carhud':

      break;
    case 'countdown':

      break;
    case 'dialog':

      break;
    case 'hud':

      break;
    case 'image':

      break;
    case 'progress':

      break;
    case 'notify':

      break;
    case 'spinner':

      break;
  }
}

onMounted(() => window.addEventListener('message', handleMessage));
onUnmounted(() => window.removeEventListener('message', handleMessage));
</script>

<template>
  <NMessageProvider :duration="state.global.duration">
    <NDialogProvider>
      <Hud/>
      <Carhud/>
      <Feedback/>
    </NDialogProvider>
  </NMessageProvider>
</template>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>