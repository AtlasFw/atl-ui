<script setup>
defineProps({
	speed: {
		type: Number,
		default: 0
	},
	fuel: {
		type: Number,
		default: 0
	},
	gear: {
		type: Number,
		default: 0
	},
	seatbelt: {
		type: Boolean,
		default: false
	},
	lights: {
		type: Number,
		default: 0
	}
})

const lightsState = (lights) => {
	if (lights === 0) {
		return 'text-neutral-600'
	} else if (lights === 1) {
		return 'text-neutral-400'
	} else if (lights === 2) {
		return 'text-neutral-50'
	}
}

const seatbeltState = (seatbelt) => seatbelt ? 'text-neutral-50' : 'text-neutral-600'
</script>

<template>
  <div class="absolute flex justify-end items-end h-full w-full overflow-hidden">
		<div class="flex flex-col justify-center items-start text-sm mb-3 mr-3 fuel">
			<div class="mb-1 flex flex-row justify-between w-full">
				<div class="flex items-end">
					<span class="text-3xl font-bold mr-0.5 transition duration-150">{{ speed }}</span>
					<span class="text-neutral-400 font-medium">km/h</span>
				</div>
				<div class="flex items-end justify-end">
					<span class="text-3xl font-bold mr-1 transition duration-150">{{ gear }}</span>
					<div class="flex flex-col mb-1 ml-0.5">
						<svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mb-1.5 transition duration-150" :class="lightsState(lights)" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
							<path stroke-linecap="round" stroke-linejoin="round" d="M9.663 17h4.673M12 3v1m6.364 1.636l-.707.707M21 12h-1M4 12H3m3.343-5.657l-.707-.707m2.828 9.9a5 5 0 117.072 0l-.548.547A3.374 3.374 0 0014 18.469V19a2 2 0 11-4 0v-.531c0-.895-.356-1.754-.988-2.386l-.548-.547z" />
						</svg>
						<svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 transition duration-150" :class="seatbeltState(seatbelt)" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
							<path stroke-linecap="round" stroke-linejoin="round" d="M13.828 10.172a4 4 0 00-5.656 0l-4 4a4 4 0 105.656 5.656l1.102-1.101m-.758-4.899a4 4 0 005.656 0l4-4a4 4 0 00-5.656-5.656l-1.1 1.1" />
						</svg>
					</div>
				</div>
			</div>
			<progress class="w-full h-2 transition duration-150" :value="fuel" max="100"></progress>
		</div>
  </div>
</template>

<style>
.fuel {
	width: calc(100% / 8);
}

progress {
	transform: skewX(-20deg);
}

progress::-webkit-progress-bar {
	background-color: rgba(168, 168, 168, 0.4);
}

progress::-webkit-progress-value {
	background-color: #dc9a0d;
}

</style>