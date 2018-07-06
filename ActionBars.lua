--스킬 자동배치 차단
-- IconIntroTracker.RegisterEvent = function() end
IconIntroTracker:UnregisterEvent('SPELL_PUSHED_TO_ACTIONBAR')

--추가행동바 테두리 없애기
ExtraActionButton1.style:SetAlpha(0)

--주둔지 스킬
ZoneAbilityFrame.SpellButton.Style:SetAlpha(0) --테두리
ZoneAbilityFrame:ClearAllPoints()
--ZoneAbilityFrame:SetPoint("BOTTOM", UIParent,"BOTTOM", 0, 290) --엑스트라바 위치
ZoneAbilityFrame:SetPoint("BOTTOM", UIParent,"BOTTOM", 280, 250) --12번버튼 위쪽
ZoneAbilityFrame.SetPoint = function() end
ZoneAbilityFrame:SetScale(0.6)

--파워바 옮기기
CreateFrame("Frame","am")
PlayerPowerBarAlt:SetMovable(true)
PlayerPowerBarAlt:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 850)
PlayerPowerBarAlt:SetAlpha(0.75)
PlayerPowerBarAlt.statusFrame:Show()
PlayerPowerBarAltStatusFrameText:Show()
-- PlayerPowerBarAlt.frame:SetAlpha(0)
-- PlayerPowerBarAlt.background:SetAlpha(0)
PlayerPowerBarAlt:SetUserPlaced(true)
am:SetAllPoints(PlayerPowerBarAlt)

-- SetCVar("alternateResourceText", 1)

-- 연맹전당 바 숨기기 /run OrderHall_CheckCommandBar = function() end; if OrderHallCommandBar then OrderHallCommandBar:Hide() end
hooksecurefunc("OrderHall_CheckCommandBar", function()
if OrderHallCommandBar then
	OrderHallCommandBar:Hide()
end
end)

--경험치바 숨기기
StatusTrackingBarManager:Hide();

--액션바 배경 투명하게
--MainMenuBarArtFrame:Hide()
MainMenuBarArtFrame.LeftEndCap:Hide();
MainMenuBarArtFrame.RightEndCap:Hide();
ActionBarDownButton:Hide();
ActionBarUpButton:Hide();
MainMenuBarArtFrame.PageNumber:Hide();
MainMenuBarArtFrameBackground:Hide();
MicroButtonAndBagsBar.MicroBagBar:Hide()
--[[BonusActionBarFrameTexture1:SetAlpha(0)
BonusActionBarFrameTexture2:SetAlpha(0) -- this is for druids/rogues/warriors.
BonusActionBarFrameTexture3:SetAlpha(0) -- their stances cause this to show up
BonusActionBarFrameTexture4:SetAlpha(0) -- over the normal bar.]]--
SlidingActionBarTexture0:SetAlpha(0)
SlidingActionBarTexture1:SetAlpha(0) -- hide pet bar background

-- 여기서부터는 액션바 애드온과 중복
-- 추가 행동바 가로정렬
for i,v in ipairs{"Left","Right"} do for i = 2, 12 do local n = "MultiBar"..v.."Button" local btn=_G[n..i] btn:ClearAllPoints() btn:SetPoint("LEFT", n..i - 1, "RIGHT", 6, 0);end;end;

--hooksecurefunc("ActionButton_UpdateCooldown", function(btn) local NT,FBG = _G[btn:GetName().."NormalTexture"],_G[btn:GetName().."FloatingBG"] NT:Hide() if btn:GetName():find("MultiBar") then FBG:Hide()end end) -- 액션바 배경 투명

--액션바 크기조절
hooksecurefunc("MultiActionBar_Update", function()
MainMenuBar:SetScale(0.85)
MultiBarLeft:SetScale(0.85)
MultiBarRight:SetScale(0.85)
--MultiBarBottomLeft:SetScale(0.85)
--MultiBarBottomRight:SetScale(0.85)
end)

--1열 액션바
ActionButton1:ClearAllPoints();
ActionButton1:SetPoint("TOP", MultiBarRightButton1, 0, 160)
ActionButton1.SetPoint = function() end
--for k=1,12 do _G["ActionButton"..k]:SetScale(0.85) end

--2번 액션바
MultiBarBottomLeftButton1:ClearAllPoints()
MultiBarBottomLeftButton1:SetPoint("TOP", MultiBarRightButton1, 0, 120)
MultiBarBottomLeftButton1.SetPoint = function() end

--3열 액션바
MultiBarBottomRightButton1:ClearAllPoints()
MultiBarBottomRightButton1:SetPoint("TOP", MultiBarRightButton1, 0, 80)
MultiBarBottomRightButton1.SetPoint = function() end
--3열 액션바 일렬로
MultiBarBottomRightButton7:ClearAllPoints()
MultiBarBottomRightButton7:SetPoint("LEFT", MultiBarBottomRightButton6, "RIGHT", 6, 0)
MultiBarBottomRightButton7.SetPoint = function() end

--4열 액션바
MultiBarLeftButton1:ClearAllPoints()
MultiBarLeftButton1:SetPoint("TOP", MultiBarRightButton1, 0, 40)
MultiBarLeftButton1.SetPoint = function() end

--5열 액션바
MultiBarRightButton1:ClearAllPoints();
MultiBarRightButton1:SetPoint("BOTTOM", UIParent, "BOTTOM", -260, 0);
MultiBarRightButton1.SetPoint = function() end;

--태세바 배경 투명+위치/크기 조절
hooksecurefunc("StanceBar_Update", function()
StanceBarLeft:Hide()
StanceBarMiddle:Hide()
StanceBarRight:Hide()
StanceButton1:ClearAllPoints();StanceButton1:SetPoint("LEFT", StanceBarFrame, 0, 0);StanceButton1.SetPoint = function() end
local SBF=StanceBarFrame;SBF:SetScale(0.8)SBF:ClearAllPoints();SBF:SetPoint("BOTTOMLEFT", ActionButton1, "TOPLEFT", 0, 6);SBF.SetPoint = function() end
end)

--펫 액션바 위치/크기 조절
local pa=PetActionBarFrame;
pa:SetScale(0.9);
pa:ClearAllPoints();
pa:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 225);
pa.SetPoint = function() end

--MainMenuBarBackpackButton:ClearAllPoints();MainMenuBarBackpackButton:SetPoint("BOTTOMRIGHT", UIParent, 0, 0);MainMenuBarBackpackButton.SetPoint = function() end
--CharacterMicroButton:ClearAllPoints();CharacterMicroButton:SetPoint("BOTTOM", UIParent, 535, 0);CharacterMicroButton.SetPoint = function() end
