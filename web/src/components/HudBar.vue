<script setup>
defineProps({
	barId: {
		type: String,
		required: true
	},
	fill: {
		type: String,
		default: "#4cfd73"
	},
	background: {
		type: String,
		default: "rgba(47,47,47,0.71)"
	},
	value: {
		type: Number,
		default: 100
	},
})
</script>

<template>
	<div :id="barId" :style="{backgroundColor: background}" class="relative opacity-70 bars flex overflow-hidden">
		<span :style="{backgroundColor: fill, width: `${value}%`}" class="h-full z-30 bg-green-500 absolute"></span>
	</div>
</template>

<style>
.bars {
	width: calc(100% / 8);
	height: calc(100vh / 80);
	transform: skewX(-25deg);
	margin-left: calc(0.5% + 0.25vw);
	margin-bottom: calc(0.25% + 0.25vh);
	border: 1px solid black;
	box-shadow: 0 1px 1vh 0.05vh rgba(0, 0, 0, 0.35);
	background: rgba(0, 0, 0, 0.6);
	z-index: 1;
}
</style>