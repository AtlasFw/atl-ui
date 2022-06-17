local MULTIPLIER = 3.6 -- 2.236936 miles

local function startCarhud(vehicle)
	CreateThread(function()
		while UI.CarhudState do
			if DoesEntityExist(vehicle) then
				local speed = GetEntitySpeed(vehicle)
				local rpm = GetVehicleCurrentRpm(vehicle)
				local fuel = GetVehicleFuelLevel(vehicle)
				local headlight, headlightMedium, headlightHigh = GetVehicleLightsState(vehicle)
				if headlightMedium == 1 and not headlightHigh == 0 then
					headlight = 2
				elseif headlightMedium == 1 and headlightMedium == 1 then
					headlight = 1
				else
					headlight = 0
				end
				SendNUIMessage({
					action = 'carhudData',
					on = IsVehicleEngineOn(vehicle),
					speed = speed * MULTIPLIER,
					rpm = speed and rpm == 0 and 'R' or speed == 0 and 'N' or rpm,
					fuel = fuel,
					headlight = headlight
				})
				Wait(50)
			end
		end
	end)
end

CreateThread(function()
	while true do
		local ped = PlayerPedId()
		local vehicle = GetVehiclePedIsIn(ped, false)
		local class = GetVehicleClass(vehicle)
		if vehicle > 0 and class ~= 8 and class ~= 13 then
			if not UI.CarhudState then
				UI.CarhudState = true
				startCarhud(vehicle)
			end
		else
			if UI.CarhudState then
				UI.CarhudState = false
				SendNUIMessage({
					action = 'carhudOff',
				})
			end
		end
		Wait(1000)
	end
end)

exports('startCarhud', startCarhud)