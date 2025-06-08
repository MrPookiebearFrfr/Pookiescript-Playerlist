local isShowing = false

RegisterCommand("togglePlayerList", function()
    isShowing = not isShowing

    if isShowing then
        TriggerServerEvent("blsrp:getPlayerList")
        SendNUIMessage({ type = "show" })
        SetNuiFocus(false, false)
    else
        SendNUIMessage({ type = "hide" })
    end
end, false)

RegisterKeyMapping("togglePlayerList", "Toggle Player List UI", "keyboard", "F10")

RegisterNetEvent("blsrp:sendPlayerList", function(players)
    SendNUIMessage({
        type = "updatePlayerList",
        players = players
    })
end)
