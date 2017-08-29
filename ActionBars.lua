
-- IconIntroTracker.RegisterEvent = function() end
IconIntroTracker:UnregisterEvent('SPELL_PUSHED_TO_ACTIONBAR') -- 스킬 자동배치 차단


ExtraActionButton1.style:SetAlpha(0) -- 추가행동바 테두리 없애기
ZoneAbilityFrame.SpellButton.Style:SetAlpha(0) -- 주둔지 스킬 테두리 없애기

ZoneAbilityFrame:ClearAllPoints()
ZoneAbilityFrame:SetPoint("BOTTOM", UIParent,"BOTTOM", 0, 290)
ZoneAbilityFrame.SetPoint = function() end
ZoneAbilityFrame:SetScale(0.6)

local am = CreateFrame("Frame", nil, UIParent)
PlayerPowerBarAlt:SetMovable(true)
PlayerPowerBarAlt:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 850)
PlayerPowerBarAlt:SetAlpha(0.75)
PlayerPowerBarAlt.statusFrame:Show()
PlayerPowerBarAltStatusFrameText:Show()
-- PlayerPowerBarAlt.frame:SetAlpha(0)
-- PlayerPowerBarAlt.background:SetAlpha(0)
PlayerPowerBarAlt:SetUserPlaced(true)
am:SetAllPoints(PlayerPowerBarAlt) -- 파워바 옮기기

-- SetCVar("alternateResourceText", 1)

hooksecurefunc("OrderHall_CheckCommandBar", function()if OrderHallCommandBar then OrderHallCommandBar:Hide() end end) -- 연맹전당 바 숨기기 /run OrderHall_CheckCommandBar = function() end; if OrderHallCommandBar then OrderHallCommandBar:Hide() end

local bh
for _,bh in next,{MainMenuExpBar, MainMenuBarMaxLevelBar, ReputationWatchBar, ArtifactWatchBar,HonorWatchBar} do
	bh:UnregisterAllEvents();
	bh.pauseUpdates = true
	bh:Hide();
	bh.Show = bh.Hide;
end -- 경험치바 숨기기

MainMenuBarLeftEndCap:Hide();MainMenuBarRightEndCap:Hide();MainMenuBarPageNumber:Hide();ActionBarDownButton:Hide();ActionBarUpButton:Hide();for i=0,3 do _G["MainMenuBarTexture"..i]:Hide() end

-- for i,v in ipairs{"Left","Right"} do for i = 2, 12 do local n = "MultiBar"..v.."Button" local btn=_G[n..i] btn:ClearAllPoints() btn:SetPoint("LEFT", n..i - 1, "RIGHT", 6, 0);end end -- 추가 행동바 가로정렬


-- hooksecurefunc("ActionButton_UpdateCooldown", function(btn) local NT,FBG = _G[btn:GetName().."NormalTexture"],_G[btn:GetName().."FloatingBG"] NT:Hide() if btn:GetName():find("MultiBar") then FBG:Hide()end end) -- 액션바 배경 투명



-- ActionButton1:ClearAllPoints();
-- ActionButton1:SetPoint("TOP", MultiBarRightButton1, 0, 160)
-- ActionButton1.SetPoint = function() end
-- for k=1,12 do _G["ActionButton"..k]:SetScale(0.85) end

-- MultiBarBottomLeftButton1:ClearAllPoints()
-- MultiBarBottomLeftButton1:SetPoint("TOP", MultiBarRightButton1, 0, 120)
-- MultiBarBottomLeftButton1.SetPoint = function() end
-- MultiBarBottomLeft:SetScale(0.85)

-- MultiBarBottomRightButton1:ClearAllPoints()
-- MultiBarBottomRightButton1:SetPoint("TOP", MultiBarRightButton1, 0, 80)
-- MultiBarBottomRightButton1.SetPoint = function() end
-- MultiBarBottomRight:SetScale(0.85)

-- MultiBarLeftButton1:ClearAllPoints()
-- MultiBarLeftButton1:SetPoint("TOP", MultiBarRightButton1, 0, 40)
-- MultiBarLeftButton1.SetPoint = function() end
-- MultiBarLeft:SetScale(0.85)

-- MultiBarRightButton1:ClearAllPoints();MultiBarRightButton1:SetPoint("BOTTOM", UIParent, "BOTTOM", -260, 0);MultiBarRightButton1.SetPoint = function() end;MultiBarRight:SetScale(0.85)

-- StanceButton1:ClearAllPoints();StanceButton1:SetPoint("TOP", MultiBarRightButton1, 0, 180);StanceButton1.SetPoint = function() end

-- local pa=PetActionBarFrame;pa:SetScale(0.8)pa:ClearAllPoints();pa:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 220);pa.SetPoint = function() end



-- MainMenuBarBackpackButton:ClearAllPoints();MainMenuBarBackpackButton:SetPoint("BOTTOMRIGHT", UIParent, 0, 0);MainMenuBarBackpackButton.SetPoint = function() end

-- CharacterMicroButton:ClearAllPoints();CharacterMicroButton:SetPoint("BOTTOM", UIParent, 535, 0);CharacterMicroButton.SetPoint = function() end


