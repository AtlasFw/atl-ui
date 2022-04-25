export const Image = (start, duration) => {
  if (window.$image) {
    window.$image(start, duration)
    return
  }
  console.log('Could not set countdown')
}