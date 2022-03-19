import { useMessage } from 'naive-ui'
import { defineComponent } from 'vue'

export const Notify = (type, message) => {
  // You need to ensure that window.$message = message has been executed in setup
  window.$message.success('test')
}