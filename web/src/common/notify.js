import { useMessage } from 'naive-ui'
import { defineComponent } from 'vue'

const TYPES = {
  success: 'success',
  info: 'info',
  warning: 'warning',
  error: 'error',
}

export const Notify = (type, message, duration) => {
  // You need to ensure that window.$message = message has been executed in setup
  const t = TYPES[type.toLowerCase()]
  console.log('Type:', t)
  if (window.$notify) {
    if (t) {
    console.log(duration)
      window.$notify[t](message, {
        duration: duration,
      })
      return
    }
  }
  console.log('Could not send notification')
}