UI = {
  HudState = true,
  CarhudState = true,
}

exports('UI', function()
  return UI
end)

RegisterCommand("test", function()
  UI.Notify({
    type = 'success',
    message = 'Hello World!'
  })
end)