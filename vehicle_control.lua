
RegisterCommand("hood", function(source, args, rawCommand)
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    if vehicle and vehicle ~= 0 then
        local hoodOpen = GetVehicleDoorAngleRatio(vehicle, 4) > 0.1
        if hoodOpen then
            SetVehicleDoorShut(vehicle, 4, false) 
            TriggerEvent('chat:addMessage', {args = {"^2System", "Hood closed."}})
        else
            SetVehicleDoorOpen(vehicle, 4, false, false) 
            TriggerEvent('chat:addMessage', {args = {"^2System", "Hood opened."}})
        end
    else
        TriggerEvent('chat:addMessage', {args = {"^1Error", "You are not in a vehicle!"}})
    end
end, false)


RegisterCommand("trunk", function(source, args, rawCommand)
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    if vehicle and vehicle ~= 0 then
        local trunkOpen = GetVehicleDoorAngleRatio(vehicle, 5) > 0.1
        if trunkOpen then
            SetVehicleDoorShut(vehicle, 5, false) 
            TriggerEvent('chat:addMessage', {args = {"^2System", "Trunk closed."}})
        else
            SetVehicleDoorOpen(vehicle, 5, false, false) 
            TriggerEvent('chat:addMessage', {args = {"^2System", "Trunk opened."}})
        end
    else
        TriggerEvent('chat:addMessage', {args = {"^1Error", "You are not in a vehicle!"}})
    end
end, false)


RegisterCommand("door", function(source, args, rawCommand)
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    if vehicle and vehicle ~= 0 then
        local doorId = tonumber(args[1]) 
        if doorId and doorId >= 0 and doorId <= 3 then 
            local doorOpen = GetVehicleDoorAngleRatio(vehicle, doorId) > 0.1
            if doorOpen then
                SetVehicleDoorShut(vehicle, doorId, false) 
                TriggerEvent('chat:addMessage', {args = {"^2System", "Door " .. doorId .. " closed."}})
            else
                SetVehicleDoorOpen(vehicle, doorId, false, false) 
                TriggerEvent('chat:addMessage', {args = {"^2System", "Door " .. doorId .. " opened."}})
            end
        else
            TriggerEvent('chat:addMessage', {args = {"^1Error", "Invalid door ID! Use 0 (front left), 1 (front right), 2 (rear left), or 3 (rear right)."}})
        end
    else
        TriggerEvent('chat:addMessage', {args = {"^1Error", "You are not in a vehicle!"}})
    end
end, false)
