<script setup>
import { reactive } from 'vue';
import {useMessage, useNotification, useDialog, NProgress, NAlert } from 'naive-ui';
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
	alerts: [],
	alertNumber: 0,
})

window.$notify = useMessage()
window.$advnotify = useNotification()
window.$dialog = useDialog()
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
window.$alert = (type, title, message, duration) => {
	if (state.alerts.length > 4) {
		fetchNui('atl_ui_alert', {resp: false, message: 'There are too many alerts already'})
		return
	}
	state.alerts.push({
		type: type,
		title: title,
		message: message,
		duration: duration,
		show: true
	})
	// Hide alert after duration and then remove it from the array
	setTimeout(() => {
		state.alerts[state.alertNumber].show = false
		state.alertNumber++
		fetchNui('atl_ui_alert', {resp: true, message: 'Ended alert #' + state.alertNumber})
	}, duration)
}
// Clean up alerts after 5 minutes if there are none active and set the alertNumber to 0
setInterval(() => {
	if (state.alerts.length === 0) return
	// Check if there are any active alerts
	let activeAlerts = 0
	state.alerts.forEach(alert => {
		if (alert.show) activeAlerts++
	})
	// If there are no active alerts, clean up the alerts array
	if (activeAlerts === 0) {
		state.alerts = []
		state.alertNumber = 0
		console.log('Cleaned up alerts array')
		fetchNui('atl_ui_alert', {restore: true, message: 'Cleaned up alerts'})
	}
}, 300000)
</script>

<template>
  <div class="absolute w-screen h-screen left-0 top-0 flex justify-center items-center">
    <div class="w-[25%] mt-[25%]">
      <transition name="slide-fade">
        <NProgress v-if="state.progress.active" :status="state.progress.status" :type="state.progress.type" :height="state.progress.height" :indicator-placement="state.progress.placement" :percentage="state.progress.value"/>
      </transition>
    </div>
  </div>
	<div class="absolute w-screen h-screen flex flex-col justify-start items-center">
		<div v-for="(alert, index) in state.alerts">
			<transition name="slide-fade2">
				<NAlert v-if="alert.show" class="w-[25vw] mt-3 enter-from-top" :title="alert.title" :type="alert.type">
					{{alert.message}}
				</NAlert>
			</transition>
		</div>
	</div>
</template>

<style scoped>
@keyframes enterFromTop {
	from {
		transform: translateY(-25%);
		opacity: 0;
	}
	to {
		transform: translateY(0);
		opacity: 1;
	}
}

.enter-from-top {
	animation: enterFromTop .2s ease-in-out;
}

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

.slide-fade2-enter-active {
	transition: all 0.15s ease-out;
}
.slide-fade2-leave-active {
	transition: all 0.15s cubic-bezier(1, 0.5, 0.8, 1);
}
.slide-fade2-enter-from,
.slide-fade2-leave-to {
	transform: translateY(-20px);
	opacity: 0;
}
</style>