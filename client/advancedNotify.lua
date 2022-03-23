local function advancedNotify(type, title, description, content, duration, meta, avatar)
	if not type or not title or not description or not content then
		print('UI: Missing required arguments for advNotify')
		return
	end

	SendNUIMessage({
		type = 'advNotify',
		title = title,
		description = description,
		content = content,
		duration = duration,
		meta = meta or nil,
		avatar = avatar or nil
	})
end

exports('AdvancedNotify', advancedNotify)