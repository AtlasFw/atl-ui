<script setup>
import { onMounted, onUnmounted, reactive } from 'vue';
import Start from './common/index.js'
import Hud from './components/Hud.vue';
import Carhud from './components/Carhud.vue';
import Feedback from './components/Feedback.vue';
import { NGlobalStyle, NMessageProvider, NDialogProvider, NNotificationProvider } from 'naive-ui'

const state = reactive({
  global: {
    duration: 5000,
    max: 3,
    position: 'top-right',
  },
	hud: {
		on: true,
		health: 100,
	},
	car: {
		on: false,
		speed: 0,
		fuel: 100,
		gear: 0,
		seatbelt: false,
		lights: 0
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
			Start.Alert(e.data.type, e.data.title, e.data.description, duration)
      break;
    case 'carhudSpeed':
			state.car.speed = e.data.speed
      break;
		case 'carhudData':
			state.car.on = e.data.on
			state.car.fuel = e.data.fuel
			state.car.gear = e.data.gear
			state.car.seatbelt = e.data.seatbelt
			state.car.lights = e.data.lights
			break;
		case 'showCarhud':
			state.car.on = true
			break;
		case 'hideCarhud':
			state.car.on = false
			break;
    case 'dialog':
			Start.Dialog(e.data.type, e.data.title, e.data.content, e.data.posBtn, e.data.negBtn, e.data.respMsg)
      break;
    case 'hud':
			state.health = e.data.health
      break;
		case 'showHud':
			state.hud.on = true
			break;
		case 'hideHud':
			state.hud.on = false
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
            action: 'advNotify',
						type: 'info',
						title: 'New Message',
						content: 'Hey, when you gonna get to working on Atlas?',
						description: 'You have a new message from Germancito',
						meta: new Date().toLocaleString(),
						avatar: 'https://cdn.discordapp.com/avatars/546732670005149706/a_e13719b9b4bd45834565ef8fb34e325e.gif?size=256',
						duration: 5000,
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
				<Hud v-if="state.hud.on" :health="state.hud.health"/>
				<Carhud v-if="state.car.on" :speed="state.car.speed" :fuel="state.car.fuel" :gear="state.car.gear" :lights="state.car.lights" :seatbelt="state.car.seatbelt"/>
			</NDialogProvider>
		</NNotificationProvider>
	</NMessageProvider>
	<NGlobalStyle/>
</template>

<style>
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@100;300;400;500;600;700;800;900&display=swap');

#app {
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
	height: 100vh;
	margin: 0 auto;
}
</style>