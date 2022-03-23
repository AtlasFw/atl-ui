local function advancedNotify(data)
	if type(data.title) ~= 'string' or type(data.description) ~= 'string' or type(data.content) ~= 'string' then
		print('UI: Missing required arguments for advNotify')
		return
	end

	SendNUIMessage({
		type = 'advNotify',
		title = data.title,
		description = data.description,
		content = data.content,
		duration = data.duration,
		meta = data.meta,
		avatar = data.avatar
	})
end

exports('AdvancedNotify', advancedNotify)