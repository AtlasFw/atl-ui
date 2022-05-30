UI.AdvancedNotify = function(data)
  if type(data.title) ~= 'string' or type(data.description) ~= 'string' or type(data.content) ~= 'string' then
    error('UI: Missing required arguments for advNotify')
    return false
  end

  SendNUIMessage({
    type = 'advNotify',
    title = data.title,
    description = data.description,
    content = data.content,
    duration = data.duration,
    meta = data.meta,
    avatar = data.avatar,
  })
end

RegisterNetEvent('atl-ui:client:advNotify', UI.AdvancedNotify)