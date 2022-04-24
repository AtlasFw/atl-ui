UI.StartCountdown = function(duration)
  if type(duration) ~= 'number' then
    error('UI: Missing required parameters for countdown')
    return false
  end

  SendNUIMessage({
    action = 'countdown',
    start = true,
    duration = duration,
  })
  return true
end

UI.CancelCountdown = function()
  SendNUIMessage({
    action = 'countdown',
    start = false,
  })
  return true
end

RegisterNUICallback('endCountdown', function(data, cb)
  print('Ended countdown of ' .. data.duration .. 'ms')
  TriggerEvent('atl-ui:countdownEnded', data.duration, data.cancelled)
  cb({})
end)
