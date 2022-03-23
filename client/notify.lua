local function notify(type, message, duration)
  if not type or not message then
    print('UI: Missing required parameters for notify')
    return
  end

  SendNUIMessage({
    action = 'notify',
    type = type,
    message = message,
    duration = duration or 2000
  })
end

exports('Notify', notify)