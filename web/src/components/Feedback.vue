<script setup>
import { reactive } from 'vue';
import { useMessage, useNotification, NProgress  } from 'naive-ui'

const state = reactive({
  progress: {
    active: false,
    status: 'success',
    type: 'line',
    value: 0,
    strokeWidth: 6,
    height: 14,
    indicator: true,
    placement: 'inside'
  }
})

window.$notify = useMessage()
window.$advnotify = useNotification()
window.$progress = (duration) => {
  if (state.progress.active) return false
  duration < 1000 ? duration = 1000 : null
  state.progress.active = true

  const progress = () => {
    const newValue = Math.floor(100 / (duration / 1000)) + state.progress.value
    if (state.progress.value >= 100) {
      state.progress.active = false
      state.progress.value = 0
      return true
    }
    newValue >= 100 ? state.progress.value = 100 : state.progress.value = newValue
    setTimeout(progress, 1000)
  }
  new Promise(() => setTimeout(progress, 150));
  return true
}
</script>

<template>
  <div class="absolute w-screen h-screen left-0 top-0 bg-slate-800 flex justify-center items-center">
    <div class="w-[25%] mt-[25%]">
      <transition name="slide-fade">
        <NProgress v-if="state.progress.active" :status="state.progress.status" :type="state.progress.type" :height="state.progress.height" :indicator-placement="state.progress.placement" :percentage="state.progress.value"/>
      </transition>
    </div>
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