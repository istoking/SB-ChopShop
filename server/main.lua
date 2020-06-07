ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local ab = 'airbag'
local bt = 'battery'
local hr = 'highradio'
local hrim = 'highrim'
local lr = 'lowradio'
local sr = 'stockrim'

local payment = {}

RegisterCommand('choplist', function(source, args)
	TriggerClientEvent('SB-GetList', source)
end)

RegisterServerEvent('SB-ChopLow')
AddEventHandler('SB-ChopLow', function()
	local src = source
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer == xPlayer and Config.GiveBlack then
		xPlayer.addInventoryItem(ab, math.random(1, 3))
		xPlayer.addInventoryItem(bt, math.random(1, 3))
		xPlayer.addInventoryItem(hr, math.random(1, 3))
		xPlayer.addInventoryItem(hrim, math.random(1, 3))
		xPlayer.addInventoryItem(lr, math.random(1, 3))
		xPlayer.addInventoryItem(sr, math.random(1, 3))
		local payment = math.random(100, 200) 
		xPlayer.addAccountMoney('black_money', payment)
        TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'success', text = "You just made $" .. payment .. " dirty dollars from that chop.", length = 7000})
	else
		xPlayer.addInventoryItem(ab, math.random(1, 3))
		xPlayer.addInventoryItem(bt, math.random(1, 3))
		xPlayer.addInventoryItem(hr, math.random(1, 3))
		xPlayer.addInventoryItem(hrim, math.random(1, 3))
		xPlayer.addInventoryItem(lr, math.random(1, 3))
		xPlayer.addInventoryItem(sr, math.random(1, 3))
		local payment = math.random(100, 200) 
		xPlayer.addMoney(payment)
		TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'success', text = "You just made $" .. payment .. " clean dollars from that chop.", length = 7000})
	end
end)

RegisterServerEvent('SB-ChopMed')
AddEventHandler('SB-ChopMed', function()
	local src = source
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer == xPlayer and Config.GiveBlack then
		xPlayer.addInventoryItem(ab, math.random(2, 4))
		xPlayer.addInventoryItem(bt, math.random(2, 4))
		xPlayer.addInventoryItem(hr, math.random(2, 4))
		xPlayer.addInventoryItem(hrim, math.random(2, 4))
		xPlayer.addInventoryItem(lr, math.random(2, 4))
		xPlayer.addInventoryItem(sr, math.random(2, 4))
		local payment = math.random(200, 300) 
		xPlayer.addAccountMoney('black_money', payment)
        TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'success', text = "You just made $" .. payment .. " dirty dollars from that chop.", length = 7000})
	else
		xPlayer.addInventoryItem(ab, math.random(2, 4))
		xPlayer.addInventoryItem(bt, math.random(2, 4))
		xPlayer.addInventoryItem(hr, math.random(2, 4))
		xPlayer.addInventoryItem(hrim, math.random(2, 4))
		xPlayer.addInventoryItem(lr, math.random(2, 4))
		xPlayer.addInventoryItem(sr, math.random(2, 4))
		local payment = math.random(200, 300) 
		xPlayer.addMoney(payment)
		TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'success', text = "You just made $" .. payment .. " clean dollars from that chop.", length = 7000})
	end
end)

RegisterServerEvent('SB-ChopHigh')
AddEventHandler('SB-ChopHigh', function()
	local src = source
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer == xPlayer and Config.GiveBlack then
		xPlayer.addInventoryItem(ab, math.random(3, 5))
		xPlayer.addInventoryItem(bt, math.random(3, 5))
		xPlayer.addInventoryItem(hr, math.random(3, 5))
		xPlayer.addInventoryItem(hrim, math.random(3, 5))
		xPlayer.addInventoryItem(lr, math.random(3, 5))
		xPlayer.addInventoryItem(sr, math.random(3, 5))
		local payment = math.random(300, 400) 
		xPlayer.addAccountMoney('black_money', payment)
        TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'success', text = "You just made $" .. payment .. " dirty dollars from that chop.", length = 7000})
	else
		xPlayer.addInventoryItem(ab, math.random(3, 5))
		xPlayer.addInventoryItem(bt, math.random(3, 5))
		xPlayer.addInventoryItem(hr, math.random(3, 5))
		xPlayer.addInventoryItem(hrim, math.random(3, 5))
		xPlayer.addInventoryItem(lr, math.random(3, 5))
		xPlayer.addInventoryItem(sr, math.random(3, 5))
		local payment = math.random(300, 400) 
		xPlayer.addMoney(payment)
		TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'success', text = "You just made $" .. payment .. " clean dollars from that chop.", length = 7000})
	end
end)

RegisterServerEvent('SB-ChopExtreme')
AddEventHandler('SB-ChopExtreme', function()
	local src = source
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer == xPlayer and Config.GiveBlack then
		xPlayer.addInventoryItem(ab, math.random(4, 6))
		xPlayer.addInventoryItem(bt, math.random(4, 6))
		xPlayer.addInventoryItem(hr, math.random(4, 6))
		xPlayer.addInventoryItem(hrim, math.random(4, 6))
		xPlayer.addInventoryItem(lr, math.random(4, 6))
		xPlayer.addInventoryItem(sr, math.random(4, 6))
		local payment = math.random(400, 500) 
		xPlayer.addAccountMoney('black_money', payment)
        TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'success', text = "You just made $" .. payment .. " dirty dollars from that chop.", length = 7000})
	else
		xPlayer.addInventoryItem(ab, math.random(4, 6))
		xPlayer.addInventoryItem(bt, math.random(4, 6))
		xPlayer.addInventoryItem(hr, math.random(4, 6))
		xPlayer.addInventoryItem(hrim, math.random(4, 6))
		xPlayer.addInventoryItem(lr, math.random(4, 6))
		xPlayer.addInventoryItem(sr, math.random(4, 6))
		local payment = math.random(400, 500) 
		xPlayer.addMoney(payment)
		TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'success', text = "You just made $" .. payment .. " clean dollars from that chop.", length = 7000})
	end
end)

RegisterServerEvent('chopshop:sell')
AddEventHandler('chopshop:sell', function(itemName, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local price = Config.itemsPrice[itemName]
	local xItem = xPlayer.getInventoryItem(itemName)

	if xItem.count < amount then
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = _U('not_enough'), length = 5000})
		return
	end

	price = ESX.Math.Round(price * amount)
	if Config.GiveBlack then
		xPlayer.addAccountMoney('black_money', price)
	else
		xPlayer.addMoney(price)
	end

	xPlayer.removeInventoryItem(xItem.name, amount)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = _U('sold', amount, xItem.label, ESX.Math.GroupDigits(price)), length = 5000})
end)
