local AHCC = LibStub("AceAddon-3.0"):GetAddon("AHCC")
local L, _ = AHCC:GetLibs()


AHCCData = {}

function AHCCData:Init()
    self.data = {}
end

function AHCCData:set(data)
    self.data = data
end

function AHCCData:get()
    return self.data or {}
end


function AHCCData:add(dataArg, config)
    if not config then return end

    local data = self:get()
    if config.mode == "insert" and config.nav then 
        if #config.nav == 0 then 
            data = data
        end
        tAppendAll(data, AHCCData:createCategory(dataArg))
    end

    AHCCData:set(data)
end

function AHCCData:getResultLine(idx, id, entry)

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
        nav = { entry.category, entry.subCategory,  entry.subSubCategory }
    }

end


function AHCCData:formatToResultLines(entry)
    local table = {}
    if type(entry.id) == "table" then 
        table = _.map(entry.id, function(item, idx)
            return self:getResultLine(idx, item, entry)
        end)
    else
        table = {self:getResultLine(0, entry.id, entry)}
    end

    return table
end

function AHCCData:prepareCategoryData(categories, config, depth)
    config = config or {}
    depth = depth or 0
    depth = depth + 1

    return _.map(categories, function(categoryEntry, categoryId)
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
            categoryEntry.subCategories = self:prepareCategoryData(categoryEntry.subCategories, conf, depth)
        end

        -- insert Data
        if  categoryEntry.Items then
            categoryEntry.Items = _.map(categoryEntry.Items, function(entry)
                return self:formatToResultLines(entry)
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


function AHCCData:createCategory(Data)
    local categoryEntries = AHCCData:prepareCategoryData(Data)
    return _.map(categoryEntries, function(categoryEntry) 
        return AHCCCategoryList:createCategory(categoryEntry)
    end)
end




AHCC_DATA = {
    OnEnable = function(self)
        AHCCData:add(self.Categories, self.Config)
        self.loaded = true
        AHCC_DATA__checkModules()
    end,
    OnDisable = function(self)
        AHCCData:add(self.Categories, self.Config)
        self.loaded = false
        AHCC_DATA__checkModules()
    end 
}

AHCC_DATA__ticker = nil

function AHCC_DATA__checkModules()
    local modules = AHCC:IterateModules()
    local check = _.every(modules, function(module)
        return module.loaded
    end)

    if AHCC_DATA__ticker then
        AHCC_DATA__ticker:Cancel()
	end

    if check then
        AHCC_DATA__ticker = C_Timer.NewTimer(0.1, function()
            AHCC_DATA__ticker:Cancel()
            AHCCCategoryList:update()
        end)
    end
end
