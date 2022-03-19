<script setup>
import { onMounted } from 'vue';
import { useMessage } from 'naive-ui'
window.$message = useMessage()

onMounted(() => {
  window.$message.success('Hello World!')
})
</script>

<template>
  <div></div>
</template>