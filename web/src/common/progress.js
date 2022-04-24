const TYPES = {
  success: 'success',
  info: 'info',
  warning: 'warning',
  error: 'error',
  default: 'default'
}

export const Progress = (type, status, duration, indicator, placement) => {
  if (window.$progress && status) {
    const t = TYPES[status.toLowerCase()]
    if (t) {
      if (window.$progress(type, t, duration, indicator, placement)) {
        return
      }
    }
  }
  console.log('Could start progress')
}