local AHCC = LibStub("AceAddon-3.0"):GetAddon("AHCC")
local L, _ = AHCC:GetLibs()


AHCCPriceScanMixin = {}

function AHCCPriceScanMixin:OnLoad()

    local button = self.ScanButton
    button:SetText(L["start_scan"])
    button:SetWidth(button.Text:GetStringWidth() + 24) -- 24px Padding wie Blizzard-Standard

    self.Text:SetPoint("RIGHT", button ,"LEFT", -10, 0)
end


function AHCCPriceScanMixin:ShowText()
    self.Text:Show()
end

function AHCCPriceScanMixin:SetText(str)
    self.Text:SetText(str)
end

function AHCCPriceScanMixin:HideText()
    self.Text:Hide()
end


function AHCCPriceScanMixin:startScan()
    print("start scan")
    self:SetText("lalaal")
    self:ShowText()
    self.ScanButton:SetEnabled(false)
end



function AHCCPriceScanMixin:OnShow()
    self:RegisterEvent("AUCTION_HOUSE_BROWSE_RESULTS_UPDATED");
    self.chunks = _.chunk(self.items, 50)
    self.progress = 0
    self.total = #self.chunks
    
    -- self:Perform()


    C_Timer.After(20, function()
        if self.progress >= self.total then return end
        self:Done()
    end)
end




function AHCCPriceScanMixin:Done()
    -- self:Hide()
   
    AuctionHouseFrame.BrowseResultsFrame:Reset()
    AuctionHouseFrame.BrowseResultsFrame.ItemList:DirtyScrollFrame();
    AHCC:performSearch(true)
end

function AHCCPriceScanMixin:OnHide()
    self:UnregisterEvent("AUCTION_HOUSE_BROWSE_RESULTS_UPDATED");
end

function AHCCPriceScanMixin:OnEvent(event)
    print("OnEvent", event)
     DevTool:AddData(event,  "event")
    local items =  AuctionHouseFrame.BrowseResultsFrame.browseResults
        DevTool:AddData(items,  self.progress)
    _.forEach(items, function(item)
        AHCCItems:updatePrice(item.itemKey.itemID, item.minPrice)
    end)

    DevTool:AddData(items,  self.progress)

    if self.progress == self.total then 
        self:Done()
        return
    end

    self:Perform()
end

function AHCCPriceScanMixin:Perform()
    if self.progress == self.total then return end
    self.progress = self.progress + 1

    local items = CopyTable(self.chunks[self.progress])
    local ItemKeys = {}

    local itemKey = C_AuctionHouse.MakeItemKey(244838)
        table.insert(ItemKeys, itemKey)


    -- _.forEach(items, function(item) 
    --     local itemKey = C_AuctionHouse.MakeItemKey(item.itemKey.itemID)
    --     table.insert(ItemKeys, itemKey)
    -- end)

    local sorts = {
        {sortOrder = Enum.AuctionHouseSortOrder.Price, reverseSort = false},
        {sortOrder = Enum.AuctionHouseSortOrder.Name, reverseSort = false},
    }


    --@do-not-package@
       DevTool:AddData(ItemKeys,  self.progress .. " pre")
        DevTool:AddData(sorts,  self.progress .. " pre")
    --@end-do-not-package@
    
-- C_AuctionHouse.SearchForFavorites(sorts)
    C_AuctionHouse.SearchForItemKeys(ItemKeys, sorts)
end