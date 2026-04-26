local callback = nil
local inMinigame = false
local result = nil

local function loadSafeAudio()
	RequestAmbientAudioBank( "SAFE_CRACK", false )
end

local function StartMinigame(cb, combo)
    if inMinigame then return false end
    loadSafeAudio()
    result = nil
    local combination = combo
    if type(combination) ~= "table" then
        combination = {
            math.random(0, 99),
            math.random(0, 99),
            math.random(0, 99)
        }
    end
    SetNuiFocus(true, false)
    SendNUIMessage({
        action = "openSafe",
        combination = combination
    })
    if Config.Debug then
        print(("Safe Combination: %s %s %s"):format(
            combination[1],
            combination[2],
            combination[3]
        ))
    end
    inMinigame = true
    callback = cb
    while result == nil do
        Wait(5)
    end
    return result
end

local function StopMinigame()
    if Config.Debug then
        print("Minigame stopped")
    end
    SetNuiFocus(false, false)
    SendNUIMessage({ action = "close" })
    inMinigame = false
    return result
end

RegisterNUICallback("safeSuccess", function(data, cb)
    if Config.Debug then
        print("Minigame succeeded")
    end
    result = true
    SetNuiFocus(false, false)
    inMinigame = false
    if callback then
        callback(true)
        callback = nil
    end
    cb('ok')
end)

RegisterNUICallback("failed", function()
    if Config.Debug then
        print("Minigame failed")
    end
    result = false
    SetNuiFocus(false, false)
    PlaySoundFrontend(PlayerId(), "Hack_Fail", "DLC_sum20_Business_Battle_AC_Sounds", true)
    inMinigame = false
    if callback then
        callback(false)
        callback = nil
    end
end)

RegisterNUICallback("closeSafe", function(data, cb)
    if Config.Debug then
        print("Minigame closed")
    end
    result = false
    SetNuiFocus(false, false)
    SendNUIMessage({ action = "close" })
    inMinigame = false
    if callback then
        callback(false)
        callback = nil
    end
    cb('ok')
end)



RegisterNUICallback("playSound", function(data, cb)
    local action = data.action
    if action == "turn" then
        PlaySoundFrontend( 0, "TUMBLER_TURN", "SAFE_CRACK_SOUNDSET", true )
    elseif action == "next" then
        PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
    elseif action == "back" then
        PlaySoundFrontend(-1, "BACK", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
    elseif action == "error" then
        PlaySoundFrontend(-1, "ERROR", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
    elseif action == "success" then
        PlaySoundFrontend( 0, "TUMBLER_RESET", "SAFE_CRACK_SOUNDSET", true )
    end
    cb('ok')
end)

if Config.Debug then
    RegisterCommand("safeminigametest", function(source, args)
        local combo = {
            tonumber(args[1]) or math.random(0,99),
            tonumber(args[2]) or math.random(0,99),
            tonumber(args[3]) or math.random(0,99)
        }

        exports['v-safeminigame']:StartMinigame(function(success)
            if success then
                print("Player succeeded the minigame!")
            else
                print("Player failed the minigame.")
            end
        end, combo)
    end, false)
end

exports('StartMinigame', StartMinigame)
exports('StopMinigame', StopMinigame)