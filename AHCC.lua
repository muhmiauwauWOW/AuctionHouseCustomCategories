AHCC = LibStub("AceAddon-3.0"):NewAddon("AHCC", "AceEvent-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("AHCC")


AHCC.isInCustomCategory = false
AHCC.hasStatsColumn = false
AHCC.nav = {}
AHCC.nav.category = nil
AHCC.nav.subCategory = nil

AHCC.searchResultTable = nil
AHCC.searchButton = nil


function AHCC:OnInitialize()
	AHCC:loadData()
    AHCC:RegisterEvent("ADDON_LOADED", "AddonLoadedEvent")
end 



local getResults = function()
    local filteredResults =  {}
    local results =  AHCC.data.dataStore[AHCC.nav.category][AHCC.nav.subCategory] or {}

    local searchString = AuctionHouseFrame.SearchBar.SearchBox:GetSearchString()
    searchString = string.lower(searchString:gsub("%s+", ""))

    if searchString == "" then 
        filteredResults = results
    else
        for _,entry in pairs(results) do
            if string.find(string.lower(entry.name), searchString,1, true) then
                tinsert(filteredResults, entry)
            end
        end
    end

    return filteredResults
end


function GetBrowseListLayout(owner, itemList, showStats, isSubCategory)
	local function LayoutBrowseListTableBuilder(tableBuilder)
		tableBuilder:SetColumnHeaderOverlap(2);
		tableBuilder:SetHeaderContainer(itemList:GetHeaderContainer());

		local nameColumn = tableBuilder:AddFillColumn(owner, 0, 1.0, 14, 14, AHCC.Config.sortOrder.name, "AuctionHouseTableCellItemDisplayTemplate", restrictQualityToFilter, hideItemLevel);
		nameColumn:GetHeaderFrame():SetText(AUCTION_HOUSE_BROWSE_HEADER_NAME);

        if AHCC.hasStatsColumn then 
            if AHCC.nav.subCategory == 0 then 
                local stat1 = tableBuilder:AddFixedWidthColumn(owner, 0, 120, 14, 14, AHCC.Config.sortOrder.stat1, "AuctionHouseTableCellStat1Template");
                stat1:GetHeaderFrame():SetText(L["TABLE_HEADER_STAT1"]);
            end

            local stat2 = tableBuilder:AddFixedWidthColumn(owner, 0, 120, 14, 14, AHCC.Config.sortOrder.stat2, "AuctionHouseTableCellStat2Template");
            stat2:GetHeaderFrame():SetText(L["TABLE_HEADER_STAT2"]);
        end

		local qualityColumn = tableBuilder:AddFixedWidthColumn(owner, 0, 84, 14, 14, AHCC.Config.sortOrder.quality, "AuctionHouseTableCellQualityTemplate");
        qualityColumn:GetHeaderFrame():SetText(L["TABLE_HEADER_QUALITY"]);
	end

	return LayoutBrowseListTableBuilder;
end


local performSearch = function() 
    local AHF = AuctionHouseFrame
    local CL = AuctionHouseFrame.CategoriesList
    local BRF = AuctionHouseFrame.BrowseResultsFrame

    -- fill results table
    AHCC.searchResultTable = AHCC.isInCustomCategory and getResults() or nil

    if AHCC.searchResultTable then
        BRF:Reset()
        BRF.searchStarted = true;
        BRF.ItemList:SetRefreshCallback(nil)
        BRF.tableBuilderLayoutDirty = true;
        local sortby = AHCC.hasStatsColumn and AHCC.Config.sortOrder.stat2 or AHCC.Config.sortOrder.name
        AHCC:sortResult(BRF, sortby, true)
        BRF.ItemList:SetTableBuilderLayout(GetBrowseListLayout(BRF, BRF.ItemList));
        AHF:SetDisplayMode(AuctionHouseFrameDisplayMode.Buy);
    end
end


function AHCC:AddonLoadedEvent(event, name)
    if name == "Blizzard_AuctionHouseUI" then 

        local categoriesTable = {}

        -- add Custon categories 
        for categoryId, categoryEntry in ipairs(AHCC.data.dataCategories) do 
            local category = CreateFromMixins(AuctionCategoryMixin);
            categoriesTable[categoryId] = category
            category.name = categoryEntry.name;
            category:SetFlag("AHCC");
            if categoryEntry.showStats then 
                category:SetFlag("AHCC_SHOWSTATS");
            end
            category.AHCC_category = categoryEntry.id;
            category.AHCC_subCategory = 0;
            category.subCategories = {}

            for subCategoryId, subCategoryEntry in ipairs(categoryEntry["subCategories"]) do 
                local subCategory = CreateFromMixins(AuctionCategoryMixin);
                category.subCategories[subCategoryId] = subCategory;
                subCategory.name = subCategoryEntry.name;
                subCategory:SetFlag("AHCC");
                subCategory.AHCC_category = categoryEntry.id;
                subCategory.AHCC_subCategory = subCategoryEntry.id;
                if categoryEntry.showStats then 
                    subCategory:SetFlag("AHCC_SHOWSTATS");
                end
            end
        end

        -- move last Categorie up (WOW Token)
        tinsert(categoriesTable, AuctionCategories[#AuctionCategories])
        -- remove it from the copy table
        tremove(AuctionCategories,#AuctionCategories)
        -- append all categories
        tAppendAll(categoriesTable, AuctionCategories)

        AuctionCategories = categoriesTable



        hooksecurefunc("AuctionFrameFilters_UpdateCategories", function(categoriesList, forceSelectionIntoView)
            local cdata = categoriesList:GetCategoryData()
            if cdata and cdata:HasFlag("AHCC") then
                AHCC.nav.category = cdata.AHCC_category
                AHCC.nav.subCategory = cdata.AHCC_subCategory
                AHCC.isInCustomCategory = true
                AuctionHouseFrame.SearchBar.FilterButton:Hide()
                AHCC.hasStatsColumn = cdata:HasFlag("AHCC_SHOWSTATS") and true or false
            else 
                AHCC.isInCustomCategory = false
                AuctionHouseFrame.SearchBar.FilterButton:Show()
            end
        end)


        -- overwrite the start search function 
        function AuctionHouseFrame.SearchBar:StartSearch()
            if AHCC.isInCustomCategory then
                performSearch()
            else
                local searchString = self.SearchBox:GetSearchString();
                local minLevel, maxLevel = self:GetLevelFilterRange();
                local filtersArray = AuctionHouseFrame.SearchBar.FilterButton:CalculateFiltersArray();
                AuctionHouseFrame:SendBrowseQuery(searchString, minLevel, maxLevel, filtersArray);
            end
            
        end

        AHCC:initSort()
    end
end