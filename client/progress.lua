local activeProgress

UI.StartProgress = function(data)
  local progress = data.progress
  if type(progress) ~= 'table' or type(progress.status) ~= 'string' or type(progress.duration) ~= 'number' or progress.duration < 1000 then
    error('UI: Missing required parameters for progress')
    return false
  end

  SendNUIMessage({
    action = 'progress',
    type = progress.type,
    status = progress.status,
    duration = progress.duration,
    indicator = progress.indicator,
    placement = progress.placement,
  })
  activeProgress = data

  local activeProps = {}
  local ped = PlayerPedId()
  local prop, anim = data.prop, data.anim
  if prop then
    if prop.model then
      -- Need method from core to create prop
      activeProps[1] = nil
    else
      for i = 1, #prop do
        -- Need method from core to create prop and request model
        activeProps[i] = nil
      end
    end
  end

  if anim then
    if anim.dict then
      -- Request anim from core
      TaskPlayAnim(ped, anim.dict, anim.clip, 1.5, 1.5, -1, 0, 1, 1, 1)
    elseif anim.scenario then
      TaskStartScenarioInPlace(ped, data.anim.scenario, 0, true)
    end
  end

  -- Disable controls
  if data.disable then
    while activeProgress do
      DisableAllControlActions(0)
      Wait(0)
    end
  end

  -- Clean up anims/props
  if anim then
    ClearPedTasks(ped)
  end

  if prop then
    for i = 1, #prop do
      if DoesEntityExist(activeProps[i]) then
        DeleteEntity(activeProps[i])
      end
    end
  end

  return true
end

UI.ProgressStatus = function()
  return activeProgress ~= nil
end

RegisterNUICallback('endProgress', function(_, cb)
  activeProgress = nil
  cb({})
end)
