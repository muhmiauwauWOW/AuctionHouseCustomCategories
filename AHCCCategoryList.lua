local AHCC = LibStub("AceAddon-3.0"):GetAddon("AHCC")
local L, _ = AHCC:GetLibs()


AHCCCategoryList = {}

function AHCCCategoryList:Init()
    self.AuctionCategories =  _.union({},{_.last(AuctionCategories)}, _.initial(AuctionCategories))

    self.categoryList = self:createCategorys("root")
end

function AHCCCategoryList:update()
    AuctionCategories = _.union(self.categoryList, self.AuctionCategories)
    AuctionFrameFilters_Update(AuctionHouseFrame.CategoriesList)
end

function AHCCCategoryList:createCategorys(parent)
    local cats = _.filter(AHCCCategory:get(), function(entry) return entry.parent == parent end)
    return _.map(cats, function(entry)
        local cat = self:createCategory(entry)
        cat.subCategories = self:createCategorys(entry.id)
        return cat
    end)
end

function AHCCCategoryList:createCategory(categoryEntry)
    local category = CreateFromMixins(AuctionCategoryMixin);
    category:SetFlag("AHCC");
    category.name = categoryEntry.name
    category.AHCC_NAV = categoryEntry.id
    
    return category
end