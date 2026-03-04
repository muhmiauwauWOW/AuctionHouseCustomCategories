local AHCC = LibStub("AceAddon-3.0"):GetAddon("AHCC")
local L, _ = AHCC:GetLibs()

AHCCPriceScanMixin = {}

local PRICE_SCAN_EVENTS = {
    "REPLICATE_ITEM_LIST_UPDATE",
    "AUCTION_HOUSE_CLOSED"
}

function AHCCPriceScanMixin:OnLoad()
    local button = self.ScanButton
    button:SetText(L["start_scan"])
    button:SetWidth(button.Text:GetStringWidth() + 24) -- 24px Padding wie Blizzard-Standard

    self.Text:SetPoint("RIGHT", button ,"LEFT", -10, 0)
    
    -- Initialize scan state
    self.inProgress = false
    self.scanData = {}
    self.waitingForData = 0
end

function AHCCPriceScanMixin:ResetData()
    self.scanData = {}
    self.waitingForData = 0
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
    if self:CanInitiate() then
        self:SetText(L["start_scan"] .. "...")
        self:ShowText()
        self.ScanButton:SetEnabled(false)
        
        self.inProgress = true
        self:RegisterForEvents()
        print("repl")
        C_AuctionHouse.ReplicateItems()
    else
        self:SetText(L["cannot_initiate_scan"])
        self:ShowText()
    end
end

function AHCCPriceScanMixin:CanInitiate()
    return not self.inProgress
end

function AHCCPriceScanMixin:RegisterForEvents()
    FrameUtil.RegisterFrameForEvents(self, PRICE_SCAN_EVENTS)
end

function AHCCPriceScanMixin:UnregisterForEvents()
    FrameUtil.UnregisterFrameForEvents(self, PRICE_SCAN_EVENTS)
end

-- LoadItemData copied from Auctionator Frame.lua
local pendingItems = {}
local itemFrame = CreateFrame("Frame")
itemFrame.elapsed = 0
itemFrame:SetScript("OnEvent", function(_, _, itemID)
    if pendingItems[itemID] ~= nil then
        local forItemID = pendingItems[itemID]
        pendingItems[itemID] = nil
        for _, callback in ipairs(forItemID) do
            callback()
        end
    end
end)
itemFrame.OnUpdate = function(self, elapsed)
    itemFrame.elapsed = itemFrame.elapsed + elapsed
    if itemFrame.elapsed > 0.4 then
        for itemID in pairs(pendingItems) do
            C_Item.RequestLoadItemDataByID(itemID)
        end
        itemFrame.elapsed = 0
    end

    if next(pendingItems) == nil then
        itemFrame.elapsed = 0
        self:SetScript("OnUpdate", nil)
        self:UnregisterEvent("ITEM_DATA_LOAD_RESULT")
    end
end

local function LoadItemData(itemID, callback)
    pendingItems[itemID] = pendingItems[itemID] or {}
    table.insert(pendingItems[itemID], callback)
    itemFrame:RegisterEvent("ITEM_DATA_LOAD_RESULT")
    itemFrame:SetScript("OnUpdate", itemFrame.OnUpdate)
    C_Item.RequestLoadItemDataByID(itemID)
end

function AHCCPriceScanMixin:OnShow()
    -- Initialize but don't start automatically
    self:ResetData()
end

function AHCCPriceScanMixin:CacheScanData()
    self:SetText(L["processing_scan"])
    self:ResetData()
    self.waitingForData = C_AuctionHouse.GetNumReplicateItems()
    
    if self.waitingForData == 0 then
        self:SetText(L["no_data_received"])
        self:EndProcessing()
        return
    end
    
    self:ProcessBatch(0, 250, self.waitingForData)
end

function AHCCPriceScanMixin:ProcessBatch(startIndex, stepSize, limit)
    if startIndex >= limit then
        C_Timer.After(2, function()
            if self.waitingForData > 0 then
                self.waitingForData = 0
                self:EndProcessing()
            end
        end)
        return
    end

    -- Update progress
    local progress = math.floor((startIndex / limit) * 100)
    self:SetText(string.format(L["processing_items"], progress))

    local i = startIndex
    while i < startIndex + stepSize and i < limit do
        local info = { C_AuctionHouse.GetReplicateItemInfo(i) }
        local link = C_AuctionHouse.GetReplicateItemLink(i)
        local timeLeft = C_AuctionHouse.GetReplicateItemTimeLeft(i)
        local index = i

        -- Check if item exists
        if not C_Item.DoesItemExistByID(info[17]) then
            self.waitingForData = self.waitingForData - 1
            if self.waitingForData == 0 then
                self:EndProcessing()
            end
        elseif not info[18] then
            LoadItemData(info[17], function()
                local link = C_AuctionHouse.GetReplicateItemLink(index)
                
                self.waitingForData = self.waitingForData - 1
                self.scanData[index + 1] = {
                    replicateInfo = { C_AuctionHouse.GetReplicateItemInfo(index) },
                    itemLink = link,
                    timeLeft = C_AuctionHouse.GetReplicateItemTimeLeft(index),
                }

                if self.waitingForData == 0 then
                    self:EndProcessing()
                end
            end)
        else
            self.waitingForData = self.waitingForData - 1
            self.scanData[index + 1] = {
                replicateInfo = info,
                itemLink = link,
                timeLeft = timeLeft,
            }

            if self.waitingForData == 0 then
                self:EndProcessing()
            end
        end

        i = i + 1
    end

    C_Timer.After(0.01, function()
        self:ProcessBatch(startIndex + stepSize, stepSize, limit)
    end)
end

function AHCCPriceScanMixin:Done()
    AuctionHouseFrame.BrowseResultsFrame:Reset()
    AuctionHouseFrame.BrowseResultsFrame.ItemList:DirtyScrollFrame();
    AHCC:performSearch(true)
end

function AHCCPriceScanMixin:OnHide()
    self:UnregisterForEvents()
    if self.inProgress then
        self.inProgress = false
        self:ResetData()
    end
end

function AHCCPriceScanMixin:OnEvent(event, ...)
    if event == "REPLICATE_ITEM_LIST_UPDATE" then
        FrameUtil.UnregisterFrameForEvents(self, { "REPLICATE_ITEM_LIST_UPDATE" })
        self:CacheScanData()
    elseif event == "AUCTION_HOUSE_CLOSED" then
        self:UnregisterForEvents()
        
        if self.inProgress then
            self.inProgress = false
            self:ResetData()
            self:SetText(L["scan_aborted_ah_closed"])
            self.ScanButton:SetEnabled(true)
        end
    end
end

function AHCCPriceScanMixin:EndProcessing()
    local fixedScanData = {}


    --  AHCC.PriceScan.items = CopyTable(self.browseResults)
    
    -- Remove nil holes for items that have missing item data
    for i = 1, #self.scanData do
        if self.scanData[i] ~= nil then
            table.insert(fixedScanData, self.scanData[i])
        end
    end
    
    -- Get all items we have in our system
    local allItems = AHCCItems:getAll()
    local itemIDMap = {}
    for _, item in ipairs(allItems) do
        itemIDMap[item.itemKey.itemID] = true
    end
    
    -- Process the scan data and update prices only for items we have
    local count = 0
    for _, scanItem in ipairs(fixedScanData) do
        local replicateInfo = scanItem.replicateInfo
        local itemLink = scanItem.itemLink
        
        if itemLink and replicateInfo then
            local itemID = replicateInfo[17]
            local stackSize = replicateInfo[3]
            local buyoutPrice = replicateInfo[10]
            
            -- Only update price if we have this item in our system
            if itemID and stackSize and buyoutPrice and stackSize > 0 and buyoutPrice > 0 and itemIDMap[itemID] then
                local effectivePrice = buyoutPrice / stackSize
                local success = AHCCItems:updatePrice(itemID, effectivePrice)
                if success then 
                    count = count + 1
                end 
            end
        end
    end
    
    AHCC.db.global.lastScan = time()
    self.inProgress = false
    self:ResetData()
    self:UnregisterForEvents()
    
    self:SetText(string.format(L["scan_complete"], count))
    self.ScanButton:SetEnabled(true)
    
    -- Refresh the auction house view
    self:Done()
end
