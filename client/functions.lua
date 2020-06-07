ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

local multipler = 5

GetChopList = function(source)
	if ChopRandom == 1 then
		serverId = GetPlayerServerId(PlayerId())
		local class = 1
        ESX.TriggerServerCallback('disc-gcphone:getNumber', function(number)
            message = 'Bring us any of these Vehicles: ' ..Config.ChopLow[1].. ' | ' ..Config.ChopLow[2].. ' | ' ..Config.ChopLow[3].. ' | ' ..Config.ChopLow[4].. ' | ' ..Config.ChopLow[5].. '.'
            TriggerServerEvent('disc-gcphone:sendMessageFrom', 'Chop Guy', number, message, serverId)
        end)
	elseif ChopRandom == 2 then
		local class = 2
        serverId = GetPlayerServerId(PlayerId())
        ESX.TriggerServerCallback('disc-gcphone:getNumber', function(number)
            message = 'Bring us any of these Vehicles: ' ..Config.ChopMed[1].. ' | ' ..Config.ChopMed[2].. ' | ' ..Config.ChopMed[3].. ' | ' ..Config.ChopMed[4].. ' | ' ..Config.ChopMed[5].. '.'
            TriggerServerEvent('disc-gcphone:sendMessageFrom', 'Chop Guy', number, message, serverId)
        end)
	elseif ChopRandom == 3 then
		local class = 3
        serverId = GetPlayerServerId(PlayerId())
        ESX.TriggerServerCallback('disc-gcphone:getNumber', function(number)
            message = 'Bring us any of these Vehicles: ' ..Config.ChopHigh[1].. ' | ' ..Config.ChopHigh[2].. ' | ' ..Config.ChopHigh[3].. ' | ' ..Config.ChopHigh[4].. ' | ' ..Config.ChopHigh[5].. '.'
            TriggerServerEvent('disc-gcphone:sendMessageFrom', 'Chop Guy', number, message, serverId)
        end)
	elseif ChopRandom == 4 then
		local class = 4
        serverId = GetPlayerServerId(PlayerId())
        ESX.TriggerServerCallback('disc-gcphone:getNumber', function(number)
            message = 'Bring us any of these Vehicles: ' ..Config.ChopExtreme[1].. ' | ' ..Config.ChopExtreme[2].. ' | ' ..Config.ChopExtreme[3].. ' | ' ..Config.ChopExtreme[4].. ' | ' ..Config.ChopExtreme[5].. '.'
            TriggerServerEvent('disc-gcphone:sendMessageFrom', 'Chop Guy', number, message, serverId)
        end)
	end
end

AllowChop = function(hash, source)
	local veh = vehicle
	if ChopRandom == 1 then
		if hash == GetHashKey(Config.ChopLow[1]) or hash == GetHashKey(Config.ChopLow[2]) or hash == GetHashKey(Config.ChopLow[3]) or hash == GetHashKey(Config.ChopLow[4]) or hash == GetHashKey(Config.ChopLow[5]) then
			local class = 1
			local ped = PlayerPedId()
			local vehicle = GetVehiclePedIsIn( ped, false )
			local frontLeftDoor = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'door_dside_f')
			local frontRightDoor = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'door_pside_f')
			local rearLeftDoor = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'door_dside_r')
			local rearRightDoor = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'door_pside_r')
			local bonnet = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'bonnet')
			local boot = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'boot')
			local ChoppingInProgress = true
--			SetVehicleNumberPlateText(vehicle, "stolen")
			SetVehicleEngineOn(vehicle, false, false, true)
			SetVehicleUndriveable(vehicle, false)
			if frontLeftDoor ~= -1 and ChoppingInProgress == true then
				exports['progressBars']:startUI(5000, "Opening Front Left Door")
				Citizen.Wait(5000)
				SetVehicleDoorOpen(GetVehiclePedIsIn(ped, false), 0, false, false)
			end
			Citizen.Wait(1000)
			if frontRightDoor ~= -1 and ChoppingInProgress == true then
				exports['progressBars']:startUI(5000, "Opening Front Right Door")
				Citizen.Wait(5000)
				SetVehicleDoorOpen(GetVehiclePedIsIn(ped, false), 1, false, false)
			end
			Citizen.Wait(1000)
			if rearLeftDoor ~= -1 and ChoppingInProgress == true then
				exports['progressBars']:startUI(5000, "Opening Rear Left Door")
				Citizen.Wait(5000)
				SetVehicleDoorOpen(GetVehiclePedIsIn(ped, false), 2, false, false)
			end
			Citizen.Wait(1000)
			if rearRightDoor ~= -1 and ChoppingInProgress == true then
				exports['progressBars']:startUI(5000, "Opening Rear Right Door")
				Citizen.Wait(5000)
				SetVehicleDoorOpen(GetVehiclePedIsIn(ped, false), 3, false, false)
			end
			Citizen.Wait(1000)
			if bonnet ~= -1 and ChoppingInProgress == true then
				exports['progressBars']:startUI(5000, "Opening Hood")
				Citizen.Wait(5000)
				SetVehicleDoorOpen(GetVehiclePedIsIn(ped, false), 4, false, false)
			end
			Citizen.Wait(1000)
			if boot ~= -1 and ChoppingInProgress == true then
				exports['progressBars']:startUI(5000, "Opening Trunk")
				Citizen.Wait(5000)
				SetVehicleDoorOpen(GetVehiclePedIsIn(ped, false), 5, false, false)
			end
			Citizen.Wait(1000)
			if frontLeftDoor ~= -1 and ChoppingInProgress == true then
				TriggerServerEvent("InteractSound_SV:PlayOnSource", "impactdrill", 0.3)
				exports['progressBars']:startUI(5000, "Removing Front Left Door")
				Citizen.Wait(5000)
				SetVehicleDoorBroken(GetVehiclePedIsIn(ped, false), 0, true)
			end
			Citizen.Wait(1000)
			if frontRightDoor ~= -1 and ChoppingInProgress == true then
				TriggerServerEvent("InteractSound_SV:PlayOnSource", "impactdrill", 0.3)
				exports['progressBars']:startUI(5000, "Removing Front Right Door")
				Citizen.Wait(5000)
				SetVehicleDoorBroken(GetVehiclePedIsIn(ped, false), 1, true)
			end
			Citizen.Wait(1000)
			if rearLeftDoor ~= -1 and ChoppingInProgress == true then
				TriggerServerEvent("InteractSound_SV:PlayOnSource", "impactdrill", 0.3)
				exports['progressBars']:startUI(5000, "Removing Rear Left Door")
				Citizen.Wait(5000)
				SetVehicleDoorBroken(GetVehiclePedIsIn(ped, false), 2, true)
			end
			Citizen.Wait(1000)
			if rearRightDoor ~= -1 and ChoppingInProgress == true then
				TriggerServerEvent("InteractSound_SV:PlayOnSource", "impactdrill", 0.3)
				exports['progressBars']:startUI(5000, "Removing Rear Right Door")
				Citizen.Wait(5000)
				SetVehicleDoorBroken(GetVehiclePedIsIn(ped, false), 3, true)
			end
			Citizen.Wait(1000)
			if bonnet ~= -1 and ChoppingInProgress == true then
				TriggerServerEvent("InteractSound_SV:PlayOnSource", "impactdrill", 0.3)
				exports['progressBars']:startUI(5000, "Removing Hood")
				Citizen.Wait(5000)
				SetVehicleDoorBroken(GetVehiclePedIsIn(ped, false),4, true)
			end
			Citizen.Wait(1000)
			if boot ~= -1 and ChoppingInProgress == true then
				TriggerServerEvent("InteractSound_SV:PlayOnSource", "impactdrill", 0.3)
				exports['progressBars']:startUI(5000, "Removing Trunk")
				Citizen.Wait(5000)
				SetVehicleDoorBroken(GetVehiclePedIsIn(ped, false),5, true)
			end
			Citizen.Wait(1000)
			exports['progressBars']:startUI(5000, "Vehicle will now go to the CRUSHER!")
			Citizen.Wait(5000)
			if ChoppingInProgress == true then
				DeleteVehicle()
				exports['mythic_notify']:SendAlert('success', 'Vehicle Chopped Successfully...', 5000)
				TriggerEvent('CheckDist', vehicle, class)
			end
			local ChoppingInProgress = false
		end
	elseif ChopRandom == 2 then
		if hash == GetHashKey(Config.ChopMed[1]) or hash == GetHashKey(Config.ChopMed[2]) or hash == GetHashKey(Config.ChopMed[3]) or hash == GetHashKey(Config.ChopMed[4]) or hash == GetHashKey(Config.ChopMed[5]) then
			local class = 2
			local ped = PlayerPedId()
			local vehicle = GetVehiclePedIsIn( ped, false )
			local frontLeftDoor = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'door_dside_f')
			local frontRightDoor = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'door_pside_f')
			local rearLeftDoor = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'door_dside_r')
			local rearRightDoor = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'door_pside_r')
			local bonnet = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'bonnet')
			local boot = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'boot')
			local ChoppingInProgress = true
--			SetVehicleNumberPlateText(vehicle, "stolen")
			SetVehicleEngineOn(vehicle, false, false, true)
			SetVehicleUndriveable(vehicle, false)
			if frontLeftDoor ~= -1 and ChoppingInProgress == true then
				exports['progressBars']:startUI(5000, "Opening Front Left Door")
				Citizen.Wait(5000)
				SetVehicleDoorOpen(GetVehiclePedIsIn(ped, false), 0, false, false)
			end
			Citizen.Wait(1000)
			if frontRightDoor ~= -1 and ChoppingInProgress == true then
				exports['progressBars']:startUI(5000, "Opening Front Right Door")
				Citizen.Wait(5000)
				SetVehicleDoorOpen(GetVehiclePedIsIn(ped, false), 1, false, false)
			end
			Citizen.Wait(1000)
			if rearLeftDoor ~= -1 and ChoppingInProgress == true then
				exports['progressBars']:startUI(5000, "Opening Rear Left Door")
				Citizen.Wait(5000)
				SetVehicleDoorOpen(GetVehiclePedIsIn(ped, false), 2, false, false)
			end
			Citizen.Wait(1000)
			if rearRightDoor ~= -1 and ChoppingInProgress == true then
				exports['progressBars']:startUI(5000, "Opening Rear Right Door")
				Citizen.Wait(5000)
				SetVehicleDoorOpen(GetVehiclePedIsIn(ped, false), 3, false, false)
			end
			Citizen.Wait(1000)
			if bonnet ~= -1 and ChoppingInProgress == true then
				exports['progressBars']:startUI(5000, "Opening Hood")
				Citizen.Wait(5000)
				SetVehicleDoorOpen(GetVehiclePedIsIn(ped, false), 4, false, false)
			end
			Citizen.Wait(1000)
			if boot ~= -1 and ChoppingInProgress == true then
				exports['progressBars']:startUI(5000, "Opening Trunk")
				Citizen.Wait(5000)
				SetVehicleDoorOpen(GetVehiclePedIsIn(ped, false), 5, false, false)
			end
			if frontLeftDoor ~= -1 and ChoppingInProgress == true then
				TriggerServerEvent("InteractSound_SV:PlayOnSource", "impactdrill", 0.3)
				exports['progressBars']:startUI(5000, "Removing Front Left Door")
				Citizen.Wait(5000)
				SetVehicleDoorBroken(GetVehiclePedIsIn(ped, false), 0, true)
			end
			Citizen.Wait(1000)
			if frontRightDoor ~= -1 and ChoppingInProgress == true then
				TriggerServerEvent("InteractSound_SV:PlayOnSource", "impactdrill", 0.3)
				exports['progressBars']:startUI(5000, "Removing Front Right Door")
				Citizen.Wait(5000)
				SetVehicleDoorBroken(GetVehiclePedIsIn(ped, false), 1, true)
			end
			Citizen.Wait(1000)
			if rearLeftDoor ~= -1 and ChoppingInProgress == true then
				TriggerServerEvent("InteractSound_SV:PlayOnSource", "impactdrill", 0.3)
				exports['progressBars']:startUI(5000, "Removing Rear Left Door")
				Citizen.Wait(5000)
				SetVehicleDoorBroken(GetVehiclePedIsIn(ped, false), 2, true)
			end
			Citizen.Wait(1000)
			if rearRightDoor ~= -1 and ChoppingInProgress == true then
				TriggerServerEvent("InteractSound_SV:PlayOnSource", "impactdrill", 0.3)
				exports['progressBars']:startUI(5000, "Removing Rear Right Door")
				Citizen.Wait(5000)
				SetVehicleDoorBroken(GetVehiclePedIsIn(ped, false), 3, true)
			end
			Citizen.Wait(1000)
			if bonnet ~= -1 and ChoppingInProgress == true then
				TriggerServerEvent("InteractSound_SV:PlayOnSource", "impactdrill", 0.3)
				exports['progressBars']:startUI(5000, "Removing Hood")
				Citizen.Wait(5000)
				SetVehicleDoorBroken(GetVehiclePedIsIn(ped, false),4, true)   
			end
			Citizen.Wait(1000)
			if boot ~= -1 and ChoppingInProgress == true then
				TriggerServerEvent("InteractSound_SV:PlayOnSource", "impactdrill", 0.3)
				exports['progressBars']:startUI(5000, "Removing Trunk")
				Citizen.Wait(5000)
				SetVehicleDoorBroken(GetVehiclePedIsIn(ped, false),5, true)
			end
			Citizen.Wait(1000)
			exports['progressBars']:startUI(5000, "Vehicle will now go to the CRUSHER!")
			Citizen.Wait(5000)
			if ChoppingInProgress == true then
				DeleteVehicle()
				exports['mythic_notify']:SendAlert('success', 'Vehicle Chopped Successfully...', 5000)
				TriggerEvent('CheckDist', vehicle, class)
			end
			local ChoppingInProgress = false
		end
	elseif ChopRandom == 3 then
		if hash == GetHashKey(Config.ChopHigh[1]) or hash == GetHashKey(Config.ChopHigh[2]) or hash == GetHashKey(Config.ChopHigh[3]) or hash == GetHashKey(Config.ChopHigh[4]) or hash == GetHashKey(Config.ChopHigh[5]) then
			local class = 3
			local ped = PlayerPedId()
			local vehicle = GetVehiclePedIsIn( ped, false )
			local frontLeftDoor = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'door_dside_f')
			local frontRightDoor = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'door_pside_f')
			local rearLeftDoor = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'door_dside_r')
			local rearRightDoor = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'door_pside_r')
			local bonnet = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'bonnet')
			local boot = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'boot')
			local ChoppingInProgress = true
--			SetVehicleNumberPlateText(vehicle, "stolen")
			SetVehicleEngineOn(vehicle, false, false, true)
			SetVehicleUndriveable(vehicle, false)
			if frontLeftDoor ~= -1 and ChoppingInProgress == true then
				exports['progressBars']:startUI(5000, "Opening Front Left Door")
				Citizen.Wait(5000)
				SetVehicleDoorOpen(GetVehiclePedIsIn(ped, false), 0, false, false)
			end
			Citizen.Wait(1000)
			if frontRightDoor ~= -1 and ChoppingInProgress == true then
				exports['progressBars']:startUI(5000, "Opening Front Right Door")
				Citizen.Wait(5000)
				SetVehicleDoorOpen(GetVehiclePedIsIn(ped, false), 1, false, false)
			end
			Citizen.Wait(1000)
			if rearLeftDoor ~= -1 and ChoppingInProgress == true then
				exports['progressBars']:startUI(5000, "Opening Rear Left Door")
				Citizen.Wait(5000)
				SetVehicleDoorOpen(GetVehiclePedIsIn(ped, false), 2, false, false)
			end
			Citizen.Wait(1000)
			if rearRightDoor ~= -1 and ChoppingInProgress == true then
				exports['progressBars']:startUI(5000, "Opening Rear Right Door")
				Citizen.Wait(5000)
				SetVehicleDoorOpen(GetVehiclePedIsIn(ped, false), 3, false, false)
			end
			Citizen.Wait(1000)
			if bonnet ~= -1 and ChoppingInProgress == true then
				exports['progressBars']:startUI(5000, "Opening Hood")
				Citizen.Wait(5000)
				SetVehicleDoorOpen(GetVehiclePedIsIn(ped, false), 4, false, false)
			end
			Citizen.Wait(1000)
			if boot ~= -1 and ChoppingInProgress == true then
				exports['progressBars']:startUI(5000, "Opening Trunk")
				Citizen.Wait(5000)
				SetVehicleDoorOpen(GetVehiclePedIsIn(ped, false), 5, false, false)
			end
			if frontLeftDoor ~= -1 and ChoppingInProgress == true then
				TriggerServerEvent("InteractSound_SV:PlayOnSource", "impactdrill", 0.3)
				exports['progressBars']:startUI(5000, "Removing Front Left Door")
				Citizen.Wait(5000)
				SetVehicleDoorBroken(GetVehiclePedIsIn(ped, false), 0, true)
			end
			Citizen.Wait(1000)
			if frontRightDoor ~= -1 and ChoppingInProgress == true then
				TriggerServerEvent("InteractSound_SV:PlayOnSource", "impactdrill", 0.3)
				exports['progressBars']:startUI(5000, "Removing Front Right Door")
				Citizen.Wait(5000)
				SetVehicleDoorBroken(GetVehiclePedIsIn(ped, false), 1, true)
			end
			Citizen.Wait(1000)
			if rearLeftDoor ~= -1 and ChoppingInProgress == true then
				TriggerServerEvent("InteractSound_SV:PlayOnSource", "impactdrill", 0.3)
				exports['progressBars']:startUI(5000, "Removing Rear Left Door")
				Citizen.Wait(5000)
				SetVehicleDoorBroken(GetVehiclePedIsIn(ped, false), 2, true)
			end
			Citizen.Wait(1000)
			if rearRightDoor ~= -1 and ChoppingInProgress == true then
				TriggerServerEvent("InteractSound_SV:PlayOnSource", "impactdrill", 0.3)
				exports['progressBars']:startUI(5000, "Removing Rear Right Door")
				Citizen.Wait(5000)
				SetVehicleDoorBroken(GetVehiclePedIsIn(ped, false), 3, true)
			end
			Citizen.Wait(1000)
			if bonnet ~= -1 and ChoppingInProgress == true then
				TriggerServerEvent("InteractSound_SV:PlayOnSource", "impactdrill", 0.3)
				exports['progressBars']:startUI(5000, "Removing Hood")
				Citizen.Wait(5000)
				SetVehicleDoorBroken(GetVehiclePedIsIn(ped, false),4, true)
			end
			Citizen.Wait(1000)
			if boot ~= -1 and ChoppingInProgress == true then
				TriggerServerEvent("InteractSound_SV:PlayOnSource", "impactdrill", 0.3)
				exports['progressBars']:startUI(5000, "Removing Trunk")
				Citizen.Wait(5000)
				SetVehicleDoorBroken(GetVehiclePedIsIn(ped, false),5, true)
			end
			Citizen.Wait(1000)
			exports['progressBars']:startUI(5000, "Vehicle will now go to the CRUSHER!")
			Citizen.Wait(5000)
			if ChoppingInProgress == true then
				DeleteVehicle()
				exports['mythic_notify']:SendAlert('success', 'Vehicle Chopped Successfully...', 5000)
				TriggerEvent('CheckDist', vehicle, class)
			end
			local ChoppingInProgress = false
		end
	elseif ChopRandom == 4 then
		if hash == GetHashKey(Config.ChopExtreme[1]) or hash == GetHashKey(Config.ChopExtreme[2]) or hash == GetHashKey(Config.ChopExtreme[3]) or hash == GetHashKey(Config.ChopExtreme[4]) or hash == GetHashKey(Config.ChopExtreme[5]) then
			local class = 4
			local ped = PlayerPedId()
			local vehicle = GetVehiclePedIsIn( ped, false )
			local frontLeftDoor = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'door_dside_f')
			local frontRightDoor = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'door_pside_f')
			local rearLeftDoor = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'door_dside_r')
			local rearRightDoor = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'door_pside_r')
			local bonnet = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'bonnet')
			local boot = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'boot')
			local ChoppingInProgress = true
--			SetVehicleNumberPlateText(vehicle, "Stolen")
			SetVehicleEngineOn(vehicle, false, false, true)
			SetVehicleUndriveable(vehicle, false)
			Citizen.Wait(1000)
			if frontRightDoor ~= -1 and ChoppingInProgress == true then
				exports['progressBars']:startUI(5000, "Opening Front Left Door")
				Citizen.Wait(5000)
				SetVehicleDoorOpen(GetVehiclePedIsIn(ped, false), 0, false, false)
			end
			Citizen.Wait(1000)
			if frontLeftDoor ~= -1 and ChoppingInProgress == true then
				exports['progressBars']:startUI(5000, "Opening Front Right Door")
				Citizen.Wait(5000)
				SetVehicleDoorOpen(GetVehiclePedIsIn(ped, false), 1, false, false)
			end
			Citizen.Wait(1000)
			if rearLeftDoor ~= -1 and ChoppingInProgress == true then
				exports['progressBars']:startUI(5000, "Opening Rear Left Door")
				Citizen.Wait(5000)
				SetVehicleDoorOpen(GetVehiclePedIsIn(ped, false), 2, false, false)
			end
			Citizen.Wait(1000)
			if rearRightDoor ~= -1 and ChoppingInProgress == true then
				exports['progressBars']:startUI(5000, "Opening Rear Right Door")
				Citizen.Wait(5000)
				SetVehicleDoorOpen(GetVehiclePedIsIn(ped, false), 3, false, false)
			end
			Citizen.Wait(1000)
			if bonnet ~= -1 and ChoppingInProgress == true then
				exports['progressBars']:startUI(5000, "Opening Hood")
				Citizen.Wait(5000)
				SetVehicleDoorOpen(GetVehiclePedIsIn(ped, false), 4, false, false)
			end
			Citizen.Wait(1000)
			if boot ~= -1 and ChoppingInProgress == true then
				exports['progressBars']:startUI(5000, "Opening Trunk")
				Citizen.Wait(5000)
				SetVehicleDoorOpen(GetVehiclePedIsIn(ped, false), 5, false, false)
			end
			if frontLeftDoor ~= -1 and ChoppingInProgress == true then
				TriggerServerEvent("InteractSound_SV:PlayOnSource", "impactdrill", 0.3)
				exports['progressBars']:startUI(5000, "Removing Front Left Door")
				Citizen.Wait(5000)
				SetVehicleDoorBroken(GetVehiclePedIsIn(ped, false), 0, true)
			end
			Citizen.Wait(1000)
			if frontRightDoor ~= -1 and ChoppingInProgress == true then
				TriggerServerEvent("InteractSound_SV:PlayOnSource", "impactdrill", 0.3)
				exports['progressBars']:startUI(5000, "Removing Front Right Door")
				Citizen.Wait(5000)
				SetVehicleDoorBroken(GetVehiclePedIsIn(ped, false), 1, true)
			end
			Citizen.Wait(1000)
			if rearLeftDoor ~= -1 and ChoppingInProgress == true then
				TriggerServerEvent("InteractSound_SV:PlayOnSource", "impactdrill", 0.3)
				exports['progressBars']:startUI(5000, "Removing Rear Left Door")
				Citizen.Wait(5000)
				SetVehicleDoorBroken(GetVehiclePedIsIn(ped, false), 2, true)
			end
			Citizen.Wait(1000)
			if rearRightDoor ~= -1 and ChoppingInProgress == true then
				TriggerServerEvent("InteractSound_SV:PlayOnSource", "impactdrill", 0.3)
				exports['progressBars']:startUI(5000, "Removing Rear Right Door")
				Citizen.Wait(5000)
				SetVehicleDoorBroken(GetVehiclePedIsIn(ped, false), 3, true)
			end
			Citizen.Wait(1000)
			if bonnet ~= -1 and ChoppingInProgress == true then
				TriggerServerEvent("InteractSound_SV:PlayOnSource", "impactdrill", 0.3)
				exports['progressBars']:startUI(5000, "Removing Hood")
				Citizen.Wait(5000)
				SetVehicleDoorBroken(GetVehiclePedIsIn(ped, false),4, true)
			end
			Citizen.Wait(1000)
			if boot ~= -1 and ChoppingInProgress == true then
				TriggerServerEvent("InteractSound_SV:PlayOnSource", "impactdrill", 0.3)
				exports['progressBars']:startUI(5000, "Removing Trunk")
				Citizen.Wait(5000)
				SetVehicleDoorBroken(GetVehiclePedIsIn(ped, false),5, true)
			end
			Citizen.Wait(1000)
			exports['progressBars']:startUI(5000, "Vehicle will now go to the CRUSHER!")
			Citizen.Wait(5000)
			if ChoppingInProgress == true then
				DeleteVehicle()
				exports['mythic_notify']:SendAlert('success', 'Vehicle Chopped Successfully...', 5000)
				TriggerEvent('CheckDist', vehicle, class)
			end
			local ChoppingInProgress = false
		end
	end
end
