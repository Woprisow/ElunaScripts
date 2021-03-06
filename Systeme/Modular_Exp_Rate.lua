require('Sysluna')

--[[ GO Systeme/SQL_BASE AND EXECUTE MODULAR_EXP_RATE.SQL ON YOU ELUNA DB]]

local NPC = 197
local MenuId = 123

local ElunaDB = 'Eluna'

local function OnGossipHello(event, player, object)
  local Q0 = CharDBQuery("SELECT exp FROM `"..ElunaDB.."`.`characters_info` WHERE GUID = "..player:GetGUIDLow().."")
  if(Q0 ~= nil)then
    local EXP = Q0:GetUInt32(0)
  end
    --
    player:GossipClearMenu()
      player:GossipMenuAddItem(0, "Augmenter ma rate à 1", 1, 1)
      player:GossipMenuAddItem(0, "Augmenter ma rate à 2", 1, 2)
      player:GossipMenuAddItem(0, "Augmenter ma rate à 3", 1, 3)
    player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
end
RegisterCreatureGossipEvent(NPC, CreatureGossipEvent.GossipHello, OnGossipHello)

local function OnGossipSelect(event, player, object, sender, intid, code, menuid)
  if(intid == 1)then
    local Q0 = CharDBQuery("UPDATE `"..ElunaDB.."`.`characters_info` SET exp = 1 WHERE GUID = "..player:GetGUIDLow().."")
  elseif(intid == 2)then
    local Q1 = CharDBQuery("UPDATE `"..ElunaDB.."`.`characters_info` SET exp = 2 WHERE GUID = "..player:GetGUIDLow().."")
  elseif(intid == 3)then
    local Q2 = CharDBQuery("UPDATE `"..ElunaDB.."`.`characters_info` SET exp = 3 WHERE GUID = "..player:GetGUIDLow().."")
  end
end
RegisterCreatureGossipEvent(NPC, CreatureGossipEvent.GossipSelect, OnGossipSelect)

local function PlayerKillCreature(event, player, creature)
  GetFunction = {}
    GetFunction.PlayerGUID = player:GetGUIDLow()
    GetFunction.PlayerGuildId = player:GetGuildId()
    GetFunction.PlayerLevel = player:GetLevel()
    GetFunction.CreatureLevel = creature:GetLevel()
    GetFunction.PlayerMap = player:GetMapId()

  Calcul = {}
    Calcul.HighLevel = (GetFunction.PlayerLevel - GetFunction.CreatureLevel)
    Calcul.LowLevel = (GetFunction.CreatureLevel - GetFunction.PlayerLevel)
    --
    Calcul.ClassicExp = ((GetFunction.PlayerLevel * 5) + 45)
    Calcul.BcExp = ((GetFunction.PlayerLevel * 5) + 235)
    Calcul.NorthendExp = ((GetFunction.PlayerLevel * 5) + 580)

  for MapId,MapName in pairs(ClassicMapID) do
    if(MapId == GetFunction.PlayerMap)then
      local Q0 = CharDBQuery("SELECT exp FROM `"..ElunaDB.."`.`characters_info` WHERE GUID = "..player:GetGUIDLow().."")
      if(Q0 ~= nil)then
        local EXP = Q0:GetUInt32(0)
        if(Calcul.HighLevel <= 5 or Calcul.LowLevel >= -5)then
          if(EXP == 2)then
            player:GiveXP(Calcul.ClassicExp*1)
          elseif(EXP == 3)then
            player:GiveXP(Calcul.ClassicExp*2)
          end
        end
      end
    end
  end
  --
  for MapId,MapName in pairs(BCMapID) do
    if(MapId == GetFunction.PlayerMap)then
      local Q0 = CharDBQuery("SELECT exp FROM `"..ElunaDB.."`.`characters_info` WHERE GUID = "..player:GetGUIDLow().."")
      if(Q0 ~= nil)then
        local EXP = Q0:GetUInt32(0)
        if(Calcul.HighLevel <= 5 or Calcul.LowLevel >= -5)then
          if(EXP == 2)then
            player:GiveXP(Calcul.BcExp*1)
          elseif(EXP == 3)then
            player:GiveXP(Calcul.BcExp*2)
          end
        end
      end
    end
  end
  --
  for MapId,MapName in pairs(TLKMapID) do
    if(MapId == GetFunction.PlayerMap)then
      local Q0 = CharDBQuery("SELECT exp FROM `"..ElunaDB.."`.`characters_info` WHERE GUID = "..player:GetGUIDLow().."")
      if(Q0 ~= nil)then
        local EXP = Q0:GetUInt32(0)
        if(Calcul.HighLevel <= 5 or Calcul.LowLevel >= -5)then
          if(EXP == 2)then
            player:GiveXP(Calcul.NorthendExp*1)
          elseif(EXP == 3)then
            player:GiveXP(Calcul.NorthendExp*2)
          end
        end
      end
    end
  end
end
RegisterPlayerEvent(PlayerEvent.KillCreature, PlayerKillCreature)

local function OnPlayerCreateCharacter(event, player)
  local Q0 = CharDBQuery("INSERT INTO `"..ElunaDB.."`.`characters_info` (GUID) VALUES ("..player:GetGUIDLow()..")")
end
RegisterPlayerEvent(PlayerEvent.CharacterCreate, OnPlayerCreateCharacter)
