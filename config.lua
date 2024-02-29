--[[

 ██████╗██████╗ ██╗  ██╗         ██████╗ ██╗   ██╗██╗████████╗██╗      ██████╗  ██████╗ ███████╗
██╔════╝╚════██╗██║ ██╔╝        ██╔═══██╗██║   ██║██║╚══██╔══╝██║     ██╔═══██╗██╔════╝ ██╔════╝
██║      █████╔╝█████╔╝         ██║   ██║██║   ██║██║   ██║   ██║     ██║   ██║██║  ███╗███████╗
██║     ██╔═══╝ ██╔═██╗         ██║▄▄ ██║██║   ██║██║   ██║   ██║     ██║   ██║██║   ██║╚════██║
╚██████╗███████╗██║  ██╗███████╗╚██████╔╝╚██████╔╝██║   ██║   ███████╗╚██████╔╝╚██████╔╝███████║
 ╚═════╝╚══════╝╚═╝  ╚═╝╚══════╝ ╚══▀▀═╝  ╚═════╝ ╚═╝   ╚═╝   ╚══════╝ ╚═════╝  ╚═════╝ ╚══════╝     
 
 Author: Andrea "Crystal2K" Marucci
 Version: 1.0.0
 Website: www.andreamarucci.com

]]

Config = {}

Config.Debug = false -- false if you don't want to activate the test command
Config.TestCommandGroup = 'god'
Config.TestCommandName = 'testquitlogs'

Config.DisplayTime = 45 -- in Seconds
Config.Identifier = 1 -- Choose the identifier you want to use! / 0: Steam HEX | 1: Rockstar License | 2: Discord ID | 3: FIVEM ID | 4: Rockstar License 2 | 5: User's Public IP
Config.LogsDrawDistance = 15.0

-- UPPER TEXT SETTINGS
Config.UpperTextFont = 4 -- Fonts: https://wiki.rage.mp/index.php?title=Fonts_and_Colors
Config.UpperTextScale = {x = 0.45, y = 0.45}
Config.UpperTextColor = {r = 255, g = 12, b = 40, a = 215} -- Red, Green, Blue, Alpha (Transparency)
Config.UpperTextZOffset = 0.25

-- LOWER TEXT SETTINGS
Config.LowerTextFont = 4 -- Fonts: https://wiki.rage.mp/index.php?title=Fonts_and_Colors
Config.LowerTextScale = {x = 0.45, y = 0.45}
Config.LowerTextColor = {r = 255, g = 255, b = 255, a = 215} -- Red, Green, Blue, Alpha (Transparency)
Config.LowerTextZOffset = 0.0

Config.Locale = 'it'

Config.Locales = {
    ['en'] = { -- English
        ['player_left'] = "Player Left",
        ['player_respawned'] = "Player Respawned",
        ['player_crashed'] = "Player Crashed",
        ['command_used'] = "Test Command Used",
        ['command_description'] = "Test C2K_QUITLOGS",
    },
    ['it'] = { -- Italiano
        ['player_left'] = "Giocatore Uscito",
        ['player_respawned'] = "Giocatore Respawnato",
        ['player_crashed'] = "Giocatore Crashato",
        ['command_used'] = "Comando di Test Usato",
        ['command_description'] = "Prova C2K_QUITLOGS",
    },
}