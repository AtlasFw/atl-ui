UI.Notify = function(data)
  if type(data.type) ~= 'string' or type(data.message) ~= 'string' then
    error('UI: Missing required parameters for notify')
    return false
  end

  SendNUIMessage({
    action = 'notify',
    type = data.type,
    message = data.message,
    duration = data.duration,
  })
end
