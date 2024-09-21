local AHCC = LibStub("AceAddon-3.0"):GetAddon("AHCC")
local L, _ = AHCC:GetLibs()

local LibAHTab = LibStub("LibAHTab-1-0")



AHCCQualitySelectMixin = {}

function AHCCQualitySelectMixin:Init(owner)
	self.owner = owner;
end

function AHCCQualitySelectMixin:GetOwner()
	return self.owner;
end

function AHCCQualitySelectMixin:GetAuctionHouseFrame()
	return self:GetOwner():GetAuctionHouseFrame();
end



function AHCCQualitySelectMixin:OnLoad()
    self:SetParent(AuctionHouseFrame.SearchBar)
end

-- Quality column
AuctionHouseTableCellQualityMixin = CreateFromMixins(TableBuilderCellMixin);
function AuctionHouseTableCellQualityMixin:Populate(rowData, dataIndex)
    local noneAvailable = self.rowData.totalQuantity == 0;
    self.Text:SetFontObject(noneAvailable and PriceFontGray or PriceFontWhite);

    if AHCC.Config.ProfessionsQualityIconTable[rowData.Quality] then
        local icon = CreateAtlasMarkupWithAtlasSize(AHCC.Config.ProfessionsQualityIconTable[rowData.Quality], 0, 0, nil,nil, nil, AHCC.Config.ProfessionsQualityIconSize)
        self.Text:SetText(icon);
    else
        self.Text:SetText("");
    end
end

AuctionHouseTableCellStatMixin = CreateFromMixins(TableBuilderCellMixin);
function AuctionHouseTableCellStatMixin:updateText(text)
    local stat = text or 0
    local text = AHCC.Config.tableCellStats[stat + 1]
    if text then
        self.Text:SetText(text);
    end

    local color = AHCC.Config.tableCellStatColors[stat + 1]
    if color then
        self.Text:SetTextColor(unpack(color))
    end
end

-- Stat1 column
AuctionHouseTableCellStat1Mixin = CreateFromMixins(AuctionHouseTableCellStatMixin);
function AuctionHouseTableCellStat1Mixin:Populate(rowData, dataIndex)
    self:updateText(rowData.Stat1)
end

-- Stat2 column
AuctionHouseTableCellStat2Mixin = CreateFromMixins(AuctionHouseTableCellStatMixin);
function AuctionHouseTableCellStat2Mixin:Populate(rowData, dataIndex)
    self:updateText(rowData.Stat2)
end




-- Stat2 column
AHCCTableCellMoneyMixin = CreateFromMixins(AuctionHouseTableCellStatMixin);


function AHCCTableCellMoneyMixin:OnLoad(owner)
    self.MoneyDisplay:ClearAllPoints();
	self.MoneyDisplay:SetPoint("LEFT");

    self.Text:SetText(L["price_too_old"])
end

function AHCCTableCellMoneyMixin:Populate(rowData, dataIndex)
    local ageCheck = rowData.minPrice > -1 
    self.MoneyDisplay:SetShown(ageCheck)
    self.Text:SetShown(not ageCheck)
    self.MoneyDisplay:SetAmount(rowData.minPrice);
end





AHCCQualitySelectButtonMixin = {}

function AHCCQualitySelectButtonMixin:OnLoad()
    self:SetAtlas(self.iconAtlas, AHCC.Config.ProfessionsQualityIconSize);
    SquareIconButtonMixin.OnLoad(self)
    self.normalTexture = self:GetNormalTexture()
    self.disabledTexture = self:GetDisabledTexture()
    self:SetNormalTexture(self.disabledTexture)
    self:SetState(AHCC.Config.ProfessionsQualityActive[self.tier])
end

function AHCCQualitySelectButtonMixin:OnClick()
    local state = not AHCC.Config.ProfessionsQualityActive[self.tier]
    self:SetState(state)
    self.Icon:SetPoint("CENTER", self, "CENTER", 0, 0);
    AHCC:performSearch()
end

function AHCCQualitySelectButtonMixin:SetState(state)
    AHCC.Config.ProfessionsQualityActive[self.tier] = state
    self.Icon:SetDesaturated(not state);

    local newTexture = state and self.normalTexture or self.disabledTexture
    self:SetNormalTexture(newTexture)
end










AHCCReplicateButtonMixin = {}


function AHCCReplicateButtonMixin:OnLoad()
    self.scanFrame = CreateFrame("Frame", nil, UIParent, "AHCCPriceScanTemplate")
end


function AHCCReplicateButtonMixin:OnClick()
    self:Hide()
    self.scanFrame:Show()
end


function AHCCReplicateButtonMixin:check()    
function AHCCReplicateButtonMixin:check()
    if AHCC.db.global.lastReplicateDate + AHCC.Config.ReplicateDataIntervall < GetServerTime() then 
       self:Show()
    else
       self:Hide()
    end
end