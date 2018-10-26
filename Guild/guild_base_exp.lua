require('sysluna')
local function OnGuildMemberKillCreature (event, player, creature)
  if(player:IsInGuild() == true)then

    GetFunction = {}
      GetFunction.PlayerGUID = player:GetGUIDLow()
      GetFunction.PlayerGuildId = player:GetGuildId()
      GetFunction.PlayerLevel = player:GetLevel()
      GetFunction.CreatureLevel = creature:GetLevel()
      GetFunction.PlayerMap = player:GetMapId()

    Calcul = {}
      Calcul.HighLevel = (GetFunction.PlayerLevel - GetFunction.CreatureLevel)
      Calcul.LowLevel = (GetFunction.CreatureLevel - GetFunction.PlayerLevel)

      Calcul.ClassicExp = ((GetFunction.PlayerLevel * 5) + 45)
      Calcul.BcExp = ((GetFunction.PlayerLevel * 5) + 235)
      Calcul.NorthendExp = ((GetFunction.PlayerLevel * 5) + 580)

    Message = {}
      Message.Congratulation = "Congratulations your guild just went up one level now it's level "
-- CLASSIC EXP --
    for MapId,MapName in pairs(ClassicMapID) do
      if(MapId == GetFunction.PlayerMap)then
        local Q0 = CharDBQuery("SELECT level FROM `eluna`.`guild_base` WHERE guild_id = "..GetFunction.PlayerGuildId.."")
        if(Q0 ~= nil)then
          local level = Q0:GetUInt32(0)
          if(Calcul.HighLevel <= 5 or Calcul.LowLevel >= -5 and level ~= 24)then
            local Q1 = CharDBQuery("UPDATE `eluna`.`guild_members_stats` SET totalexp = totalexp + "..Calcul.ClassicExp.." WHERE member_id = "..GetFunction.PlayerGUID.."")
            local Q2 = CharDBQuery("UPDATE `eluna`.`guild_base` SET current_exp = current_exp + "..Calcul.ClassicExp.." WHERE guild_id = "..GetFunction.PlayerGuildId.."")
            local Q0 = CharDBQuery("SELECT final_exp, current_exp FROM `eluna`.`guild_base` WHERE guild_id = "..GetFunction.PlayerGuildId.."")
            --
            local final_exp = Q0:GetUInt32(0)
            local current_exp = Q0:GetUInt32(1)
            if(current_exp >= final_exp)then
              local Q3 = CharDBQuery("UPDATE `eluna`.`guild_base` SET current_exp = 0 WHERE guild_id = "..GetFunction.PlayerGuildId.."")
              local Q4 = CharDBQuery("UPDATE `eluna`.`guild_base` SET final_exp = final_exp * 2 WHERE guild_id = "..GetFunction.PlayerGuildId.."")
              local Q5 = CharDBQuery("UPDATE `eluna`.`guild_base` SET level = level + 1 WHERE guild_id = "..GetFunction.PlayerGuildId.."")
              local levelup = level +1
              SendWorldMessage("|CFF00A728Congratulations to the guild "..player:GetGuildName().." which has just passed level "..levelup.."!")
            end
          end
        end
      end
    end
-- BC EXP --
    for MapId,MapName in pairs(BCMapID) do
      if(MapId == GetFunction.PlayerMap)then
        local Q0 = CharDBQuery("SELECT level FROM `eluna`.`guild_base` WHERE guild_id = "..GetFunction.PlayerGuildId.."")
        if(Q0 ~= nil)then
          local level = Q0:GetUInt32(0)
          if(Calcul.HighLevel <= 5 or Calcul.LowLevel >= -5 and level ~= 24)then
            local Q1 = CharDBQuery("UPDATE `eluna`.`guild_members_stats` SET totalexp = totalexp + "..Calcul.BcExp.." WHERE member_id = "..GetFunction.PlayerGUID.."")
            local Q2 = CharDBQuery("UPDATE `eluna`.`guild_base` SET current_exp = current_exp + "..Calcul.BcExp.." WHERE guild_id = "..GetFunction.PlayerGuildId.."")
            local Q0 = CharDBQuery("SELECT final_exp, current_exp FROM `eluna`.`guild_base` WHERE guild_id = "..GetFunction.PlayerGuildId.."")
            --
            local final_exp = Q0:GetUInt32(0)
            local current_exp = Q0:GetUInt32(1)
            if(current_exp >= final_exp)then
              local Q3 = CharDBQuery("UPDATE `eluna`.`guild_base` SET current_exp = 0 WHERE guild_id = "..GetFunction.PlayerGuildId.."")
              local Q4 = CharDBQuery("UPDATE `eluna`.`guild_base` SET final_exp = final_exp * 2 WHERE guild_id = "..GetFunction.PlayerGuildId.."")
              local Q5 = CharDBQuery("UPDATE `eluna`.`guild_base` SET level = level + 1 WHERE guild_id = "..GetFunction.PlayerGuildId.."")
            end
          end
        end
      end
    end
-- TLK EXP --
    for MapId,MapName in pairs(TLKMapID) do
      if(MapId == GetFunction.PlayerMap)then
        local Q0 = CharDBQuery("SELECT level FROM `eluna`.`guild_base` WHERE guild_id = "..GetFunction.PlayerGuildId.."")
        if(Q0 ~= nil)then
          local level = Q0:GetUInt32(0)
          if(Calcul.HighLevel <= 5 or Calcul.LowLevel >= -5 and level ~= 24)then
            local Q1 = CharDBQuery("UPDATE `eluna`.`guild_members_stats` SET totalexp = totalexp + "..Calcul.BcExp.." WHERE member_id = "..GetFunction.PlayerGUID.."")
            local Q2 = CharDBQuery("UPDATE `eluna`.`guild_base` SET current_exp = current_exp + "..Calcul.BcExp.." WHERE guild_id = "..GetFunction.PlayerGuildId.."")
            local Q0 = CharDBQuery("SELECT final_exp, current_exp FROM `eluna`.`guild_base` WHERE guild_id = "..GetFunction.PlayerGuildId.."")
            --
            local final_exp = Q0:GetUInt32(0)
            local current_exp = Q0:GetUInt32(1)
            if(current_exp >= final_exp)then
              local Q3 = CharDBQuery("UPDATE `eluna`.`guild_base` SET current_exp = 0 WHERE guild_id = "..GetFunction.PlayerGuildId.."")
              local Q4 = CharDBQuery("UPDATE `eluna`.`guild_base` SET final_exp = final_exp * 2 WHERE guild_id = "..GetFunction.PlayerGuildId.."")
              local Q5 = CharDBQuery("UPDATE `eluna`.`guild_base` SET level = level + 1 WHERE guild_id = "..GetFunction.PlayerGuildId.."")
            end
          end
        end
      end
    end
  end
end
RegisterPlayerEvent(PlayerEvent.KillCreature, OnGuildMemberKillCreature)
