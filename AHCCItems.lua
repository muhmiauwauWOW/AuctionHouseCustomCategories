local AHCC = LibStub("AceAddon-3.0"):GetAddon("AHCC")
local L, _ = AHCC:GetLibs()


AHCCItems = {}


function AHCCItems:Init()
    self.items = {}
    self.prices = AHCC.db.global.prices
end

function AHCCItems:set(data)
    self.items = data
end

function AHCCItems:get()
    return self.items or {}
end

function AHCCItems:setPrice(id, price)
    AHCC.db.global.prices[id] = price
end

function AHCCItems:getPrice(id)    
    return AHCC.db.global.prices[id] or 0
end

function AHCCItems:updatePrice(id, price)
    if not self:getPrice(id) then return end
    self:setPrice(id, price)
end

function AHCCItems:add(Items, nav)
    if not nav then return end
    if not _.isTable(nav) then return end
    if not Items then return end

    if _.isTable(Items) then 
        _.forEach(Items, function(entry)
            entry.nav = nav
            tinsert(self.items, entry)
        end)
    else
        Items.nav = nav
        tinsert(self.items, Items)
    end
end


function AHCCItems:getByNav(nav)
    local function arrayEqual(a1, a2)
        for i, v in ipairs(a1) do
            if a1[i] ~= a2[i] then
                return false
            end
        end

        return true
    end

    local filterd = _.filter(self:get(), function(entry)
        return arrayEqual(nav, entry.nav)
    end)

    filterd = _.map(filterd, function(entry)
        local price = AHCCItems:getPrice(entry.itemKey.itemID)
        entry.minPrice = price
        entry.Price = price
        return entry
    end)

    local categoryConfig = AHCCCategoryList:getCategoryConfig(nav)
    if not categoryConfig.allowDuplicates then 
        filterd = _.uniq(filterd, function(n)
            return n.itemKey.itemID
        end)
    end

    return filterd
end



local lastCall = time()

local function OnEvent(self, event, itemKey)
    if lastCall + 1  >= time() then return end
    lastCall = time()

    local itemKey = _.isTable(itemKey) and itemKey or C_AuctionHouse.MakeItemKey(itemKey)

    local priceKey = "buyoutAmount"
    local result = nil

    if event == "COMMODITY_SEARCH_RESULTS_UPDATED" then 
        priceKey = "unitPrice"
        result = C_AuctionHouse.GetCommoditySearchResultInfo(itemKey.itemID, 1)
    else
        result = C_AuctionHouse.GetItemSearchResultInfo(itemKey, 1)
    end

    if not result then return end

    AHCCItems:updatePrice(itemKey.itemID, result[priceKey])

    if AHCCQualitySelectFrame:IsShown() then 
        AHCC:performSearch()
    end
end


local f = CreateFrame("Frame")
f:SetScript("OnEvent", OnEvent);
f:RegisterEvent("COMMODITY_SEARCH_RESULTS_UPDATED");


local f2 = CreateFrame("Frame")
f2:SetScript("OnEvent", OnEvent);
f2:RegisterEvent("ITEM_SEARCH_RESULTS_UPDATED");




local function OnEvent2(self, event, results)
    local results = results or C_AuctionHouse.GetBrowseResults();

    _.forEach(results, function(entry) 
        AHCCItems:updatePrice(entry.itemKey.itemID, entry.minPrice)
    end)
end



local f3 = CreateFrame("Frame")
f3:SetScript("OnEvent", OnEvent2);
f3:RegisterEvent("AUCTION_HOUSE_BROWSE_RESULTS_UPDATED");


local f4 = CreateFrame("Frame")
f4:SetScript("OnEvent", OnEvent2);
f4:RegisterEvent("AUCTION_HOUSE_BROWSE_RESULTS_ADDED");


local function replicateData()
    local auctions = {}
    for i = 0, C_AuctionHouse.GetNumReplicateItems()-1 do
        auctions[i] = {C_AuctionHouse.GetReplicateItemInfo(i)}
        if auctions[i][17] and auctions[i][10] then -- buyoutPrice 
            AHCCItems:updatePrice(auctions[i][17], auctions[i][10])
        end
    end

    AHCC.db.global.lastReplicateDate = GetServerTime()
    print("AHCC: Price updated")
    AHCC.isReplicateRunning = false

end

local function OnEvent3(self, event, results)
    if AHCC.db.global.lastReplicateDate + 900 > GetServerTime() then return end
    replicateData()
end

local f5 = CreateFrame("Frame")
f5:SetScript("OnEvent", OnEvent3);
f5:RegisterEvent("REPLICATE_ITEM_LIST_UPDATE");


