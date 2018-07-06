--주문경보 알림
local alert = CreateFrame("Frame","alert")
alert:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
alert:SetScript("OnEvent", function(...)
local _,combatEvent,hideCaster,sourceGUID,sourceName,sourceFlags,sourceRaidFlags,destGUID,destName,destFlags, destRaidFlags,spellID,spellName,_,param1,_,_,param4 = CombatLogGetCurrentEventInfo()
if sourceGUID == UnitGUID("player") and combatEvent=="SPELL_INTERRUPT" then
	print("\124cffff0000차단\124r : "..destName.."의 "..GetSpellLink(param1)) -- 차단
elseif sourceGUID == UnitGUID("player") and combatEvent=="SPELL_DISPEL" and (bit.band(destFlags,COMBATLOG_OBJECT_REACTION_FRIENDLY)==COMBATLOG_OBJECT_REACTION_FRIENDLY) then
	print("\124cff00ff00해제\124r : "..destName.."의 "..GetSpellLink(param1)) -- 해제(아군)
elseif sourceGUID == UnitGUID("player") and combatEvent=="SPELL_DISPEL" and (bit.band(destFlags,COMBATLOG_OBJECT_REACTION_HOSTILE)==COMBATLOG_OBJECT_REACTION_HOSTILE) then 
	print("\124cffff0000해제\124r : "..destName.."의 "..GetSpellLink(param1)) -- 해제(적)
elseif sourceGUID == UnitGUID("player") and combatEvent=="SPELL_STOLEN" then
	print("\124cffff0000훔치기\124r : "..destName.."의 "..GetSpellLink(param1)) -- 훔치기
elseif destGUID == UnitGUID("player") and combatEvent=="SPELL_MISSED" and param1=="REFLECT" then
	print("\124cffff0000반사\124r : "..sourceName.."의 "..GetSpellLink(spellID)) -- 반사
end
end)

--미니탭 테러 검거
local p = CreateFrame("FRAME","p")
p:RegisterEvent("MINIMAP_PING")
p:SetScript("OnEvent",function(s,e,u)
	local pn=UnitName(u)
	local _,c=UnitClass(u)
	local color=RAID_CLASS_COLORS[c]
	if select(8,GetInstanceInfo())==1676 and pn~=UnitName("player") then 
		print("미니맵 징표 : \124c"..color.colorStr..pn.."\124r - "..tonumber(date("%H"))..":"..tonumber(date("%M"))..":"..tonumber(date("%S")))
	end 
end)
end)
