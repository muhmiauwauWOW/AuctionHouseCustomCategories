local MaxNumAuctionHouseSortTypes = 2


local function AddSortType(searchContext, newSortType)
    if not g_auctionHouseSortsBySearchContext[searchContext] then
        g_auctionHouseSortsBySearchContext[searchContext] = {};
    end

    local sorts = g_auctionHouseSortsBySearchContext[searchContext];
    for i, sortType in ipairs(sorts) do
        if sortType.sortOrder == newSortType.sortOrder then
            if (i == 1) and sortType.reverseSort == newSortType.reverseSort then
                newSortType.reverseSort = not newSortType.reverseSort;
            end

            table.remove(sorts, i);
            break;
        end
    end

    table.insert(sorts, 1, newSortType);

    if #sorts > MaxNumAuctionHouseSortTypes then
        sorts[#sorts] = nil;
    end
end

-- overwrites
hooksecurefunc("AuctionFrameFilters_UpdateCategories", function(categoriesList, forceSelectionIntoView)
    local cdata = categoriesList:GetCategoryData()

    if AHCC.isInCustomCategory and cdata == nil then
        AHCC:Reset()
    end

    if cdata and cdata:HasFlag("AHCC") then
        AHCC.Nav = cdata.AHCC_Nav
        AHCC.isInCustomCategory = true
        AuctionHouseFrame.SearchBar.QualityFrame:Show()
        AuctionHouseFrame.SearchBar.FilterButton:Hide()
        AHCC.viewConfig = cdata.AHCC_config
      
        AHCC:performSearch()
    else
        AHCC.isInCustomCategory = false
        AuctionHouseFrame.SearchBar.QualityFrame:Hide()
        AuctionHouseFrame.SearchBar.FilterButton:Show()
    end
end)


-- overwrites
function AuctionHouseFrame.SearchBar:StartSearch()
    if AHCC.isInCustomCategory then
        AHCC:performSearch()
    else
        local searchString = self.SearchBox:GetSearchString();
        local minLevel, maxLevel = self:GetLevelFilterRange();
        local filtersArray = AuctionHouseFrame.SearchBar.FilterButton:CalculateFiltersArray();
        AuctionHouseFrame:SendBrowseQuery(searchString, minLevel, maxLevel, filtersArray);
    end
end



local AuctionHouseUtil_ConvertCategoryToSearchContext = AuctionHouseUtil.ConvertCategoryToSearchContext
function AuctionHouseUtil.ConvertCategoryToSearchContext(selectedCategoryIndex)
    if selectedCategoryIndex then 
        if AuctionCategories[selectedCategoryIndex].AHCC_Id then 
            return AuctionCategories[selectedCategoryIndex].AHCC_Id + 300
        end
    end
    return AuctionHouseUtil_ConvertCategoryToSearchContext(selectedCategoryIndex)
end



local AuctionHouseFrame_SetSortOrder = AuctionHouseFrame.SetSortOrder
function AuctionHouseFrame:SetSortOrder(searchContext, sortOrder)
    if AHCC.isInCustomCategory then 
        searchContext = AuctionHouseFrame:GetCategorySearchContext();
        local sortType = { sortOrder = sortOrder, reverseSort = false };
        AddSortType(searchContext, sortType);
        AHCC:Sort(sortOrder)
    else -- blizzard org func
        AuctionHouseFrame_SetSortOrder(self, searchContext, sortOrder)
    end
end