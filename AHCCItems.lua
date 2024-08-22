local AHCC = LibStub("AceAddon-3.0"):GetAddon("AHCC")
local L, _ = AHCC:GetLibs()


AHCCItems = {}
AHCCItems.items = {}

function AHCCItems:Init()
    self.prices = AHCC.db.global.prices
end

function AHCCItems:set(data)
    self.items = data
end


function AHCCItems:add(Item)
    tAppendAll(self.items, self:formatToResultLines(Item))
end

function AHCCItems:formatToResultLines(Item)
    local function getResultLine(idx, id, entry)
 
         local minPrice = AHCCItems:getPrice(id)
     
         AHCCItems:setPrice(id, minPrice)
     
     
         local Stat1 = entry.Stat1
          if not entry.Stat1 then 
             if entry.subSubCategory then 
                 Stat1 = entry.subSubCategory
             else
                 Stat1 = entry.subCategory
             end
         end
     
         return {
             itemKey = {
                 itemLevel = 0,
                 itemSuffix = 0,
                 itemID = id,
                 balltePetSpeciesID = 0
             },
             Name = C_Item.GetItemInfo(id),
             Quality = idx,
             containsOwnerItem=false,
             totalQuantity = 1,
             minPrice = minPrice,
             Price = minPrice,
             Stat1 = Stat1,
             Stat2 = entry.Stat2 or 0,
             nav = Item.nav
         }
     
     end
 
 
     local table = {}
     if _.isTable(Item.id) then 
         table = _.map(Item.id, function(item, idx)
          --  _.debug(getResultLine(idx, item, Item))
            return getResultLine(idx, item, Item)
         end)
     else
         table = { getResultLine(0, Item.id, Item) }
     end
 
     return table
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

function AHCCItems:getByNav(nav)
    local filterd =  _.filter(self:get(), function(Item) 
       -- return Item.nav == nav 
        return Item.nav:sub(1, #nav) == nav 
    end)

    return  _.uniq(filterd, function(n) return n.itemKey.itemID end)
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
    AHCC:performSearch()
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


