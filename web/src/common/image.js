export const Image = (position) => {
  if (window.$image) {
    window.$image(position)
    return
  }
  console.log('Could not set countdown')
}