local function notify(data)
  if type(data.type) ~= 'string' or type(message) ~= 'string' then
    print('UI: Missing required parameters for notify')
    return
  end

  SendNUIMessage({
    action = 'notify',
    type = data.type,
    message = data.message,
    duration = data.duration
  })
end

exports('Notify', notify)
