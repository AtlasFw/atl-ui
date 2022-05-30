import { fetchNui } from "../utils/fetchNui";

const TYPES = {
	success: 'success',
	info: 'info',
	warning: 'warning',
	error: 'error',
}

export const Dialog = (id, type, title, content, posBtn, negBtn, posMsg, negMsg) => {
	if (window.$dialog) {
		const t = TYPES[type.toLowerCase()]
		if (t) {
			window.$dialog[t]({
				title: title,
				content: content,
				positiveText: posBtn,
				negativeText: negBtn,
				maskClosable: false,
				closable: false,
				closeOnEsc: false,
				onPositiveClick: () => {
					fetchNui('atl_dialog_resp', {id: id, resp: true}).then(() => {
						window.$notify['success'](posMsg)
					})
				},
				onNegativeClick: () => {
					fetchNui('atl_dialog_resp', {id: id, resp: false}).then(() => {
						window.$notify['error'](negMsg)
					})
				}
			})
			return
		}
	}
	console.log('Could not send notification')
}