﻿local n,w,h="CompactUnitFrameProfilesGeneralOptionsFrame" h,w=_G[n.."HeightSlider"],_G[n.."WidthSlider"] h:SetMinMaxValues(40,45) w:SetMinMaxValues(40,45) -- 공격대창 크기

hooksecurefunc("CompactRaidGroup_UpdateLayout",function(f)
f.title:SetHeight(0);f.title:SetText()
local f1 = _G[f:GetName().."Member1"]
f1:ClearAllPoints()
	if (CUF_HORIZONTAL_GROUPS)then 
		f1:SetPoint("TOPLEFT")
		f:SetHeight(f1:GetHeight())
	else
		f1:SetPoint("TOP")
		f:SetWidth(f1:GetWidth())
	end
end) -- 기본프레임 파티숫자 숨기기+프레임 붙이기

--hooksecurefunc("CompactPartyFrame_Generate", function() CompactPartyFrameTitle:SetText(nil);CompactPartyFrameTitle:SetHeight(0) end)
--hooksecurefunc("CompactRaidGroup_UpdateUnits", function(frame) frame.title:SetText(nil);frame.title:SetHeight(0) end)

-- local cuf;hooksecurefunc("CompactUnitFrame_UpdateHealPrediction", function(cuf) if cuf:GetName():find("NamePlate%d") then return end;cuf.OverAbsorbGlow:SetAlpha(0.3);end)

--hooksecurefunc("CompactRaidGroup_UpdateLayout",function(f)f.title:SetHeight(0);local f1 = _G[f:GetName().."Member1"];f1:ClearAllPoints()if (CUF_HORIZONTAL_GROUPS)then f1:SetPoint("TOPLEFT");f:SetHeight(f1:GetHeight())else f1:SetPoint("TOP");f:SetWidth(f1:GetWidth())end;end)
