local AHCC = LibStub("AceAddon-3.0"):GetAddon("AHCC")
local L, _ = AHCC:GetLibs()





-- Quality column
AuctionHouseTableCellQualityMixin = CreateFromMixins(TableBuilderCellMixin);
function AuctionHouseTableCellQualityMixin:Populate(rowData, dataIndex)
    local noneAvailable = self.rowData.totalQuantity == 0;
    self.Text:SetFontObject(noneAvailable and PriceFontGray or PriceFontWhite);

    if AHCC.Config.ProfessionsQualityIconTable[rowData.quality] then
        local icon = CreateAtlasMarkupWithAtlasSize(AHCC.Config.ProfessionsQualityIconTable[rowData.quality], 0, 0, nil,nil, nil, AHCC.Config.ProfessionsQualityIconSize)
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



AHCCQualitySelectButtonMixin = {}

function AHCCQualitySelectButtonMixin:OnLoad()
    self:SetState(AHCC.Config.ProfessionsQualityActive[self.tier])
    self:SetAtlas(self.iconAtlas, AHCC.Config.ProfessionsQualityIconSize);
    SquareIconButtonMixin.OnLoad(self);
end

function AHCCQualitySelectButtonMixin:OnClick()
    local state = not AHCC.Config.ProfessionsQualityActive[self.tier]
    self:SetState(state)
    AHCC:performSearch()
end

function AHCCQualitySelectButtonMixin:SetState(state)
    AHCC.Config.ProfessionsQualityActive[self.tier] = state
    self.Icon:SetDesaturated(not state);
end




AHCCAuctionCategoryMixin = CreateFromMixins(AuctionCategoryMixin);

function AHCCAuctionCategoryMixin:AddNav(first)
    local nav = { self.AHCC_Id }

    local function addIds(navTable, parent)
        tinsert(navTable, parent.AHCC_Id)
        return (parent.AHCC_parent) and  addIds(navTable,parent.AHCC_parent) or nav
    end

    if not first then 
        nav = addIds(nav, self.AHCC_parent)
    end

    nav = _.reverse(nav)
    self.AHCC_Nav = nav
end


function AHCCAuctionCategoryMixin:SetConfig(config, first)
    self:SetFlag("AHCC");
    local cfg = config or {}

    if not first and #cfg == 0 then
        if self.AHCC_parent then 
            cfg = self.AHCC_parent.AHCC_config or {}
        end
    end

    local cols = {"Name"}

    if Auctionator then 
        cols = {"Price", "Name"}
    end

    if cfg.columns then 
        tAppendAll(cols, cfg.columns)
    else
        tinsert(cols, "quality")
    end

    cfg.columns = cols
    self.AHCC_config = cfg
end