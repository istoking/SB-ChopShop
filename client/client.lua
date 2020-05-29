ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Notes: Use ChopRandom for function of math random
Citizen.CreateThread( function()
	while true do
		ChopRandom = math.random(1,4)
		Citizen.Wait(1800000)
	end
	-- body
end)

local ChopLocation = vector3(2343.53, 3052.26, 48.15)
local source = GetPlayerPed( -1 )


Citizen.CreateThread(function()
    local chopPos = vector3(ChopLocation['x'],ChopLocation['y'],ChopLocation['z'])
    while true do
        local ped = GetPlayerPed( -1 )
        local sleep = 200
        local playerCoords = GetEntityCoords(PlayerPedId())
        local distCheck =  #(vector3(ChopLocation['x'],ChopLocation['y'],ChopLocation['z']) - playerCoords)
        if distCheck <= 50 then
            sleep = 20
            if distCheck <= 25 and IsPedInAnyVehicle(ped, false) then
                sleep = 5
                DrawText3Ds(ChopLocation['x'],ChopLocation['y'],ChopLocation['z'],'[~g~E~s~] To Chop Vehicle')
                DrawMarker(27, ChopLocation['x'],ChopLocation['y'],ChopLocation['z'] - 0.98, 0, 0, 0, 0, 0, 0, 3.5, 3.5, 3.0, 139, 16, 20, 250, false, false, 2, true, false, false, false)
                if IsControlJustPressed(2, 86) then
                    local car = GetVehiclePedIsIn(ped, false)
                    local hash = GetEntityModel(car)
                    AllowChop(hash)
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)

RegisterNetEvent('CheckDist')
AddEventHandler('CheckDist', function(class)
	local ChopLocation = vector3(2343.53, 3052.26, 48.15)
	local playerCoords = GetEntityCoords(PlayerPedId())
	local dist = #(vector3(ChopLocation['x'],ChopLocation['y'],ChopLocation['z']) - playerCoords)
	if dist < 2 then
		if class == 1 then 
			TriggerServerEvent('SB-ChopLow', source)
			TriggerEvent('Delete')
		elseif class == 2 then
			TriggerServerEvent('SB-ChopMed', source)
			TriggerEvent('Delete')
		elseif class  == 3 then
			TriggerServerEvent('SB-ChopHigh', source)
			TriggerEvent('Delete')
		elseif class == 4 then 
			TriggerServerEvent('SB-ChopExtreme', source)
			TriggerEvent('Delete')
		end
	end
end)

RegisterNetEvent('SB-GetList')
AddEventHandler('SB-GetList', function()
	GetChopList(source)
end)

RegisterNetEvent('Delete')
AddEventHandler( 'Delete', function()
    local ped = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(ped, false)
    if IsPedSittingInAnyVehicle(ped) then 
        SetEntityAsMissionEntity(vehicle, true, true)
        deleteCar(vehicle)
    end 
end)
