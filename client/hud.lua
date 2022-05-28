local function startHud()
	UI.HudState = true
	CreateThread(function()
		while UI.HudState do
			local ped = PlayerPedId()
			local health = (GetEntityHealth(ped) - 100) * 100 / (GetEntityMaxHealth(ped) - 100)
			if health < 0 then
				health = 0
			end
			SendNUIMessage({
				action = 'hud',
				health = health
			})
			Wait(300)
		end
	end)
end

startHud()