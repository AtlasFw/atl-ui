<script setup>
</script>

<template>
  <div class="absolute h-full w-full bg-green-500 left-0 top-0 flex justify-start items-end">
		<div class="z-20 w-full flex flex-col">
			<div class="relative h-3 bg-blue-50 bars flex overflow-hidden">
				<span class="h-full z-30 bg-green-500 w-[90%] absolute"></span>
			</div>
			<div class="relative h-3 bg-blue-50 bars flex overflow-hidden">
				<span class="h-full z-30 bg-green-500 w-[90%] absolute"></span>
			</div>
			<div class="relative h-3 bg-blue-50 bars flex overflow-hidden">
				<span class="h-full z-30 bg-green-500 w-[90%] absolute"></span>
			</div>
			<div class="relative h-3 bg-blue-50 bars flex overflow-hidden">
				<span class="h-full z-30 bg-green-500 w-[90%] absolute"></span>
			</div>
		</div>
  </div>
</template>

<style>
.bars {
	width: calc(100% / 8);
	transform: skewX(-25deg);
	margin-left: calc(0.5% + 0.25vw);
	margin-bottom: calc(0.25% + 0.25vh);
	border: 1px solid black;
	box-shadow: 0 1px 1vh 0.05vh rgba(0, 0, 0, 0.35);
	background: rgba(0, 0, 0, 0.6);
	z-index: 1;
}
</style>