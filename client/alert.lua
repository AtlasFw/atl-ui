local count = 0
UI.AlertResp = {}
UI.Alert = function(data, cb)
	if type(data.type) ~= "string" or type(data.title) ~= "string" or type(data.description) ~= "string" then
		error("UI: Missing required parameters for alert")
		return false
	end

	if type(cb) ~= "function" then
		error("UI: Missing required callback for alert")
		return false
	end

	UI.AlertResp[count] = cb

	SendNUIMessage({
		action = "alert",
		type = data.type,
		title = data.title,
		description = data.description,
		duration = data.duration,
	})
	return true
end

RegisterNUICallback("atl_ui_alert", function(data, cb)
	if data.restore ~= nil then
		count = 0
		UI.AlertResp = {}
		return
	end
	UI.AlertResp[data.count](data.resp)
	UI.AlertResp[data.count] = nil
	cb({})
	end)