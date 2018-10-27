require ('sysluna')

local function OnPlayerKillCreature (event, player, creature)
  if(player:IsInGuild() == true)then
    local Q0 = CharDBQuery("SELECT achievement_id FROM `eluna`.`guild_achievement` WHERE guild_id = "..player:GetGuildId().."")
    if(Q0 == nil)then
      local Q1 = CharDBQuery("SELECT progress FROM `eluna`.`guild_achievement_progress` WHERE guild_id = "..player:GetGuildId().." AND achievement_id = 5263")
      if(Q1 ~= nil)then
        local Progress = Q1:GetUInt32(0)
        if(creature:GetCreatureType() == 8)then
          local Q2 = CharDBQuery("UPDATE `eluna`.`guild_achievement_progress` SET progress = progress +1 WHERE guild_id = "..player:GetGuildId().." AND achievement_id = 5263")
          --
          local Q3 = CharDBQuery("SELECT progress FROM `eluna`.`guild_achievement_progress` WHERE guild_id = "..player:GetGuildId().." AND achievement_id = 5263")
          local Progress = Q3:GetUInt32(0)
          --
          local Q4 = CharDBQuery("SELECT value1 FROM `eluna`.`guild_achievement_criteria_data` WHERE achievement_id = 5263")
          local Final_Progress = Q4:GetUInt32(0)
          --
          if(Progress >= Final_Progress)then
            local Q5 = CharDBQuery("INSERT INTO `eluna`.`guild_achievement` VALUES ("..player:GetGuildId()..", 5263, 10)")
            local Q6 = CharDBQuery("DELETE FROM `eluna`.`guild_achievement_progress` WHERE guild_id = "..player:GetGuildId().." AND achievement_id = 5263")
            SendWorldMessage("Youpi Achievement add!")
          end
        end
      elseif(Q1 == nil)then
        if(creature:GetCreatureType() == 8)then
          local Q2 = CharDBQuery("INSERT INTO `eluna`.`guild_achievement_progress` VALUES ("..player:GetGuildId()..", 5263, 1, 1)")
        end
      end
    end
  end
end
RegisterPlayerEvent(PlayerEvent.KillCreature, OnPlayerKillCreature)
