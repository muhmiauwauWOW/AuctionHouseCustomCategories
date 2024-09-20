local AHCC = LibStub("AceAddon-3.0"):GetAddon("AHCC")
local L, _ = AHCC:GetLibs()


AHCCPriceScanMixin = {}

function AHCCPriceScanMixin:OnLoad()
end

function AHCCPriceScanMixin:OnShow()
    self:RegisterEvent("AUCTION_HOUSE_BROWSE_RESULTS_UPDATED");
    local items = AHCCItems:getAll()
    self.chunks = _.chunk(items, 80)
    self.progress = 0
    self.total = #self.chunks

    self:Perform()

    self:TickerFn()

    C_Timer.After(20, function()
        if self.progress >= self.total then return end
        self:Done()
    end)
end

function AHCCPriceScanMixin:TickerFn()
    if self.progress == self.total then self:Done(); return end
    self.Text:SetText(string.format(L["pricescan_inProgress"] .. " \n %s / %s",self.progress, self.total))
end

function AHCCPriceScanMixin:Done()
    AHCC.db.global.lastReplicateDate = GetServerTime()
    self:Hide()
    AHCC:performSearch()
end

function AHCCPriceScanMixin:OnHide()
    self:UnregisterEvent("AUCTION_HOUSE_BROWSE_RESULTS_UPDATED");
end

function AHCCPriceScanMixin:OnEvent(event)
    local items =  AuctionHouseFrame.BrowseResultsFrame.browseResults
    _.forEach(items, function(item) 
        AHCCItems:updatePrice(item.itemKey.itemID, item.minPrice)
    end)

    self:Perform()
end

function AHCCPriceScanMixin:Perform()
    self:TickerFn()
    if self.progress == self.total then return end
    self.progress = self.progress + 1

    local items = CopyTable(self.chunks[self.progress])
    local ItemKeys = {}
    _.forEach(items, function(item) 
        local itemKey = C_AuctionHouse.MakeItemKey(item.itemKey.itemID)
        table.insert(ItemKeys, itemKey)
    end)

    local sorts = {
        {sortOrder = Enum.AuctionHouseSortOrder.Price, reverseSort = false},
        {sortOrder = Enum.AuctionHouseSortOrder.Name, reverseSort = false},
    }

    C_AuctionHouse.SearchForItemKeys(ItemKeys, sorts)
end