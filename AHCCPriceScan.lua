local AHCC = LibStub("AceAddon-3.0"):GetAddon("AHCC")
local L, _ = AHCC:GetLibs()

-- LoadItemData copied from Baganator code
local pendingItems = {}
local AHCCitemFrame = CreateFrame("Frame")
AHCCitemFrame.inProgress = false;

function AHCCitemFrame:ResetData() AHCCitemFrame.scanData = {} end

function AHCCitemFrame:InitiateScan()
    if self:CanInitiate() then C_AuctionHouse.ReplicateItems() end
end

function AHCCitemFrame:CanInitiate() return not self.inProgress end

function AHCCitemFrame:CacheScanData()
    if not self:CanInitiate() then return end
    print("CacheScanData", self.inProgress)
    self.inProgress = true
    self:ResetData()
    self.waitingForData = C_AuctionHouse.GetNumReplicateItems()

    self:ProcessBatch(0, 250, self.waitingForData)
end

AuctionHouseFrame:HookScript("OnHide", function()
    -- print("OnHide", AHCCitemFrame.inProgress)
    if AHCCitemFrame.inProgress then
        AHCCitemFrame.inProgress = false
        AHCCitemFrame:ResetData()
    end
end)

AHCCitemFrame:RegisterEvent("REPLICATE_ITEM_LIST_UPDATE")
AHCCitemFrame.elapsed = 0
AHCCitemFrame:SetScript("OnEvent", function(self, event, itemID)
    if event == "REPLICATE_ITEM_LIST_UPDATE" then
        if self:CanInitiate() then self:CacheScanData() end
    else
        if pendingItems[itemID] ~= nil then
            local forItemID = pendingItems[itemID]
            pendingItems[itemID] = nil
            for _, callback in ipairs(forItemID) do callback() end
        end
    end
end)
AHCCitemFrame.OnUpdate = function(self, elapsed)
    AHCCitemFrame.elapsed = AHCCitemFrame.elapsed + elapsed
    if AHCCitemFrame.elapsed > 0.4 then
        for itemID in pairs(pendingItems) do
            C_Item.RequestLoadItemDataByID(itemID)
        end
        AHCCitemFrame.elapsed = 0
    end

    if next(pendingItems) == nil then
        AHCCitemFrame.elapsed = 0
        self:SetScript("OnUpdate", nil)
        self:UnregisterEvent("ITEM_DATA_LOAD_RESULT")
    end
end

local function LoadItemData(itemID, callback)
    pendingItems[itemID] = pendingItems[itemID] or {}
    table.insert(pendingItems[itemID], callback)
    AHCCitemFrame:RegisterEvent("ITEM_DATA_LOAD_RESULT")
    AHCCitemFrame:SetScript("OnUpdate", AHCCitemFrame.OnUpdate)
    C_Item.RequestLoadItemDataByID(itemID)
end

function AHCCitemFrame:ProcessBatch(startIndex, stepSize, limit)
    if startIndex >= limit then
        C_Timer.After(2, function()
            if AHCCitemFrame.waitingForData > 0 then
                AHCCitemFrame.waitingForData = 0
                AHCCitemFrame:EndProcessing()
            end
        end)
        return
    end

    local found = _.size(self.scanData)
    local progress = (found / AHCCItems.itemIDMapSize) * 100
    AHCC.PriceScan:SetText(string.format("%d / %d (%.1f%%)", found, AHCCItems.itemIDMapSize, progress))


    local index = startIndex
    while index < startIndex + stepSize and index < limit do
        local info = {C_AuctionHouse.GetReplicateItemInfo(index)}

        local itemID = info[17]
        if itemID and C_Item.DoesItemExistByID(itemID) and AHCCItems.itemIDMap[itemID] then

            local link = C_AuctionHouse.GetReplicateItemLink(index)
            local timeLeft = C_AuctionHouse.GetReplicateItemTimeLeft(index)

            local capturedIndex = index
            if not info[18] then
                LoadItemData(itemID, function()
                    AHCCitemFrame.scanData[itemID] = {
                        replicateInfo = {
                            C_AuctionHouse.GetReplicateItemInfo(capturedIndex)
                        },
                        itemLink = C_AuctionHouse.GetReplicateItemLink(
                            capturedIndex),
                        timeLeft = C_AuctionHouse.GetReplicateItemTimeLeft(
                            capturedIndex)
                    }
                    self.waitingForData = self.waitingForData - 1
                    if self.waitingForData == 0 then self:EndProcessing() end
                end)
            else
                AHCCitemFrame.scanData[itemID] = {
                    replicateInfo = info,
                    itemLink = link,
                    timeLeft = timeLeft
                }
                self.waitingForData = self.waitingForData - 1
                if self.waitingForData == 0 then self:EndProcessing() end
            end
        else
            self.waitingForData = self.waitingForData - 1
            if self.waitingForData == 0 then self:EndProcessing() end
        end

        index = index + 1
    end

    C_Timer.After(0.01, function()
        AHCCitemFrame:ProcessBatch(startIndex + stepSize, stepSize, limit)
    end)
end

function AHCCitemFrame:EndProcessing()
    local count = 0
    _.forEach(self.scanData, function(scanItem, itemID)
        local replicateInfo = scanItem.replicateInfo
        if scanItem.itemLink and replicateInfo then
            local stackSize = replicateInfo[3]
            local buyoutPrice = replicateInfo[10]

            -- Only update price if we have this item in our system
            if stackSize and buyoutPrice and stackSize > 0 and buyoutPrice > 0 then
                local effectivePrice = buyoutPrice / stackSize
                print("updatePrice", itemID)
                local success = AHCCItems:updatePrice(itemID, effectivePrice)
                if success then count = count + 1 end
            end
        end
    end)

    AHCC.db.global.lastScan = time()

    AHCC.PriceScan:Done()
    AHCC.PriceScan:SetText("")
end

AHCCPriceScanMixin = {}

function AHCCPriceScanMixin:OnLoad()
    local button = self.ScanButton
    button:SetText(L["start_scan"])
    button:SetWidth(button.Text:GetStringWidth() + 24) -- 24px Padding wie Blizzard-Standard

    self.Text:SetPoint("RIGHT", button, "LEFT", -10, 0)

end

function AHCCPriceScanMixin:ShowText() self.Text:Show() end

function AHCCPriceScanMixin:SetText(str) self.Text:SetText(str) end

function AHCCPriceScanMixin:HideText() self.Text:Hide() end

function AHCCPriceScanMixin:startScan()
    if AHCCitemFrame:CanInitiate() then
        self:SetText(L["start_scan"] .. "...")
        self:ShowText()
        self.ScanButton:SetEnabled(false)

        AHCCitemFrame:InitiateScan()
    else
        self:SetText(L["cannot_initiate_scan"])
        self:ShowText()
    end
end

local itemFrame = CreateFrame("Frame")
itemFrame:RegisterEvent("COMMODITY_SEARCH_RESULTS_UPDATED")
itemFrame.elapsed = 0
itemFrame:SetScript("OnEvent", function(self, event, itemID)
    -- print("itemFrame", event)

    if event == "COMMODITY_SEARCH_RESULTS_UPDATED" then
        local result = C_AuctionHouse.GetCommoditySearchResultInfo(itemID, 1)
        if not result then return end
        local success = AHCCItems:updatePrice(itemID, result.unitPrice)
        if not success then return end
        C_Timer.After(0.1, function() AHCCPriceScanMixin:Done() end)
    end

end)
function AHCCPriceScanMixin:OnShow() end
function AHCCPriceScanMixin:Done()
    AuctionHouseFrame.BrowseResultsFrame:Reset()
    AuctionHouseFrame.BrowseResultsFrame.ItemList:DirtyScrollFrame();
    AHCC:performSearch(true)
end

function AHCCPriceScanMixin:OnHide() end
