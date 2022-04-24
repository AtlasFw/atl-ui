<script setup>
import { reactive } from 'vue';
import { useMessage, useNotification, NProgress, NCountdown } from 'naive-ui'
import { fetchNui } from '../utils/fetchNui'

// https://www.naiveui.com/en-US/dark/components/progress for more info
const state = reactive({
  progress: {
    active: false,
    status: 'info',
    type: 'line',
    value: 0,
    strokeWidth: 6,
    height: 14,
    indicator: true,
    placement: 'inside'
  },
  countdown: {
    active: false,
    duration: 0
  }
})

window.$notify = useMessage()
window.$advnotify = useNotification()
window.$progress = (type, status, duration, indicator, placement) => {
  if (state.progress.active) return false
  !duration || duration < 1000 ? duration = 1000 : null
  state.progress.type = type || 'line'
  state.progress.status = status || 'info'
  state.progress.indicator = indicator || true
  state.progress.placement = placement || 'inside'
  state.progress.active = true

  const progress = () => {
    const newValue = Math.floor(100 / (duration / 1000)) + state.progress.value
    if (state.progress.value >= 100) {
      state.progress.active = false
      state.progress.value = 0
      fetchNui('endProgress')
      return true
    }
    newValue >= 100 ? state.progress.value = 100 : state.progress.value = newValue
    setTimeout(progress, 1000)
  }
  new Promise(() => setTimeout(progress, 150));
  return true
}
window.$countdown = (start, duration) => {
  if (!start) {
    fetchNui('endCountdown', { duration: state.countdown.duration, cancelled: true })
    return true
  }

  if (state.countdown.active) return false
  !duration || duration < 1000 ? duration = 1000 : null
  state.countdown.active = true
  state.countdown.duration = duration
  return true
}

const endCountdown = () => {
  state.countdown.active = false
  state.countdown.duration = 0
  fetchNui('endCountdown', { duration: state.countdown.duration, cancelled: false })
}
</script>

<template>
  <div class="absolute w-screen h-screen left-0 top-0 bg-slate-800 flex justify-center items-center">
    <div class="w-[25%] mt-[25%]">
      <transition name="slide-fade">
        <NProgress v-if="state.progress.active" :status="state.progress.status" :type="state.progress.type" :height="state.progress.height" :indicator-placement="state.progress.placement" :percentage="state.progress.value"/>
      </transition>
    </div>
    <span class="absolute top-5 text-3xl font-bold font-lato text-white">
      <NCountdown v-if="state.countdown.active" :active="state.countdown.active" :duration="state.countdown.duration" :on-finish="endCountdown" />
    </span>
  </div>
</template>

<style scoped>

.slide-fade-enter-active {
  transition: all 0.15s ease-out;
}
.slide-fade-leave-active {
  transition: all 0.15s cubic-bezier(1, 0.5, 0.8, 1);
}
.slide-fade-enter-from,
.slide-fade-leave-to {
  transform: translateY(20px);
  opacity: 0;
}
</style>