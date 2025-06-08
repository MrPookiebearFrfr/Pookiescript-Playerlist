RegisterNetEvent("blsrp:getPlayerList", function()
    local src = source
    local players = {}

    for _, playerId in ipairs(GetPlayers()) do
        local name = GetPlayerName(playerId)
        local discord = "N/A"

        for _, id in ipairs(GetPlayerIdentifiers(playerId)) do
            if string.sub(id, 1, 8) == "discord:" then
                discord = string.sub(id, 9)
                break
            end
        end

        table.insert(players, {
            name = name,
            id = tonumber(playerId),
            discord = discord
        })
    end

    TriggerClientEvent("blsrp:sendPlayerList", src, players)
end)
