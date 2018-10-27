require('sysluna')

--[[TEMPORARY SCRIPT]]--
local function OnPlayerCommand(event, player, command)
  if (command == "guild_members_stats")then
    if(player:GetGuildId() ~= nil)then
      local Q0 = CharDBQuery('SELECT totalexp FROM `eluna`.`guild_members_stats` WHERE member_id = '..player:GetGUIDLow()..'')
        if(Q0 ~= nil)then
          local TotalExp = Q0:GetUInt32(0)
          player:SendBroadcastMessage("You have contributed "..TotalExp.." experience points to your guild since your arrival in this one!")
        end
    end
  end
  return false
end

RegisterPlayerEvent(PlayerEvent.Command, OnPlayerCommand)
