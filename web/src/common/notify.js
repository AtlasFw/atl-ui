const TYPES = {
  success: 'success',
  info: 'info',
  warning: 'warning',
  error: 'error',
}

export const Notify = (type, message, duration) => {
  if (window.$notify) {
    const t = TYPES[type.toLowerCase()]
    if (t) {
      window.$notify[t](message, { duration: duration })
      return
    }
  }
  console.log('Could not send notification')
}