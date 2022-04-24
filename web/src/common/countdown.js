export const Countdown = (start, duration) => {
  if (window.$countdown) {
    window.$countdown(start, duration)
    return
  }
  console.log('Could not send notification')
}