const TYPES = {
	success: 'success',
	info: 'info',
	warning: 'warning',
	error: 'error',
}

export const Alert = (type, title, message, duration) => {
	if (window.$alert) {
		const t = TYPES[type.toLowerCase()]
		if (t) {
			window.$alert(t, title, message, duration)
			return
		}
	}
	console.log('Could not send alert')
}