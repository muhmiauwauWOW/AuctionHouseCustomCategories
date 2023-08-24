local AHCC = LibStub("AceAddon-3.0"):GetAddon("AHCC")
local L, _ = AHCC:GetLibs()


AHCCCategoryList = {}

function AHCCCategoryList:Init()
    self.AuctionCategories =  _.union({},{_.last(AuctionCategories)}, _.initial(AuctionCategories))
    self.categoryList = self:createCategorys(AHCCData:get())
end

function AHCCCategoryList:update()
    AHCCItems:set({})

    local cData =   self:updateNav(self.categoryList, {}, 0)
    AuctionCategories = _.union(cData, self.AuctionCategories)
    AuctionFrameFilters_Update(AuctionHouseFrame.CategoriesList)
end

function AHCCCategoryList:updateNav(categories, nav, depth)
    depth = depth + 1

    return  _.map(categories, function(category, categoryId)
        category.AHCC_Nav = {unpack(nav)}
        category.AHCC_Nav[depth] = categoryId
        
        AHCCItems:add(category.Items, category.AHCC_Nav)

        if category.subCategories then
            self:updateNav(category.subCategories, category.AHCC_Nav, depth)
        end
        return category
    end)
end

function AHCCCategoryList:createCategorys(Data)
    local categoryEntries = AHCCData:prepareCategoryData(Data)
    return _.map(categoryEntries, function(categoryEntry) 
        return self:createCategory(categoryEntry)
    end)
end

function AHCCCategoryList:createCategory(categoryEntry, categoryId)
    local category = CreateFromMixins(AHCCAuctionCategoryMixin);
    category:SetFlag("AHCC");
    category.name = categoryEntry.name
    category.AHCC_Id = categoryId
    category.AHCC_config = categoryEntry.config
    category.Items = categoryEntry.Items or {}

    if categoryEntry.sortsID then 
        g_auctionHouseSortsBySearchContext[categoryEntry.sortsID] = g_auctionHouseSortsBySearchContext[categoryEntry.sortsID] or {{ sortOrder = Enum.AuctionHouseSortOrder.Name, reverseSort = false }}
    end

    if categoryEntry.subCategories then
        category.subCategories = {}
        _.forEach(categoryEntry["subCategories"], function(subCategoryEntry)
            category.subCategories[#category.subCategories + 1] = self:createCategory(subCategoryEntry, subCategoryEntry.id)
        end)
    end
    return category
end



