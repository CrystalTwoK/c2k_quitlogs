local lang = Config.Locales[Config.Locale]

local function DrawUpper3DText(x, y, z, text)
    local onScreen, _x, _y=World3dToScreen2d(x, y, z)
    local px, py, pz=table.unpack(GetGameplayCamCoords())
    local color = Config.UpperTextColor
    local scale = Config.UpperTextScale
    
    SetTextScale(scale.x, scale.y)
    SetTextFont(Config.UpperTextFont)
    SetTextProportional(1)
    SetTextColour(color.r, color.g, color.b, color.a)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
end

local function DrawLower3DText(x, y, z, text)
    local onScreen, _x, _y=World3dToScreen2d(x, y, z)
    local px, py, pz=table.unpack(GetGameplayCamCoords())
    local color = Config.LowerTextColor
    local scale = Config.LowerTextScale

    SetTextScale(scale.x, scale.y)
    SetTextFont(Config.LowerTextFont)
    SetTextProportional(1)
    SetTextColour(color.r, color.g, color.b, color.a)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
end

local function Display(id, coords, identifier, reason)

    if Config.Debug then print(reason) end
    
    local displaying = true

    Citizen.CreateThread(function()
        
        Citizen.Wait(Config.DisplayTime * 1000)
        
        displaying = false
    end)
	
    Citizen.CreateThread(function()
        
        while displaying do
        
            Citizen.Wait(0)
            
            local pcoords = GetEntityCoords(PlayerPedId())

            if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, pcoords.x, pcoords.y, pcoords.z, true) < Config.LogsDrawDistance then
                
                if reason == 'exiting' then
            
                    DrawUpper3DText(coords.x, coords.y, coords.z + Config.UpperTextZOffset, lang['player_left'])
            
                    DrawLower3DText(coords.x, coords.y, coords.z + Config.LowerTextZOffset, "ID: " .. id .. " [" .. identifier .. "]")
                elseif reason == 'respawn' then

                    DrawUpper3DText(coords.x, coords.y, coords.z + Config.UpperTextZOffset, lang['player_respawned'])
            
                    DrawLower3DText(coords.x, coords.y, coords.z + Config.LowerTextZOffset, "ID: " .. id .. " [" .. identifier .. "]")
                elseif reason == 'test' then

                    DrawUpper3DText(coords.x, coords.y, coords.z + Config.UpperTextZOffset, lang['command_used'])
            
                    DrawLower3DText(coords.x, coords.y, coords.z + Config.LowerTextZOffset, "ID: " .. id .. " [" .. identifier .. "]")
                else
                    DrawUpper3DText(coords.x, coords.y, coords.z + Config.UpperTextZOffset, lang['player_crashed'])
            
                    DrawLower3DText(coords.x, coords.y, coords.z + Config.LowerTextZOffset, "ID: " .. id .. " [" .. identifier .. "]")

                end
            else
            
                Citizen.Wait(2000)
            end
        end
    end)
end

RegisterNetEvent("c2k_quitlogs:client:displayText")
AddEventHandler("c2k_quitlogs:client:displayText", function(id, coords, identifier, reason)
    Display(id, coords, identifier, reason)
end)

local hasSpawned = false

AddEventHandler("playerSpawned", function()
    if not hasSpawned then
        TriggerServerEvent("c2k_quitlogs:server:sendJoinLog")
        hasSpawned = true
    end
end)