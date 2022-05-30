const TYPES = {
	success: 'success',
	info: 'info',
	warning: 'warning',
	error: 'error',
}

export const Dialog = (type, title, content, posBtn, negBtn, posMsg, negMsg) => {
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
					window.$notify['success'](posMsg)
				},
				onNegativeClick: () => {
					window.$notify['error'](negMsg)
				}
			})
			return
		}
	}
	console.log('Could not send notification')
}