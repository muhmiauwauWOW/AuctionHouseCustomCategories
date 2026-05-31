local AHCC = LibStub("AceAddon-3.0"):GetAddon("AHCC")
local L, _ = AHCC:GetLibs()


AHCCItems = {}
AHCCItems.items = {}
AHCCItems.priceProviders = {}

-- AuctionHouseFrame:HookScript("OnShow" , function()
--     AHCCItems.prices =  AHCC.db.global.prices
-- end)



function AHCCItems:Init()
   
end


function AHCCItems:add(Item)
    tAppendAll(self.items, self:formatToResultLines(Item))
end

function AHCCItems:remove(Item)
    for index, value in ipairs(self.items) do
        if value.itemKey.itemID == Item.id and value.nav == Item.nav then
            table.remove(self.items, index)
        end
    end
end


function AHCCItems:initPrices()
     if _.size(self.items) == 0 then return end
    local newItems = {}
    _.forEach(self.items, function(entry)
        newItems[entry.itemKey.itemID] =  self:getPrice(entry.itemKey.itemID)
    end)

    if _.size(newItems) == 0 then return end
    AHCC.db.global.prices = newItems
end

function AHCCItems:formatToResultLines(Item)
    local function getResultLine(idx, id, entry)
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
            containsOwnerItem = false,
            totalQuantity = 1,
            minPrice = -1,
            Price = -1,
            Stat1 = Stat1,
            Stat2 = entry.Stat2 or 0,
            nav = Item.nav
        }
     
     end
 
 
     local table = {}
     if _.isTable(Item.id) then 
         table = _.map(Item.id, function(item, idx)
            return getResultLine(idx, item, Item)
         end)
     else
         table = { getResultLine(0, Item.id, Item) }
     end
 
     return table
 end


 
function AHCCItems:set(id, Item)
    if not id then return  end
    local find = _.find(self.items, function(entry, idx)
        return entry.itemKey.itemID == id
    end)

    if find then
        find = Item
    end
end

function AHCCItems:get(id)
    if not id then 
        return _.map(self.items, function(entry)
            entry.Price = self:getPrice(entry.itemKey.itemID)
            entry.minPrice = entry.Price

            return entry
        end)
    end
    return _.find(self.items, function(entry, idx)
        entry.Price = self:getPrice(id)  
        entry.minPrice = entry.Price
        return entry.itemKey.itemID == id
    end)
end

function AHCCItems:setPrice(id, price)
    AHCC.db.global.prices[id] = price
end

function AHCCItems:registerPriceProvider(name, func)
    if not name or type(func) ~= "function" then return false end
    table.insert(self.priceProviders, {name = name, func = func})
    return true
end

function AHCCItems:getPrice(id)
    -- Prefer provider prices first, then fall back to stored prices
    for _, p in ipairs(self.priceProviders or {}) do
        local ok, pprice = pcall(p.func, id)
        if ok and pprice and type(pprice) == "number" and pprice > 0 then
            return pprice
        end
    end

    local stored = _.get(AHCC.db.global.prices, { id })
    if stored and stored ~= -1 then return stored end

    return -1
end

function AHCCItems:checkPrice(id)    
    return _.get(AHCC.db.global.prices, { id }, false)
end


function AHCCItems:updatePrice(id, price)
    if not self:checkPrice(id) then return false end
    self:setPrice(id, price)
    return true
end

function AHCCItems:getByNav(nav)
    local filterd =  _.filter(self:get(), function(Item) 
        return Item.nav:sub(1, #nav) == nav 
    end)

    return  _.uniq(filterd, function(n) return n.itemKey.itemID end)
end

function AHCCItems:getAll()
    return _.uniq(self:get(), function(n) return n.itemKey.itemID end)
end