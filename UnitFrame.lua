-- 공격대창 크기
local CUFOF="CompactUnitFrameProfilesGeneralOptionsFrame";
_G[CUFOF.."HeightSlider"]:SetMinMaxValues(40,45);
_G[CUFOF.."WidthSlider"]:SetMinMaxValues(40,45);

-- 기본프레임 파티숫자 숨기기+프레임 붙이기
hooksecurefunc("CompactRaidGroup_UpdateLayout",function(f)
f.title:SetHeight(0);f.title:SetWidth(0);f.title:SetText(nil)
local f1 = _G[f:GetName().."Member1"]
f1:ClearAllPoints()
	if (CUF_HORIZONTAL_GROUPS)then 
		f1:SetPoint("TOPLEFT")
		f:SetHeight(f1:GetHeight())
	else
		f1:SetPoint("TOP")
		f:SetWidth(f1:GetWidth())
	end
end)

-- 전장 입장시 내가 공격대장일 경우 자동으로 전원 부공 승급
hooksecurefunc("RaidFrameAllAssistCheckButton_UpdateAvailable", function(self)
		if select(2,IsInInstance())=="pvp" and (UnitIsGroupLeader("player"))and not IsEveryoneAssistant() then
			SetEveryoneIsAssistant(true);
		end;
	end)
