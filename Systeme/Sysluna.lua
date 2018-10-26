--[[
          _____             _____                    _____                    _____     _____                    _____                    _____
         /\    \           |\    \                  /\    \                  /\    \   /\    \                  /\    \                  /\    \
        /::\    \          |:\____\                /::\    \                /::\____\ /::\____\                /::\____\                /::\    \
       /::::\    \         |::|   |               /::::\    \              /:::/    //:::/    /               /::::|   |               /::::\    \
      /::::::\    \        |::|   |              /::::::\    \            /:::/    //:::/    /               /:::::|   |              /::::::\    \
     /:::/\:::\    \       |::|   |             /:::/\:::\    \          /:::/    //:::/    /               /::::::|   |             /:::/\:::\    \
    /:::/__\:::\    \      |::|   |            /:::/__\:::\    \        /:::/    //:::/    /               /:::/|::|   |            /:::/__\:::\    \
    \:::\   \:::\    \     |::|   |            \:::\   \:::\    \      /:::/    //:::/    /               /:::/ |::|   |           /::::\   \:::\    \
  ___\:::\   \:::\    \    |::|___|______    ___\:::\   \:::\    \    /:::/    //:::/    /      _____    /:::/  |::|   | _____    /::::::\   \:::\    \
 /\   \:::\   \:::\    \   /::::::::\    \  /\   \:::\   \:::\    \  /:::/    //:::/____/      /\    \  /:::/   |::|   |/\    \  /:::/\:::\   \:::\    \
/::\   \:::\   \:::\____\ /::::::::::\____\/::\   \:::\   \:::\____\/:::/____/|:::|    /      /::\____\/:: /    |::|   /::\____\/:::/  \:::\   \:::\____\
\:::\   \:::\   \::/    //:::/~~~~/~~      \:::\   \:::\   \::/    /\:::\    \|:::|____\     /:::/    /\::/    /|::|  /:::/    /\::/    \:::\  /:::/    /
 \:::\   \:::\   \/____//:::/    /          \:::\   \:::\   \/____/  \:::\    \\:::\    \   /:::/    /  \/____/ |::| /:::/    /  \/____/ \:::\/:::/    /
  \:::\   \:::\    \   /:::/    /            \:::\   \:::\    \       \:::\    \\:::\    \ /:::/    /           |::|/:::/    /            \::::::/    /
   \:::\   \:::\____\ /:::/    /              \:::\   \:::\____\       \:::\    \\:::\    /:::/    /            |::::::/    /              \::::/    /
    \:::\  /:::/    / \::/    /                \:::\  /:::/    /        \:::\    \\:::\__/:::/    /             |:::::/    /               /:::/    /
     \:::\/:::/    /   \/____/                  \:::\/:::/    /          \:::\    \\::::::::/    /              |::::/    /               /:::/    /
      \::::::/    /                              \::::::/    /            \:::\    \\::::::/    /               /:::/    /               /:::/    /
       \::::/    /                                \::::/    /              \:::\____\\::::/    /               /:::/    /               /:::/    /
        \::/    /                                  \::/    /                \::/    / \::/____/                \::/    /                \::/    /
         \/____/                                    \/____/                  \/____/   ~~                       \/____/                  \/____/

--]]

--[[ FOR USING SYSLUNA ]]
-- require ('Sysluna')
-- ^                 ^ --> This is MANDATORY, you must put this at the BEGINNING of each of your lua files

--
--[[ GossipSetText ]]--
local SMSG_NPC_TEXT_UPDATE = 384
local MAX_GOSSIP_TEXT_OPTIONS = 8
function Player:GossipSetText(text)
    data = CreatePacket(SMSG_NPC_TEXT_UPDATE, 100);
    data:WriteULong(0x7FFFFFFF)
    for i = 1, MAX_GOSSIP_TEXT_OPTIONS do
        data:WriteFloat(0)
        data:WriteString(text)
        data:WriteString(text)
        data:WriteULong(0)
        data:WriteULong(0)
        data:WriteULong(0)
        data:WriteULong(0)
        data:WriteULong(0)
        data:WriteULong(0)
        data:WriteULong(0)
    end
    self:SendPacket(data)
end
--[[  function OnGossipHello (.., .., .., ..)
        player:GossipSetText("Ok this Method is fuck*ng pretty good")
        player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
      end  ]]--

--[[ REGISTER EVENT ]]--

PlayerEvent = {}
  PlayerEvent.CharacterCreate = 1             --            (event, player)
  PlayerEvent.CharacterDelete = 2             --            (event, guid)
  PlayerEvent.Login = 3                       --            (event, player)
  PlayerEvent.Logout = 4                      --            (event, player)
  PlayerEvent.SpellCast = 5                   --            (event, player, spell, skipCheck)
  PlayerEvent.KillPlayer = 6                  --            (event, killer, killed)
  PlayerEvent.KillCreature = 7                --            (event, killer, killed)
  PlayerEvent.KilledByCreature = 8            --            (event, killer, killed)
  PlayerEvent.DuelRequest = 9                 --            (event, target, challenger)
  PlayerEvent.DuelStart = 10                  --            (event, player1, player2)
  PlayerEvent.DuelEnd = 11                    --            (event, winner, loser, type)
  PlayerEvent.GiveExp = 12                    --            (event, player, amount, victim)                        -- Can return new XP amount
  PlayerEvent.LevelChange = 13                --            (event, player, oldLevel)
  PlayerEvent.MoneyChange = 14                --            (event, player, amount)                                -- Can return new money amount
  PlayerEvent.ReputationChange = 15           --            (event, player, factionId, standing, incremental)      -- Can return new standing
  PlayerEvent.TalentsChange = 16              --            (event, player, points)
  PlayerEvent.TalentsReset = 17               --            (event, player, noCost)
  PlayerEvent.Chat = 18                       --            (event, player, msg, Type, lang)                       -- Can return false, newMessage
  PlayerEvent.Whisper = 19                    --            (event, player, msg, Type, lang, receiver)             -- Can return false, newMessage
  PlayerEvent.GroupChat = 20                  --            (event, player, msg, Type, lang, group)                -- Can return false, newMessage
  PlayerEvent.GuildChat = 21                  --            (event, player, msg, Type, lang, guild)                -- Can return false, newMessage
  PlayerEvent.ChannelChat = 22                --            (event, player, msg, Type, lang, channel)              -- Can return false, newMessage
  PlayerEvent.Emote = 23                      --            (event, player, emote)                                 -- Not triggered on any known emote
  PlayerEvent.TextEmote = 24                  --            (event, player, textEmote, emoteNum, guid)
  PlayerEvent.Save = 25                       --            (event, player)
  PlayerEvent.BindToInstance = 26             --            (event, player, difficulty, mapid, permanent)
  PlayerEvent.UpdateZone = 27                 --            (event, player, newZone, newArea)
  PlayerEvent.MapChange = 28                  --            (event, player)
  PlayerEvent.Equip = 29                      --            (event, player, item, bag, slot)
  PlayerEvent.FirstLogin = 30                 --            (event, player)
  PlayerEvent.CanUseItem = 31                 --            (event, player, itemEntry)                             -- Can return InventoryResult enum value
  PlayerEvent.LootItem = 32                   --            (event, player, item, count)
  PlayerEvent.EnterCombat = 33                --            (event, player, enemy)
  PlayerEvent.LeaveCombat = 34                --            (event, player)
  PlayerEvent.Repop = 35                      --            (event, player)
  PlayerEvent.Resurrect = 36                  --            (event, player)
  PlayerEvent.LootMoney = 37                  --            (event, player, amount)
  PlayerEvent.QuestAbandon = 38               --            (event, player, questId)
  PlayerEvent.LearnTalents = 39               --            (event, player, talentId, talentRank, spellid)
  PlayerEvent.Command = 42                    --            (event, player, command)                               -- player is nil if command used from console. Can return false

CreatureEvent = {}
  CreatureEvent.EnterCombat = 1               --            (event, creature, target)                              -- Can return true to stop normal action
  CreatureEvent.LeaveCombat = 2               --            (event, creature)                                      -- Can return true to stop normal action
  CreatureEvent.TargetDied = 3                --            (event, creature, victim)                              -- Can return true to stop normal action
  CreatureEvent.Died = 4                      --            (event, creature, killer)                              -- Can return true to stop normal action
  CreatureEvent.Spawn = 5                     --            (event, creature)                                      -- Can return true to stop normal action
  CreatureEvent.ReachWP = 6                   --            (event, creature, type, id)                            -- Can return true to stop normal action
  CreatureEvent.AIUpdate = 7                  --            (event, creature, diff)                                -- Can return true to stop normal action
  CreatureEvent.ReceiveEmote = 8              --            (event, creature, player, emoteid)                     -- Can return true to stop normal action
  CreatureEvent.DamageTaken = 9               --            (event, creature, attacker, damage)                    -- Can return new damage
  CreatureEvent.PreCombat = 10                --            (event, creature, target)                              -- Can return true to stop normal action
  CreatureEvent.OwnerAttacked = 12            --            (event, creature, target)                              -- Can return true to stop normal action          (Not on mangos)
  CreatureEvent.OwnerAttackedAt = 13          --            (event, creature, attacker)                            -- Can return true to stop normal action          (Not on mangos)
  CreatureEvent.HitBySpell = 14               --            (event, creature, caster, spellid)                     -- Can return true to stop normal action
  CreatureEvent.SpellHitTarget = 15           --            (event, creature, target, spellid)                     -- Can return true to stop normal action
  CreatureEvent.JustSummonedCreature = 19     --            (event, creature, summon)                              -- Can return true to stop normal action
  CreatureEvent.SummonedCreatureDespawn = 20  --            (event, creature, summon)                              -- Can return true to stop normal action
  CreatureEvent.SummonedCreatureDied = 21     --            (event, creature, summon, killer)                      -- Can return true to stop normal action          (Not on mangos)
  CreatureEvent.Summoned = 22                 --            (event, creature, summoner)                            -- Can return true to stop normal action
  CreatureEvent.Reset = 23                    --            (event, creature)
  CreatureEvent.ReachHome = 24                --            (event, creature)                                      -- Can return true to stop normal action
  CreatureEvent.CorpseRemoved = 26            --            (event, creature, respawndelay)                        -- Can return true, newRespawnDelay
  CreatureEvent.MoveInLos = 27                --            (event, creature, unit)                                -- Can return true to stop normal action. Does not actually check LOS, just uses the sight range
  CreatureEvent.DummyEffect = 30              --            (event, caster, spellid, effindex, creature)           -- Can return true
  CreatureEvent.QuestAccept = 31              --            (event, player, creature, quest)                       -- Can return true
  CreatureEvent.QuestReward  = 34             --            (event, player, creature, quest, opt)                  -- Can return true
  CreatureEvent.DialogStatus = 35             --            (event, player, creature)
  CreatureEvent.Add  = 36                     --            (event, creature)
  CreatureEvent.Remove = 37                   --            (event, creature)

PlayerGossipEvent = {}
  PlayerGossipEvent.GossipHello = 1           --            (event, player, object)                                -- Object is the Creature/GameObject/Item. Can return false to do default action. For item gossip can return false to stop spell casting.
  PlayerGossipEvent.GossipSelect = 2          --            (event, player, object, sender, intid, code, menu_id)  -- Object is the Creature/GameObject/Item/Player, menu_id is only for player gossip. Can return false to do default action.

CreatureGossipEvent = {}
  CreatureGossipEvent.GossipHello = 1         --            (event, player, object)                                -- Object is the Creature/GameObject/Item. Can return false to do default action. For item gossip can return false to stop spell casting.
  CreatureGossipEvent.GossipSelect = 2        --            (event, player, object, sender, intid, code, menu_id)  -- Object is the Creature/GameObject/Item/Player, menu_id is only for player gossip. Can return false to do default action.

GameObjectEvent = {}
  GameObjectEvent.AIUpdate = 1                --            (event, go)
  GameObjectEvent.Spawn = 2                   --            (event, caster, spellid, effindex, go)                -- Can return true
  GameObjectEvent.DummyEffect = 3             --            (event, player, go, quest)                            -- Can return true
  GameObjectEvent.QuestAccept = 4             --            (event, player, go, quest, opt)                       -- Can return true
  GameObjectEvent.QuestReward = 5             --            (event, player, go)
  GameObjectEvent.DialogStatus = 6            --            (event, go, player)
  GameObjectEvent.Destroyed = 7               --            (event, go, player)
  GameObjectEvent.Damaged = 8                 --            (event, go, state)
  GameObjectEvent.LootStateChange = 9         --            (event, go, state)
  GameObjectEvent.StateChanged = 10           --            (event, go, state)
  GameObjectEvent.Add = 12                    --            (event, gameobject)
  GameObjectEvent.Remove = 13                 --            (event, gameobject)
  GameObjectEvent.Use = 14                    --            (event, go, player)

ItemGossipEvent = {}
  ItemGossipEvent.GossipHello = 1             --            (event, player, object)                                -- Object is the Creature/GameObject/Item. Can return false to do default action. For item gossip can return false to stop spell casting.
  ItemGossipEvent.GossipSelect = 2            --            (event, player, object, sender, intid, code, menu_id)  -- Object is the Creature/GameObject/Item/Player, menu_id is only for player gossip. Can return false to do default action.

BGEvent = {}
  BGEvent.Start = 1                      --            (event, bg, bgId, instanceId)                          -- Needs to be added to TC
  BGEvent.End = 2                        --            (event, bg, bgId, instanceId, winner)                  -- Needs to be added to TC
  BGEvent.Create = 3                     --            (event, bg, bgId, instanceId)                          -- Needs to be added to TC
  OnGbPreDestroy = 4                     --            (event, bg, bgId, instanceId)                          -- Needs to be added to TC

MapEvent = {}
  MapEvent.Initilize = 1                 --            (event, instance_data, map)
  MapEvent.Load = 2                      --            (event, instance_data, map)
  MapEvent.Update = 3                    --            (event, instance_data, map, diff)
  MapEvent.PlayerEnter = 4               --            (event, instance_data, map, players)
  MapEvent.CreatureCreate = 5            --            (event, instance_data, map, creature)
  MapEvent.GameObjectCreate = 6          --            (event, instance_data, map, go)
  MapEvent.CheckEncounterInProgress = 7  --            (event, instance_data, map)

ItemEvent = {}
  ItemEvent.DummyEffect = 1                   --            (event, caster, spellid, effindex, item)               -- Can return true
  ItemEvent.Use = 2                           --            (event, player, item, target)                          -- Can return false to stop the spell casting
  ItemEvent.QuestAccept = 3                   --            (event, player, item, quest)                           -- Can return true
  ItemEvent.Expire = 4                        --            (event, player, itemid)                                -- Can return true
  ItemEvent.Remove = 5                        --            (event, player, item)                                  -- Can return true

GroupEvent = {}
  GroupEvent.MemberAdd = 1                    --            (event, group, guid)
  GroupEvent.MemberInvite = 2                 --            (event, group, guid)
  GroupEvent.MemberRemove = 3                 --            (event, group, guid, method, kicker, reason)
  GroupEvent.LeaderChange = 4                 --            (event, group, newLeaderGuid, oldLeaderGuid)
  GroupEvent.Disband = 5                      --            (event, group)
  GroupEvent.Create = 6                       --            (event, group, leaderGuid, groupType)

GuildEvent = {}
  GuildEvent.AddMember = 1                    --            (event, guild, player, rank)
  GuildEvent.RemoveMember = 2                 --            (event, guild, player, isDisbanding)
  GuildEvent.MotdChange = 3                   --            (event, guild, newMotd)
  GuildEvent.InfoChange = 4                   --            (event, guild, newInfo)
  GuildEvent.Create = 5                       --            (event, guild, leader, name)
  GuildEvent.Disband = 6                      --            (event, guild)
  GuildEvent.MoneyWithdraw = 7                --            (event, guild, player, amount, isRepair)              -- Can return new money amount
  GuildEvent.MoneyDeposit = 8                 --            (event, guild, player, amount)                        -- Can return new money amount
  GuildEvent.ItemMove = 9                     --            (event, guild, player, item, isSrcBank, srcContainer, srcSlotId, isDestBank, destContainer, destSlotId)                        -- Todo
  GuildEvent.Event = 10                       --            (event, guild, eventType, plrGUIDLow1, plrGUIDLow2, newRank)                        -- Todo
  GuildEvent.BankEvent = 11                   --            (event, guild, eventType, tabId, playerGUIDLow, itemOrMoney, itemStackCount, destTabId)

PacketEvent = {}
  PacketEvent.Receive = 5                     --            (event, packet, player)                               -- Player only if accessible. Can return false, newPacket
  PacketEvent.ReceiveUnknow = 6               --                                                                  -- Not Implemented
  PacketEvent.Send = 7                        --            (event, packet, player)                               -- Player only if accessible. Can return false, newPacket

ServerEvent = {}
  ServerEvent.NetworkStart = 1                --                                                                  -- Not Implemented
  ServerEvent.NetworkStop = 2                 --                                                                  -- Not Implemented
  ServerEvent.SocketOpen = 3                  --                                                                  -- Not Implemented
  ServerEvent.SocketClose = 4                 --                                                                  -- Not Implemented
  ServerEvent.PacketReceive = 5               --            (event, packet, player)                               -- Player only if accessible. Can return false, newPacket
  ServerEvent.PacketReceiveUnknow = 6         --                                                                  -- Not Implemented
  ServerEvent.PacketSend = 7                  --            (event, packet, player)                               -- Player only if accessible. Can return false, newPacket

WorldEvent = {}
  WorldEvent.OpenStateChange = 8              --            (event, open)                                         -- Needs core support on Mangos
  WorldEvent.ConfigLoad = 9                   --            (event, reload)
  WorldEvent.ShutdownInit = 11                --            (event, code, mask)
  WorldEvent.ShutdownCancel = 12              --            (event)
  WorldEvent.Update = 13                      --            (event, diff)
  WorldEvent.Startup = 14                     --            (event)
  WorldEvent.OnShutdown = 15                  --            (event)
  WorldEvent.DeleteCreature = 31              --            (event, creature)
  WorldEvent.DeleteGameobject = 32            --            (event, gameobject)
  WorldEvent.LuaStateClose = 16               --            (event)                                               -- triggers just before shutting down eluna (on shutdown and restart)
  WorldEvent.MapCreate = 17                   --            (event, map)
  WorldEvent.MapDestroy = 18                  --            (event, map)
  WorldEvent.MapGridLoad = 19                 --                                                                  -- Not Implemented
  WorldEvent.MapGridUnload = 20               --                                                                  -- Not Implemented
  WorldEvent.MapPlayerEnter = 21              --            (event, map, player)
  WorldEvent.MapPlayerLeave = 22              --            (event, map, player)
  WorldEvent.MapUpdate = 23                   --            (event, map, diff)
  WorldEvent.Trigger = 24                     --            (event, player, triggerId)                            -- Can return true
  WorldEvent.WeatherChange = 25               --            (event, zoneId, state, grade)
  --[[ Todo change this ]]--
  WorldEvent.AuctionAdd = 26                  --            (event, auctionId, owner, item, expireTime, buyout, startBid, currentBid, bidderGUIDLow)
  WorldEvent.AuctionRemove = 27               --            (event, auctionId, owner, item, expireTime, buyout, startBid, currentBid, bidderGUIDLow)
  WorldEvent.AuctionSuccessful = 28           --            (event, auctionId, owner, item, expireTime, buyout, startBid, currentBid, bidderGUIDLow)
  WorldEvent.AuctionExpire = 29               --            (event, auctionId, owner, item, expireTime, buyout, startBid, currentBid, bidderGUIDLow)
  --[[ ^ Todo change this ^ ]]--
  WorldEvent.AddonsMessage = 30               --            (event, sender, type, prefix, msg, target)            -- target can be nil/whisper_target/guild/group/channel. Can return false
  WorldEvent.ElunaStateOpen = 33              --            (event)                                               -- triggers after all scripts are loaded
  WorldEvent.GameEventStart = 34              --            (event, gameeventid)
  WorldEvent.GameEventStop = 35               --            (event, gameeventid)

InstanceEvent = {}
  InstanceEvent.Initilize = 1                 --            (event, instance_data, map)
  InstanceEvent.Load = 2                      --            (event, instance_data, map)
  InstanceEvent.Update = 3                    --            (event, instance_data, map, diff)
  InstanceEvent.PlayerEnter = 4               --            (event, instance_data, map, players)
  InstanceEvent.CreatureCreate = 5            --            (event, instance_data, map, creature)
  InstanceEvent.GameObjectCreate = 6          --            (event, instance_data, map, go)
  InstanceEvent.CheckEncounterInProgress = 7  --            (event, instance_data, map)

GameObjectGossipEvent = {}
  GameObjectGossipEvent.GossipHello = 1       --            (event, player, object)                                -- Object is the Creature/GameObject/Item. Can return false to do default action. For item gossip can return false to stop spell casting.
  GameObjectGossipEvent.mGossipSelect = 2     --            (event, player, object, sender, intid, code, menu_id)  -- Object is the Creature/GameObject/Item/Player, menu_id is only for player gossip. Can return false to do default action.

UniqueCreatureEvent = {}
  UniqueCreatureEvent.EnterCombat = 1               --            (event, creature, target)                              -- Can return true to stop normal action
  UniqueCreatureEvent.LeaveCombat = 2               --            (event, creature)                                      -- Can return true to stop normal action
  UniqueCreatureEvent.TargetDied = 3                --            (event, creature, victim)                              -- Can return true to stop normal action
  UniqueCreatureEvent.Died = 4                      --            (event, creature, killer)                              -- Can return true to stop normal action
  UniqueCreatureEvent.Spawn = 5                     --            (event, creature)                                      -- Can return true to stop normal action
  UniqueCreatureEvent.ReachWP = 6                   --            (event, creature, type, id)                            -- Can return true to stop normal action
  UniqueCreatureEvent.AIUpdate = 7                  --            (event, creature, diff)                                -- Can return true to stop normal action
  UniqueCreatureEvent.ReceiveEmote = 8              --            (event, creature, player, emoteid)                     -- Can return true to stop normal action
  UniqueCreatureEvent.DamageTaken = 9               --            (event, creature, attacker, damage)                    -- Can return new damage
  UniqueCreatureEvent.PreCombat = 10                --            (event, creature, target)                              -- Can return true to stop normal action
  UniqueCreatureEvent.OwnerAttacked = 12            --            (event, creature, target)                              -- Can return true to stop normal action          (Not on mangos)
  UniqueCreatureEvent.OwnerAttackedAt = 13          --            (event, creature, attacker)                            -- Can return true to stop normal action          (Not on mangos)
  UniqueCreatureEvent.HitBySpell = 14               --            (event, creature, caster, spellid)                     -- Can return true to stop normal action
  UniqueCreatureEvent.SpellHitTarget = 15           --            (event, creature, target, spellid)                     -- Can return true to stop normal action
  UniqueCreatureEvent.JustSummonedCreature = 19     --            (event, creature, summon)                              -- Can return true to stop normal action
  UniqueCreatureEvent.SummonedCreatureDespawn = 20  --            (event, creature, summon)                              -- Can return true to stop normal action
  UniqueCreatureEvent.SummonedCreatureDied = 21     --            (event, creature, summon, killer)                      -- Can return true to stop normal action          (Not on mangos)
  UniqueCreatureEvent.Summoned = 22                 --            (event, creature, summoner)                            -- Can return true to stop normal action
  UniqueCreatureEvent.Reset = 23                    --            (event, creature)
  UniqueCreatureEvent.ReachHome = 24                --            (event, creature)                                      -- Can return true to stop normal action
  UniqueCreatureEvent.CorpseRemoved = 26            --            (event, creature, respawndelay)                        -- Can return true, newRespawnDelay
  UniqueCreatureEvent.MoveInLos = 27                --            (event, creature, unit)                                -- Can return true to stop normal action. Does not actually check LOS, just uses the sight range
  UniqueCreatureEvent.DummyEffect = 30              --            (event, caster, spellid, effindex, creature)           -- Can return true
  UniqueCreatureEvent.QuestAccept = 31              --            (event, player, creature, quest)                       -- Can return true
  UniqueCreatureEvent.QuestReward  = 34             --            (event, player, creature, quest, opt)                  -- Can return true
  UniqueCreatureEvent.DialogStatus = 35             --            (event, player, creature)
  UniqueCreatureEvent.Add  = 36                     --            (event, creature)
  UniqueCreatureEvent.Remove = 37                   --            (event, creature)

--[[ TABLE // ARRAY // TABLEAU ]]-- Pour plus d'information sur les tableaux consultés ce lien : https://wow-elite.fr
  --[[ FRENCH  ]]--
    -- for RaceId,RaceName in pairs(FrMaleRaceName) do
      FrMaleRaceName = {[1]="Humain", [2]="Orc", [3]="Nain", [4]="Elfe de la nuit", [5]="Mort vivant", [6]="Tauren", [7]="Gnome", [8]="Troll", [10]="Elfe de sang", [11]="Draenei"};
    -- for RaceId,RaceName in pairs(FrFemaleName) do
      FrFemaleName = {[1]="Humaine", [2]="Orc", [3]="Naine", [4]="Elfe de la nuit", [5]="Mort vivant", [6]="Tauren", [7]="Gnome", [8]="Troll", [10]="Elfe de sang", [11]="Draenei"};
    -- for ClassId,ClassName in pairs(FrMaleClassName) do
      FrMaleClassName = {[1]="Guerrier", [2]="Paladin", [3]="Chasseur", [4]="Voleur", [5]="Prêtre", [6]="Chevalier de la mort", [7]="Chaman", [8]="Mage", [9]="Démoniste", [11]="Druide"};
    -- for ClassId,ClassName in pairs(FrFemaleClassName) do
      FrFemaleClassName = {[1]="Guerrière", [2]="Paladin", [3]="Chasseuse", [4]="Voleuse", [5]="Prêtresse", [6]="Chevalier de la mort", [7]="Chaman", [8]="Mage", [9]="Démoniste", [11]="Druidesse"};

    -- for MapId,MapName in pairs(ClassicMapID) do
      ClassicMapID = {[0]="Royaume de l'Est", [1]="Kalimdor", [48]="Profondeurs de Brassenoire", [230]="Profondeurs de Rochenoire", [229]="Pic Rochenoire", [429]="Hache-Tripes", [90]="Gnomeregan", [349]="Maraudon", [389]="Gouffre de Ragefeu", [129]="Souilles de Tranchebauge", [47]="Kraal de Tranchebauge", [1004]="Monastère Écarlate", [1007]="Scholomance", [33]="Donjon d'Ombrecroc", [329]="Stratholme", [36]="Les Mortemines", [34]="La Prison", [109]="Le temple d'Atal'Hakkar", [70]="Uldaman", [43]="Cavernes des Lamentations ", [209]="Zul'Farrak"};
    -- for MapId,MapName in pairs(BCMapID) do
      BCMapID = {[558]="Cryptes Auchenaï", [543]="Remparts des Flammes infernales", [585]="Terrasse des Magistères", [557]="Tombes-mana", [560]="Contreforts de Hautebrande d'antan", [556]="Les salles des Sethekk", [555]="Labyrinthe des Ombres", [552]="L'Arcatraz", [269]="Le Noir marécage", [542]="La Fournaise du sang", [553]="La Botanica", [554]="Le Méchanar", [540]="Les salles Brisées", [547]="Les enclos aux esclaves", [545]="Le caveau de la Vapeur", [546]="La Basse-tourbière", [564]="Temple noir", [565]="Repaire de Gruul", [534]="Sommet d'Hyjal", [532]="Karazhan", [544]="Le repaire de Magtheridon", [548]="Caverne du sanctuaire du Serpent", [580]="Plateau du Puits de soleil", [550]="Donjon de la Tempête", [530]="Outreterre"}
    -- for MapId,MapName in pairs(TLKMapID) do
      TLKMapID = {[571]="Norfendre", [619]="Ahn'kahet : l'Ancien royaume", [601]="Azjol-Nerub", [600]="Donjon de Drak'Tharon", [604]="Gundrak", [602]="Les salles de Foudre", [668]="Salles des Reflets", [599]="Les salles de Pierre", [658]="Fosse de Saron", [595]="L'Épuration de Stratholme", [632]="La Forge des Âmes", [576]="Le Nexus", [578]="L'Oculus", [608]="Fort Pourpre", [650]="L'épreuve du champion", [574]="Donjon d'Utgarde", [575]="Cime d'Utgarde", [631]="Citadelle de la Couronne de glace", [533]="Naxxramas", [249]="Repaire d'Onyxia", [616]="L'Œil de l'éternité", [615]="Le sanctum Obsidien", [724]="Le sanctum Rubis", [649]="L'épreuve du croisé", [603]="Ulduar", [624]="Caveau d'Archavon"}

  --[[ ENGLISH ]]--
    -- for RaceId,RaceName in pairs(EnRaceName) do
      EnRaceName = {[1]="Human", [2]="Orc", [3]="Dwarf", [4]="Night Elf", [5]="Undead", [6]="Tauren", [7]="Gnome", [8]="Troll", [10]="Blood Elf", [11]="Draenei"};
    -- for ClassId,RaceName in pairs(EnClassName) do
      EnClassName = {[1]="Warrior", [2]="Paladin", [3]="Hunter", [4]="Rogue", [5]="Priest", [6]="Death Knight", [7]="Shaman", [8]="Mage", [9]="Warlock", [11]="Druid"};
