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
                Draw3DText(ChopLocation['x'],ChopLocation['y'],ChopLocation['z'],'[~g~E~s~] To Chop Vehicle')
                DrawMarker(27, ChopLocation['x'],ChopLocation['y'],ChopLocation['z'] - 0.98, 0, 0, 0, 0, 0, 0, 3.0, 3.0, 2.5, 139, 16, 20, 250, false, false, 2, true, false, false, false)
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
AddEventHandler('CheckDist', function(vehicle, class)
	local ChopLocation = vector3(2343.53, 3052.26, 48.15)
	local playerCoords = GetEntityCoords(PlayerPedId())
	local dist = #(vector3(ChopLocation['x'],ChopLocation['y'],ChopLocation['z']) - playerCoords)
	if dist < 2 then
		if class == 1 then 
			TriggerServerEvent('SB-ChopLow', source)
			TriggerEvent('delete:vehicle', vehicle)
		elseif class == 2 then
			TriggerServerEvent('SB-ChopMed', source)
			TriggerEvent('delete:vehicle', vehicle)
		elseif class  == 3 then
			TriggerServerEvent('SB-ChopHigh', source)
			TriggerEvent('delete:vehicle', vehicle)
		elseif class == 4 then 
			TriggerServerEvent('SB-ChopExtreme', source)
			TriggerEvent('delete:vehicle', vehicle)
		end
	end
end)

RegisterNetEvent('SB-GetList')
AddEventHandler('SB-GetList', function()
	GetChopList(source)
end)

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/choplist', "Cars for Chop sent to phone")
end)

RegisterNetEvent('delete:vehicle')
AddEventHandler( 'delete:vehicle', function(vehicle)
    local ped = GetPlayerPed(-1)
    if IsPedSittingInAnyVehicle(ped) then 
        ESX.Game.DeleteVehicle(vehicle)
    end 
end)

function Draw3DText(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
        
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)

        if Vdist2(coords, Config.NPCShop.x, Config.NPCShop.y, Config.NPCShop.z) <= 5 then
            Draw3DText(Config.NPCShop.x, Config.NPCShop.y, Config.NPCShop.z + 0.5, '~w~Press [~g~E~w~] to talk to ~g~Stanley~s~')

            if IsControlJustReleased(0, 38) then
                wasOpen = true
                OpenShop()
            end
        else
            if wasOpen then
                wasOpen = false
                ESX.UI.Menu.CloseAll()
            end

            Citizen.Wait(500)
        end
    end
end)

function OpenShop()
    local elements = {}
    menuOpen = true

    for k, v in pairs(ESX.GetPlayerData().inventory) do
        local price = Config.itemsPrice[v.name]

        if price and v.count > 0 then
            table.insert(elements, {
                label = ('%s - <span style="color:green;">%s</span>'):format(v.label, _U('item', ESX.Math.GroupDigits(price))),
                name = v.name,
                price = price,

                -- menu properties
                type = 'slider',
                value = 1,
                min = 1,
                max = v.count
            })
        end
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'car_shop', {
        title    = _U('shop_title'),
        align    = 'top-right',
        elements = elements
    }, function(data, menu)
        TriggerServerEvent('chopshop:sell', data.current.name, data.current.value)
    end, function(data, menu)
        menu.close()
        menuOpen = false
    end)
end

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        if menuOpen then
            ESX.UI.Menu.CloseAll()
        end
    end
end)

Citizen.CreateThread(function()
    if Config.NPCEnable == true then
        RequestModel(Config.NPCHash)
        while not HasModelLoaded(Config.NPCHash) do
            Wait(1)
        end
        --PROVIDER
        parts_dealer = CreatePed(1, Config.NPCHash, Config.NPCShop.x, Config.NPCShop.y, Config.NPCShop.z-1, Config.NPCShop.h, false, true)
        SetBlockingOfNonTemporaryEvents(parts_dealer, true)
        SetPedDiesWhenInjured(parts_dealer, false)
        SetPedCanPlayAmbientAnims(parts_dealer, true)
        SetPedCanRagdollFromPlayerImpact(parts_dealer, false)
        SetEntityInvincible(parts_dealer, true)
        FreezeEntityPosition(parts_dealer, true)
        TaskStartScenarioInPlace(parts_dealer, "WORLD_HUMAN_SMOKING_POT", 0, true);
    else
    end
end)
