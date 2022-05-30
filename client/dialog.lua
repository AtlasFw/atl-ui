UI.DialogResp = {}
UI.Dialog = function(id, data, cb)
	if type(id) ~= "string" then
		error("UI: Missing required id")
		return false
	end
	if type(data.type) ~= "string" or type(data.title) ~= "string" or type(data.content) ~= "string" or type(data.posBtn) ~= "string" or type(data.negBtn) ~= "string" or type(data.posMsg) ~= "string" or type(data.negMsg) ~= "string" then
		error("UI: Missing required parameters for notify")
		return false
	end
	if type(cb) ~= "function" then
		error("UI: Missing required callback function")
		return false
	end

	UI.DialogResp[id] = cb

	SendNUIMessage({
		action = 'dialog',
		id = id,
		type = data.type,
		title = data.title,
		content = data.content,
		posBtn = data.posBtn,
		negBtn = data.negBtn,
		posMsg = data.posMsg,
		negMsg = data.negMsg
	})
	return true
end

RegisterNUICallback('atl_dialog_resp', function(data, cb)
	if UI.DialogResp[data.id] then
		UI.DialogResp[data.id](data.resp)
	end
	UI.DialogResp[data.id] = nil
	cb({})
end)