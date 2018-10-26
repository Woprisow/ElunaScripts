require('sysluna')
local function OnGuildMemberKillCreature (event, player, creature)
  if(player:IsInGuild() == true)then

    local GetFunction = {}
      local GetFunction.PlayerGUID = player:GetGUIDLow()
      local GetFunction.PlayerGuildId = player:GetGuildId()
      local GetFunction.PlayerLevel = player:GetLevel()
      local GetFunction.CreatureLevel = creature:GetLevel()
      local GetFunction.PlayerMap = player:GetMapId()

    local Calcul = {}
      local Calcul.HighLevel = (GetFunction.PlayerLevel - GetFunction.CreatureLevel)
      local Calcul.LowLevel = (GetFunction.CreatureLevel - GetFunction.PlayerLevel)

      local Calcul.ClassicExp = ((GetFunction.PlayerLevel * 5) + 45)
      local Calcul.BcExp = ((GetFunction.PlayerLevel * 5) + 235)
      local Calcul.NorthendExp = ((GetFunction.PlayerLevel * 5) + 580)
-- CLASSIC EXP --
    for MapId,MapName in pairs(ClassicMapID) do
      if(MapId == GetFunction.PlayerMap)then
        local Q0 = CharDBQuery("SELECT final_exp, level, current_exp FROM `eluna`.`guild_base` WHERE guild_id = "..GetFunction.PlayerGuildId.."")
        if(Q0 ~= nil)then
          local final_exp = Q0:GetUInt32(0)
          local level = Q0:GetUInt32(1)
          local current_exp = Q0:GetUInt32(2)
          if(Calcul.HighLevel <= 5 or Calcul.LowLevel >= -5 and level ~= 24)then
            local CharDBQuery("UPDATE `eluna`.`guild_members_stats` SET totalexp = totalexp + "..Calcul.ClassicExp.." WHERE member_id = "..GetFunction.PlayerGUID.."")
            local CharDBQuery("UPDATE `eluna`.`guild_base` SET current_exp = current_exp + "..Calcul.ClassicExp.." WHERE guild_id = "..GetFunction.PlayerGuildId.."")
            if(current_exp >= final_exp)then
              local CharDBQuery("UPDATE `eluna`.`guild_base` SET current_exp = 0 WHERE guild_id = "..GetFunction.PlayerGuildId.."")
              local CharDBQuery("UPDATE `eluna`.`guild_base` SET final_exp = final_exp * 2 WHERE guild_id = "..GetFunction.PlayerGuildId.."")
              local CharDBQuery("UPDATE `eluna`.`guild_base` SET level = level + 1 WHERE guild_id = "..GetFunction.PlayerGuildId.."")
            end
          end
        end
      end
    end
-- BC EXP --
    for MapId,MapName in pairs(BCMapID) do
      if(MapId == GetFunction.PlayerMap)then
        local Q0 = CharDBQuery("SELECT final_exp, level, current_exp FROM `eluna`.`guild_base` WHERE guild_id = "..GetFunction.PlayerGuildId.."")
        if(Q0 ~= nil)then
          local final_exp = Q0:GetUInt32(0)
          local level = Q0:GetUInt32(1)
          local current_exp = Q0:GetUInt32(2)
          if(Calcul.HighLevel <= 5 or Calcul.LowLevel >= -5 and level ~= 24)then
            local CharDBQuery("UPDATE `eluna`.`guild_members_stats` SET totalexp = totalexp + "..Calcul.BcExp.." WHERE member_id = "..GetFunction.PlayerGUID.."")
            local CharDBQuery("UPDATE `eluna`.`guild_base` SET current_exp = current_exp + "..Calcul.BcExp.." WHERE guild_id = "..GetFunction.PlayerGuildId.."")
            if(current_exp >= final_exp)then
              local CharDBQuery("UPDATE `eluna`.`guild_base` SET current_exp = 0 WHERE guild_id = "..GetFunction.PlayerGuildId.."")
              local CharDBQuery("UPDATE `eluna`.`guild_base` SET final_exp = final_exp * 2 WHERE guild_id = "..GetFunction.PlayerGuildId.."")
              local CharDBQuery("UPDATE `eluna`.`guild_base` SET level = level + 1 WHERE guild_id = "..GetFunction.PlayerGuildId.."")
            end
          end
        end
      end
    end
-- TLK EXP --
    for MapId,MapName in pairs(TLKMapID) do
      if(MapId == GetFunction.PlayerMap)then
        local Q0 = CharDBQuery("SELECT final_exp, level, current_exp FROM `eluna`.`guild_base` WHERE guild_id = "..GetFunction.PlayerGuildId.."")
        if(Q0 ~= nil)then
          local final_exp = Q0:GetUInt32(0)
          local level = Q0:GetUInt32(1)
          local current_exp = Q0:GetUInt32(2)
          if(Calcul.HighLevel <= 5 or Calcul.LowLevel >= -5 and level ~= 24)then
            local CharDBQuery("UPDATE `eluna`.`guild_members_stats` SET totalexp = totalexp + "..Calcul.BcExp.." WHERE member_id = "..GetFunction.PlayerGUID.."")
            local CharDBQuery("UPDATE `eluna`.`guild_base` SET current_exp = current_exp + "..Calcul.BcExp.." WHERE guild_id = "..GetFunction.PlayerGuildId.."")
            if(current_exp >= final_exp)then
              local CharDBQuery("UPDATE `eluna`.`guild_base` SET current_exp = 0 WHERE guild_id = "..GetFunction.PlayerGuildId.."")
              local CharDBQuery("UPDATE `eluna`.`guild_base` SET final_exp = final_exp * 2 WHERE guild_id = "..GetFunction.PlayerGuildId.."")
              local CharDBQuery("UPDATE `eluna`.`guild_base` SET level = level + 1 WHERE guild_id = "..GetFunction.PlayerGuildId.."")
            end
          end
        end
      end
    end
  end
end
RegisterPlayerEvent(PlayerEvent.KillCreature, OnGuildMemberKillCreature)
