import { defineComponent } from 'vue'

const TYPES = {
  success: 'success',
  info: 'info',
  warning: 'warning',
  error: 'error',
}

export const Progress = (duration) => {
  if (window.$progress) {
    if (window.$progress(6000)) {
      return
    }
  }
  console.log('Could start progress')
}