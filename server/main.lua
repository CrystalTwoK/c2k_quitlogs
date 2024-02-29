local QBCore = exports['qb-core']:GetCoreObject()
local lang = Config.Locales[Config.Locale]

AddEventHandler("playerDropped", function(reason)
    local id = source
    local coords = GetEntityCoords(GetPlayerPed(id))
    local identifierIndex = Config.Identifier
    local identifier = ""

  for k,v in pairs(GetPlayerIdentifiers(source))do
        
      if string.sub(v, 1, string.len("steam:")) == "steam:" then
        if v and identifierIndex == 0 then identifier = v end
      elseif string.sub(v, 1, string.len("license:")) == "license:" then
        if v and identifierIndex == 1 then identifier = v end
      elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
        if v and identifierIndex == 2 then identifier = v end
      elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
        if v and identifierIndex == 3 then identifier = v end
      elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
        if v and identifierIndex == 4 then identifier = v end
      elseif string.sub(v, 1, string.len("live:")) == "live:" then
        if v and identifierIndex == 5 then identifier = v end
      end
    
  end

  if Config.Debug then QBCore.Debug(reason) end
    
    TriggerClientEvent("c2k_quitlogs:client:displayText", -1, id, coords, identifier, reason:lower())
end)

if Config.Debug then
    QBCore.Commands.Add(Config.TestCommandName, lang['command_description'], {}, true, function(source, args)
        local id = source
        local coords = GetEntityCoords(GetPlayerPed(id))

        local identifierIndex = Config.Identifier
        local identifier = ""

        for k,v in pairs(GetPlayerIdentifiers(source))do
        
            if string.sub(v, 1, string.len("steam:")) == "steam:" then
                if v and identifierIndex == 0 then identifier = v end
            elseif string.sub(v, 1, string.len("license:")) == "license:" then
                if v and identifierIndex == 1 then identifier = v end
            elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
                if v and identifierIndex == 2 then identifier = v end
            elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
                if v and identifierIndex == 3 then identifier = v end
            elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
                if v and identifierIndex == 4 then identifier = v end
            elseif string.sub(v, 1, string.len("live:")) == "live:" then
                if v and identifierIndex == 5 then identifier = v end
            end
        end
        TriggerClientEvent("c2k_quitlogs:client:displayText", -1, id, coords, identifier, 'test')
    end, Config.TestCommandGroup)
end


RegisterServerEvent('c2k_quitlogs:server:sendJoinLog', function()
  local src = source
  local playerName = GetPlayerName(src)
  local identifiers = GetPlayerIdentifiers(src)
  local steamid  = ""
  local license  = ""
  local discord  = ""
  local xbl      = ""
  local liveid   = ""
  local ip       = ""

  for k,v in pairs(identifiers)do
    if string.sub(v, 1, string.len("steam:")) == "steam:" then
      if v then steamid = v:gsub('steam:', '') else steamid = "N/D" end
    elseif string.sub(v, 1, string.len("license:")) == "license:" then
      if v then license = v else license = "N/D" end
    elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
      if v then xbl  = v:gsub('xbl:', '') else xbl = "N/D" end
    elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
      if v then ip = v:gsub('ip:', '') else ip = "N/D" end
    elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
      if v then discord = v:gsub('discord:', '') else discord = "N/D" end
    elseif string.sub(v, 1, string.len("live:")) == "live:" then
      if v then liveid = v:gsub('live:', '') else liveid = "N/D" end
    end
  end

  TriggerEvent('c2k_apilogs:server:slackSend', 'identifiers', "*"..playerName.." | ID: "..src.." - IDENTIFIERS* \n```DISCORD: "..discord.."\nSTEAM HEX: "..steamid.."\nLICENZA: "..license.."\nXBOX LIVE: "..xbl.."\nLIVE ID: "..liveid.."\nIP: "..ip.."```")
  TriggerEvent('c2k_apilogs:server:slackSend', 'join', "*"..playerName.." | ID: "..src.." - E' ENTRATO NEL SERVER* \n```DISCORD: "..discord.."\nSTEAM HEX: "..steamid.."\nLICENZA: "..license.."\nXBOX LIVE: "..xbl.."\nLIVE ID: "..liveid.."```")
end)

AddEventHandler('playerDropped', function(reason)
  local src = source
  local playerName = GetPlayerName(src)
  local identifiers = GetPlayerIdentifiers(src)
  local playerCoords = GetEntityCoords(GetPlayerPed(src))
  local steamid  = ""
  local license  = ""
  local discord  = ""
  local xbl      = ""
  local liveid   = ""
  local ip       = ""

  for k,v in pairs(identifiers)do
    if string.sub(v, 1, string.len("steam:")) == "steam:" then
      if v then steamid = v:gsub('steam:', '') else steamid = "N/D" end
    elseif string.sub(v, 1, string.len("license:")) == "license:" then
      if v then license = v else license = "N/D" end
    elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
      if v then xbl  = v:gsub('xbl:', '') else xbl = "N/D" end
    elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
      if v then ip = v:gsub('ip:', '') else ip = "N/D" end
    elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
      if v then discord = v:gsub('discord:', '') else discord = "N/D" end
    elseif string.sub(v, 1, string.len("live:")) == "live:" then
      if v then liveid = v:gsub('live:', '') else liveid = "N/D" end
    end
  end

  if reason == "exiting" then reason = 'USCITO / F8 QUIT' end
  TriggerEvent('c2k_apilogs:server:slackSend', 'quit', "*"..playerName.." | ID: "..src.." - E' USCITO DAL SERVER* \n```DISCORD: "..discord.."\nSTEAM HEX: "..steamid.."\nLICENZA: "..license.."\nXBOX LIVE: "..xbl.."\nLIVE ID: "..liveid.."\nULTIME COORDINATE: "..playerCoords.x..", "..playerCoords.y..", "..playerCoords.z.."\nMOTIVO: "..reason.."```")
end)