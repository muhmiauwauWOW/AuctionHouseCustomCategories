local AHCC = LibStub("AceAddon-3.0"):GetAddon("AHCC")
local L, _ = AHCC:GetLibs()


local getResultLine = function(idx, id, entry)

    local minPrice = 1
    if Auctionator then 
        minPrice = Auctionator.API.v1.GetAuctionPriceByItemID("AHCC", id)
    end

    local stat1 = entry.stat1
     if not entry.stat1 then 
        if entry.subSubCategory then 
            stat1 = entry.subSubCategory
        else
            stat1 = entry.subCategory
        end
    end

    return {
        itemKey = {
            itemLevel = 0,
            itemSuffix = 0,
            itemID = id,
            balltePetSpeciesID = 0
        },
        Name = GetItemInfo(id),
        quality = idx,
        containsOwnerItem=false,
        totalQuantity = 1,
        minPrice = minPrice,
        Price = minPrice,
        stat1 = stat1,
        stat2 = entry.stat2 or 0,
        category = entry.category,
        subCategory = entry.subCategory,
        subSubCategory = entry.subSubCategory,
        nav = { entry.category, entry.subCategory,  entry.subSubCategory }
    }

end



local formatToResultLines = function(entry)
    local table = {}
    if type(entry.id) == "table" then 
        table = _.map(entry.id, function(item, idx)
            return getResultLine(idx, item, entry)
        end)
    else
        table = {getResultLine(0, entry.id, entry)}
    end

    return table
end

local function arrayEqual(a1, a2)
    -- Check length, or else the loop isn't valid.
    if #a1 ~= #a2 then
        return false
    end

    -- Check each element.
    for i, v in ipairs(a1) do
        if a1[i] ~= a2[i] then
        return false
        end
    end

    -- We've checked everything.
    return true
end

local function enrichDataCategories(categories, config, nav, depth)
    config = config or {}
    nav = nav or {}
    depth = depth or 0
    depth = depth + 1


    return _.map(categories, function(categoryEntry, categoryId)

        -- nav
        categoryEntry.nav = {unpack(nav)}
        categoryEntry.nav[depth] = categoryEntry.id


        -- add sortsID
        if depth == 1 then 
            categoryEntry.sortsID = categoryId + 300
        end

        --config
        categoryEntry.config = categoryEntry.config or {}
        _.forEach(config, function(value, key)
            if not categoryEntry.config[key] then 
                categoryEntry.config[key] = value
            end
        end)
    
        if categoryEntry.subCategories then
            local conf = categoryEntry.config or config
            categoryEntry.subCategories = enrichDataCategories(categoryEntry.subCategories, conf, categoryEntry.nav, depth)
        end

        -- insert Data
        if  categoryEntry.Items then
            categoryEntry.Items = _.map(categoryEntry.Items, function(entry)
                entry.category = categoryEntry.nav[1]
                entry.subCategory = categoryEntry.nav[2]
                entry.subSubCategory = categoryEntry.nav[2]
                return formatToResultLines(entry)
            end)
            categoryEntry.Items = _.flatten(categoryEntry.Items)
        end

        local cols = {"Name"}

        if Auctionator then 
            cols = {"Price", "Name"}
        end

        if categoryEntry.config.columns then 
            tAppendAll(cols, categoryEntry.config.columns)
        else
            tinsert(cols, "quality")
        end

        categoryEntry.config.columns = cols

        return categoryEntry
    end)
end

function AHCC:prepareCategoryData(categoryData)
    return enrichDataCategories(categoryData)
end

function AHCC:addItemstoDataStore(Items)
    tAppendAll(AHCC.data.dataStore, Items)
end




AHCC_DATA = {
    OnEnable = function(self)
        AHCC:addCategories(self.Categories)
        AHCC:updateCategoryData()
    end 
}
