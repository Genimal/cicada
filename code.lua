﻿-- SetCVar("", )
SetCVar("autoLootDefault", 1)
SetCVar("mapFade", 0)
SetCVar("lockedWorldMap", 0)
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

SetCVar("nameplateShowSelf", 0)
SetCVar("nameplateShowAll", 1)
SetCVar("nameplatePersonalShowAlways", 1)

-- SetCVar ("nameplateSelfScale", 1)
-- SetCVar ("nameplateSelfAlpha", 0.75)
SetCVar("nameplateOccludedAlphaMult", 0.6) -- 가린 이름표 투명도
-- SetCVar("TargetNearestUseOld", 1) -- 탭 타게팅

SetCVar("noBuffDebuffFilterOnTarget", 1)

SetCVar("raidFramesDisplayClassColor", 1)
SetCVar("raidFramesDisplayPowerBars", 1)
SetCVar("useCompactPartyFrames", 1)
SetCVar("raidOptionDisplayMainTankAndAssist", 0)
SetCVar("raidOptionDisplayPets", 0)
SetCVar("raidOptionShowBorders", 0)
SetCVar("raidOptionSortMode", group)
SetCVar("raidOptionKeepGroupsTogether", 1)

SetCVar("ffxDeath", 0)
SetCVar("ffxGlow", 0)

-- hooksecurefunc("CompactUnitFrame_UpdateName", function(npf) local _,iType = IsInInstance();if not npf:GetName():find("NamePlate%d") then return end if (iType=="pvp" or iType=="arena" or iType=="none") then if UnitIsFriend("player", npf.unit) then if UnitIsPlayer(npf.unit) then npf.healthBar:SetStatusBarColor(0,0,1) else npf.healthBar:SetStatusBarColor(0,1,0) end end else return end end)
hooksecurefunc("CompactUnitFrame_UpdateName", function(nf) if nf:IsForbidden() or not nf:GetName():find("NamePlate%d") then return end;if UnitIsFriend("player", nf.unit) then if UnitIsPlayer(nf.unit) then nf.healthBar:SetStatusBarColor(0,0,1) else nf.healthBar:SetStatusBarColor(0,1,0) end end end)


PAPERDOLL_STATCATEGORIES[1].stats[7] = { stat = "MOVESPEED" };
hooksecurefunc("PaperDollFrame_SetMovementSpeed", function(statFrame, unit) statFrame:Show() end); -- 캐릭터창 이속표시
PAPERDOLL_STATCATEGORIES[1].stats[8] = { stat = "ATTACK_DAMAGE" };

local z = CreateFrame("FRAME")
    z:RegisterEvent("PLAYER_ENTERING_WORLD")
    z:SetScript("OnEvent", function()
    SetCVar("cameraDistanceMaxZoomFactor", 2.6)
SetCVar("raidFramesDisplayClassColor", 1)
SetCVar("raidFramesDisplayPowerBars", 1)
SetCVar("useCompactPartyFrames", 1)
SetCVar("raidOptionDisplayMainTankAndAssist", 0)
SetCVar("raidOptionDisplayPets", 0)
SetCVar("raidOptionShowBorders", 0)
SetCVar("raidOptionSortMode", group)
SetCVar("raidOptionKeepGroupsTogether", 1)
    z:UnregisterEvent("PLAYER_ENTERING_WORLD")
end
) -- 시야 넓히기 /console cameraDistanceMaxZoomFactor 2.6


local c=LossOfControlFrame;c.RedLineBottom:Hide();c.blackBg:Hide();c.RedLineTop:Hide();c:SetScale(0.7);select(2,LossOfControlFrame:GetChildren()):SetAlpha(0) -- LOC 깔끔하게

-- /console scriptErrors 1 : Enable LUA ERROR


-- hooksecurefunc("GameTooltip_SetDefaultAnchor", function(self, parent) self:SetOwner(parent, "ANCHOR_CURSOR_RIGHT", 0, 0) end) -- 툴팁위치 마우스 커서에 고정

-- GameTooltip:HookScript("OnTooltipSetUnit",function(s)local n,u=s:GetUnit()if not u then return end;n=UnitName(u.."target")if n then s:AddDoubleLine("대상  ▶", n==UnitName"player"and"\124cffff00ff<<YOU>>\124r"or n)s:Show()end end) -- 툴팁에 대상 표시

-- hooksecurefunc("TargetFrame_UpdateAuras", function(s) local sN=s:GetName() for i=1,16 do local tdc,tbc=_G[sN.."Debuff"..i .."Cooldown"],_G[sN.."Buff"..i .."Cooldown"];if tdc then tdc:SetHideCountdownNumbers(false) elseif tbc then tbc:SetHideCountdownNumbers(false) end end end) -- 버프/디버프 남은시간 표시