require('Sysluna')
local function OnPlayerCommand(event, player, command)
    local gmRank = player:GetGMRank()
    if (gmRank > 0 and command == "cheatstuff")then
        player:AddItem(43651)
        player:AddItem(12064)
        player:AddItem(2586)
        player:AddItem(11508)
        player:AddItem(18582)
        player:AddItem(17)
        player:AddItem(192)
        return false
    end
end

RegisterPlayerEvent(PlayerEvent.Command, OnPlayerCommand)
