local AHCC = LibStub("AceAddon-3.0"):GetAddon("AHCC")
local L, _ = AHCC:GetLibs()



--return to BrowseResultsFrame on category select 
local AuctionHouseCategoriesListMixin_OnFilterClicked =  AuctionHouseFrame.CategoriesList.OnFilterClicked
function AuctionHouseFrame.CategoriesList:OnFilterClicked(button, buttonName)
    local displaymode =  _.last(AuctionHouseFrame:GetDisplayMode())

    if displaymode ~= "BrowseResultsFrame" then 
        local check = false
        local selectedCategoryIndex, selectedSubCategoryIndex, selectedSubSubCategoryIndex = self:GetSelectedCategory();
        if ( button.type == "category" ) then
            if ( selectedCategoryIndex ~= button.categoryIndex ) then
                check = true
            end
        elseif ( button.type == "subCategory" ) then
            if ( selectedSubCategoryIndex ~= button.subCategoryIndex ) then
                check = true
            end
        elseif ( button.type ~= "subSubCategory" ) then
            if ( selectedSubSubCategoryIndex == button.subSubCategoryIndex ) then
                check = true
            end
        end

        if AHCC.isInCustomCategory then
            AuctionHouseFrame:SetDisplayMode(AuctionHouseFrameDisplayMode.Buy);
            if check then 
                AuctionHouseCategoriesListMixin_OnFilterClicked(self, button, buttonName)
            end
        else
            AuctionHouseCategoriesListMixin_OnFilterClicked(self, button, buttonName)
            AuctionHouseFrame.SearchBar:StartSearch()

        end
    else
        AuctionHouseCategoriesListMixin_OnFilterClicked(self, button, buttonName)
    end
end



-- overwrites
hooksecurefunc("AuctionFrameFilters_UpdateCategories", function(categoriesList, forceSelectionIntoView)
    local cdata = categoriesList:GetCategoryData()

    if cdata and cdata:HasFlag("AHCC") then
        AHCC.Nav = cdata.AHCC_NAV
        AHCC.isInCustomCategory = true
        AHCCQualitySelectFrame:Show()
        AHCCReplicateButton:check()
        AuctionHouseFrame.SearchBar.FilterButton:Hide()
        -- prevent double execution
        if not forceSelectionIntoView then 
            AuctionHouseFrame.BrowseResultsFrame:Hide()
            AHCCBrowseResultsFrame:Show()
            AHCC:performSearch()
        end
    else
        AHCC.isInCustomCategory = false
        AHCCQualitySelectFrame:Hide()
        AHCCReplicateButton:Hide()
        AHCCBrowseResultsFrame:Hide()
        AuctionHouseFrame.SearchBar.FilterButton:Show()

        if cdata and cdata:HasFlag("WOW_TOKEN_FLAG") then return end
        AuctionHouseFrame.BrowseResultsFrame:Show()
    end
end)



AuctionHouseFrame.CommoditiesBuyFrame.BackButton:HookScript("OnClick" , function()
    if AHCC.isInCustomCategory then
        AuctionHouseFrame.BrowseResultsFrame:Hide()
        AHCCBrowseResultsFrame:Show()
    end
end)


-- overwrites
local AuctionHouseSearchBarMixin_StartSearch = AuctionHouseFrame.SearchBar.StartSearch
function AuctionHouseFrame.SearchBar:StartSearch()
    if AHCC.isInCustomCategory then
        AuctionHouseFrame:SetDisplayMode(AuctionHouseFrameDisplayMode.Buy);
        AHCC:performSearch()
    else
        AuctionHouseSearchBarMixin_StartSearch(self)
    end
end
