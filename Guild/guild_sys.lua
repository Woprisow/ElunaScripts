require('sysluna')

local function OnGuildCreate (event, guild, player)
  CharDBQuery("INSERT INTO `eluna`.`guild_base` VALUES ("..guild:GetId()..", "..player:GetGUIDLow()..", 1, 0, 0, 16570000)")
end
RegisterGuildEvent(GuildEvent.Create, OnGuildCreate)

local function OnGuildMemberAdd (event, guild, player, _)
  CharDBQuery("INSERT INTO `eluna`.`guild_members_stats` VALUES ("..guild:GetId()..", "..player:GetGUIDLow()..", 0, 0)")
end
RegisterGuildEvent(GuildEvent.AddMember, OnGuildMemberAdd)

local function OnGuildMemberRemove (event, guild, player, _)
  CharDBQuery("DELETE FROM `eluna`.`guild_members_stats` WHERE member_id = "..player:GetGUIDLow().."")
end
RegisterGuildEvent(GuildEvent.RemoveMember, OnGuildMemberRemove)

local function OnGuildDisband (event, guild)
  if(guild:GetMemberCount() > 1)then
    CharDBQuery("DELETE FROM `eluna`.`guild_members_stats` WHERE member_id = "..player:GetGUIDLow().."")
  end
  CharDBQuery("DELETE FROM `eluna`.`guild_base` WHERE guild_id = "..guild:GetId().."")
end
RegisterGuildEvent(GuildEvent.Disband, OnGuildDisband)
