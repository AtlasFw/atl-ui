import { NAvatar } from 'naive-ui'
import { defineComponent, h } from 'vue'

const TYPES = {
  success: 'success',
  info: 'info',
  warning: 'warning',
  error: 'error',
}

export const AdvNotify = (type, title, description, content, duration, meta, avatar) => {
  const t = TYPES[type.toLowerCase()]
  console.log('Type:', t)
  if (window.$advnotify) {
    if (t) {
      console.log(duration)
      if (avatar !== undefined) {
          window.$advnotify[t]({
            title: title,
            description: description,
            duration: duration,
            content: content,
            closable: false,
            meta: meta,
            avatar: () => h(NAvatar, {
              src: avatar,
              size: 'small',
              round: true
            })
          })
      } else {
          window.$advnotify[t]({
            title: title,
            description: description,
            duration: duration,
            content: content,
            closable: false,
            meta: meta,
          })
      }
      return
    }
  }
  console.log('Could not send notification')
}