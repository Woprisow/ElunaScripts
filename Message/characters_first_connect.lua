require('Sysluna')
local function OnFirstConnect (event, player)
    SendWorldMessage('Bienvenue à '..player:GetName()..', reroll ou nouveau joueur peu importe, nous te souhaitons tous la bievenue!')
end

RegisterPlayerEvent(PlayerEvent.FirstLogin, OnFirstConnect)
