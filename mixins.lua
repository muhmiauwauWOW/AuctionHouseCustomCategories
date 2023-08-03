local AHCC = LibStub("AceAddon-3.0"):GetAddon("AHCC")
local L = LibStub("AceLocale-3.0"):GetLocale("AHCC")


-- Quality column
AuctionHouseTableCellQualityMixin = CreateFromMixins(TableBuilderCellMixin);
function AuctionHouseTableCellQualityMixin:Populate(rowData, dataIndex)
    local noneAvailable = self.rowData.totalQuantity == 0;
    self.Text:SetFontObject(noneAvailable and PriceFontGray or PriceFontWhite);
   
    if AHCC.Config.ProfessionsQualityIconTable[rowData.quality] then 
        local icon =  CreateAtlasMarkupWithAtlasSize(AHCC.Config.ProfessionsQualityIconTable[rowData.quality], 0,0,nil,nil,nil,AHCC.Config.ProfessionsQualityIconSize)
        self.Text:SetText(icon);
    end
end


AuctionHouseTableCellStatMixin = CreateFromMixins(TableBuilderCellMixin);
function AuctionHouseTableCellStatMixin:updateText(text)
    local stat = text or 0
    local text = AHCC.Config.tableCellStats[stat+1]
    if text then 
        self.Text:SetText(text);
    end 
    
    local color = AHCC.Config.tableCellStatColors[stat+1]
    if color then
        self.Text:SetTextColor(unpack(color))
    end
end

-- stat1 column
AuctionHouseTableCellStat1Mixin = CreateFromMixins(AuctionHouseTableCellStatMixin);
function AuctionHouseTableCellStat1Mixin:Populate(rowData, dataIndex)
    self:updateText(rowData.stat1)
end

-- stat2 column
AuctionHouseTableCellStat2Mixin = CreateFromMixins(AuctionHouseTableCellStatMixin);
function AuctionHouseTableCellStat2Mixin:Populate(rowData, dataIndex)
    self:updateText(rowData.stat2)
end
