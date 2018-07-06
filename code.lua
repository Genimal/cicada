-- SetCVar("", )
SetCVar("InteractOnLeftClick",0)
SetCVar("deselectOnClick", 1)
SetCVar("rawMouseEnable", 1);
SetCVar("autoLootDefault", 1)
SetCVar("mapFade", 0)

SetCVar("statusText", 1)
SetCVar("showQuestTrackingTooltips", 1)
SetCVar("UnitNamePlayerPVPTitle", 1)

SetCVar("nameplateLargeTopInset", -1)
SetCVar("nameplateOtherTopInset", -1)
SetCVar("nameplateLargeBottomInset", -1)
SetCVar("nameplateOtherBottomInset", -1) -- 이름표 거리고정
SetCVar("nameplateMaxDistance", 60)

SetCVar("ShowClassColorInNameplate", 1)
SetCVar("ShowClassColorInFriendlyNameplate", 1)
SetCVar("nameplateShowDebuffsOnFriendly", 1)

SetCVar("nameplateShowSelf", 0)
SetCVar("nameplateShowAll", 1)
SetCVar("nameplatePersonalShowAlways", 1)

-- SetCVar("nameplateSelfScale", 1)
-- SetCVar("nameplateSelfAlpha", 0.75)
SetCVar("nameplateOccludedAlphaMult", 0.6) -- 가린 이름표 투명도
SetCVar("TargetNearestUseNew", 0) -- 탭 타게팅

SetCVar("noBuffDebuffFilterOnTarget", 1)

SetCVar("showArenaEnemyFrames", 1)

SetCVar("ffxDeath", 0)
SetCVar("ffxGlow", 0)
SetCVar("screenshotQuality", 8) --default 3, 1 to 10

--WorldMap
--SetCVar("lockedWorldMap", 0)
--WorldMapFrame:HookScript("OnShow", function(self)self:ClearAllPoints();self:SetPoint("CENTER",UIParent,0,0);end)

--LossOfControlFrame
local LOC=LossOfControlFrame;
LOC.RedLineBottom:Hide();
LOC.blackBg:Hide();
LOC.RedLineTop:Hide();
LOC:SetScale(0.7);
select(2,LossOfControlFrame:GetChildren()):SetAlpha(0)

--이름표 색상 설정
hooksecurefunc("CompactUnitFrame_UpdateName", function(nf) 
if nf:IsForbidden() or not nf:GetName():find("NamePlate%d") then return end;
if UnitIsFriend("player", nf.unit) and not UnitIsUnit(nf.unit, "player")then 
	if UnitIsPlayer(nf.unit) then 
		nf.healthBar:SetStatusBarColor(0,0,1) 
	else 
		nf.healthBar:SetStatusBarColor(0,1,0) 
	end 
end 
end)

--캐릭터창 능력치 표시 추가
PAPERDOLL_STATCATEGORIES[1].stats[8] = { stat = "ATTACK_DAMAGE" };
PAPERDOLL_STATCATEGORIES[1].stats[7] = { stat = "MOVESPEED" };

-- 시야 넓히기 /console cameraDistanceMaxZoomFactor 2.6
local z = CreateFrame("FRAME")
z:RegisterEvent("PLAYER_ENTERING_WORLD")
z:SetScript("OnEvent", function()
SetCVar("cameraDistanceMaxZoomFactor", 2.6)
if not AreAccountAchievementsHidden() then ShowAccountAchievements(0) end
z:UnregisterEvent("PLAYER_ENTERING_WORLD")
end)

--채팅창 이름 직업색상 표시
for k in next, getmetatable(ChatTypeInfo).__index do
	SetChatColorNameByClass(k, true)
end

--TalkingHeadFrame
CreateFrame("Frame","TH")
TH:RegisterEvent("TALKINGHEAD_REQUESTED")
TH:SetScript("OnEvent", function()
	THF = TalkingHeadFrame
	THF:UnregisterAllEvents();
	TalkingHeadFrame_CloseImmediately();
	C_TalkingHead.IgnoreCurrentTalkingHead();
	THF:Hide();
TH:UnregisterEvent("TALKINGHEAD_REQUESTED")
end)

--현재 퀘스트 갯수 표시
local CurrentQN = CreateFrame("FRAME", "CurrentQN", QuestScrollFrame)
CurrentQN:SetPoint("TOP", QuestScrollFrame, 0, 25)
CurrentQN:SetWidth(200)
CurrentQN:SetHeight(20)

CurrentQN.text = CurrentQN:CreateFontString()
CurrentQN.text:SetPoint("CENTER")
CurrentQN.text:SetSize(200, 20)
CurrentQN.text:SetFont("Fonts\\FRIZQT__.TTF", 12, "")

CurrentQN:RegisterEvent("QUEST_LOG_UPDATE")
CurrentQN:SetScript("OnEvent",function(self)
	self.text:SetText(select(2,GetNumQuestLogEntries()).." / "..MAX_QUESTS)
end)

--화면상단에 현재/필요 경험치 표시, 클릭시 휴식경험치 토글
local DXP = CreateFrame("FRAME", "DXP", UIParent)
DXP:SetPoint("TOP", UIParent, 0, -5)
DXP:SetWidth(200)
DXP:SetHeight(20)
DXP.text = DXP:CreateFontString()
DXP.text:SetPoint("CENTER",DXP,"CENTER",0,0)
DXP.text:SetSize(DXP:GetRight()-DXP:GetLeft(),DXP:GetHeight())
DXP.text:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
DXP:RegisterEvent("PLAYER_ENTERING_WORLD")
DXP:RegisterEvent("PLAYER_XP_UPDATE")
DXP:RegisterEvent("PLAYER_LEVEL_UP")
DXP:SetScript("OnEvent",function(self,event,...)
if UnitLevel("player")==MAX_PLAYER_LEVEL then return end
--	self.text:SetText(format( XP_TEXT, BreakUpLargeNumbers(UnitXP("player")), BreakUpLargeNumbers(UnitXPMax("player")),(math.ceil(UnitXP("player")/UnitXPMax("player")*100))))
local currXP = UnitXP("player");
local nextXP = UnitXPMax("player");
local percentXP = math.ceil(currXP/nextXP*100);
local XPText = format( XP_TEXT, BreakUpLargeNumbers(currXP), BreakUpLargeNumbers(nextXP), percentXP );
local XPExh
if GetXPExhaustion() then XPExh=format("%d%%",(UnitXP("player")+GetXPExhaustion())/UnitXPMax("player")*100) else XPExh=0 end

local XPbtn = CreateFrame("BUTTON", "XPbtn", DXP)
XPbtn:SetPoint("CENTER", DXP, 0, 0)
XPbtn:SetFrameStrata("DIALOG")
XPbtn:SetWidth(200)
XPbtn:SetHeight(20)
XPbtn:SetScript("OnClick", function(self, button)
if string.find(DXP.text:GetText(),"/") == nil then
	DXP.text:SetText(format( XP_TEXT, BreakUpLargeNumbers(currXP), BreakUpLargeNumbers(nextXP), percentXP ))
else
	DXP.text:SetText(format("%d%%",(UnitXP("player")+GetXPExhaustion())/UnitXPMax("player")*100))
end	
end)

self.text:SetText(XPText)
end)

-- Tooltip
-- 툴팁위치 마우스 커서에 고정
-- hooksecurefunc("GameTooltip_SetDefaultAnchor", function(self, parent) self:SetOwner(parent, "ANCHOR_CURSOR_RIGHT", 0, 0) end)
-- 툴팁에 대상 표시
-- GameTooltip:HookScript("OnTooltipSetUnit",function(s)local n,u=s:GetUnit()if not u then return end;n=UnitName(u.."target")if n then s:AddDoubleLine("대상  ▶", n==UnitName"player"and"\124cffff00ff<<YOU>>\124r"or n)s:Show()end end)

