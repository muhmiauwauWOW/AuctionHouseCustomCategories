local AHCC = LibStub("AceAddon-3.0"):GetAddon("AHCC")
local L, _ = AHCC:GetLibs()


AHCCItems = {}
AHCCItems.items = {}
AHCCItems.prices = {}

-- reset prices
AuctionHouseFrame:HookScript("OnShow" , function()
    AHCCItems.prices = {}
end)


function AHCCItems:Init()
end


function AHCCItems:add(Item)
    tAppendAll(self.items, self:formatToResultLines(Item))
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
    self.prices[id] = price
end

function AHCCItems:getPrice(id)    
    return _.get(self.prices, { id }, -1)
end

function AHCCItems:updatePrice(id, price)
    if not self:getPrice(id) then return end
    self:setPrice(id, price)
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