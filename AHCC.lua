AHCC = LibStub("AceAddon-3.0"):NewAddon("AHCC", "AceEvent-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("AHCC")



AHCC.searchResultTable = nil
AHCC.searchButton = nil


function AHCC:OnInitialize()
	AHCC:loadData()
    AHCC:RegisterEvent("ADDON_LOADED", "AddonLoadedEvent")
end 



local getResults = function(c, s)
    return AHCC.data.dataStore[c][s] or {}
end


function GetBrowseListLayout(owner, itemList, showStats, isSubCategory)
	local function LayoutBrowseListTableBuilder(tableBuilder)
		tableBuilder:SetColumnHeaderOverlap(2);
		tableBuilder:SetHeaderContainer(itemList:GetHeaderContainer());

		local nameColumn = tableBuilder:AddFillColumn(owner, 0, 1.0, 14, 14, AHCC.Config.sortOrder.name, "AuctionHouseTableCellItemDisplayTemplate", restrictQualityToFilter, hideItemLevel);
		nameColumn:GetHeaderFrame():SetText(AUCTION_HOUSE_BROWSE_HEADER_NAME);

        if showStats then 
            if not isSubCategory then 
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



local performSearch = function(self, button) 

    local AHF = AuctionHouseFrame
    local CL = AuctionHouseFrame.CategoriesList
    local BRF = AuctionHouseFrame.BrowseResultsFrame

    local cdata = CL:GetCategoryData()
    if cdata and cdata:HasFlag("AHCC_CATEGORY") then
        AHCC.searchResultTable = getResults(cdata.AHCC_category, 0)
    elseif cdata and cdata:HasFlag("AHCC_SUBCATEGORY") then
        AHCC.searchResultTable = getResults(cdata.AHCC_category, cdata.AHCC_subCategory)
    else
        AHCC.searchResultTable = nil
    end


    if AHCC.searchResultTable then
        BRF:Reset()
        BRF.searchStarted = true;
        BRF.ItemList:SetRefreshCallback(nil)
        BRF.tableBuilderLayoutDirty = true;

        local sortby = cdata:HasFlag("AHCC_SHOWSTATS") and AHCC.Config.sortOrder.stat2 or AHCC.Config.sortOrder.name
        AHCC:sortResult(BRF, sortby, true)   
        BRF.ItemList:SetTableBuilderLayout(GetBrowseListLayout(BRF, BRF.ItemList, cdata:HasFlag("AHCC_SHOWSTATS"),  cdata.AHCC_subCategory));
       
        AHF:SetDisplayMode(AuctionHouseFrameDisplayMode.Buy);
    end
end





function AHCC:AddonLoadedEvent(event, name)
    if name == "Blizzard_AuctionHouseUI" then 


        AHCC.searchButton = CreateFrame("Button", nil, AuctionHouseFrame, "UIPanelButtonTemplate")
        AHCC.searchButton:SetPoint("RIGHT", AuctionHouseFrame.SearchBar ,"RIGHT" ,0, 0)
        AHCC.searchButton:SetFrameStrata("HIGH")
        AHCC.searchButton:SetSize(132, 22)
        AHCC.searchButton:SetText(AUCTION_HOUSE_SEARCH_BUTTON)
        AHCC.searchButton:SetScript("OnClick", performSearch)

        local categoriesTable = {}
        for categoryId, category in ipairs(AHCC.data.dataCategories) do 
            categoriesTable[categoryId] = AuctionFrame_CreateCategory(category["name"])
            categoriesTable[categoryId]:SetFlag("AHCC_CATEGORY");
            if category.showStats then 
                categoriesTable[categoryId]:SetFlag("AHCC_SHOWSTATS");
            end
            categoriesTable[categoryId].AHCC_category = category["id"];
            for subCategoryId, subCategory in ipairs(category["subCategories"]) do 
                local subcat = categoriesTable[categoryId]:CreateNamedSubCategory(subCategory["name"]);
                subcat:SetFlag("AHCC_SUBCATEGORY");
                subcat.AHCC_category= category["id"];
                subcat.AHCC_subCategory = subCategory["id"];
                if category.showStats then 
                    subcat:SetFlag("AHCC_SHOWSTATS");
                end
            end

            -- remove entry from AuctionCategories
            table.remove(AuctionCategories, #AuctionCategories)
        end

        -- move WOW token up
        for catId, cat in ipairs(AuctionCategories) do 
            if cat:HasFlag("WOW_TOKEN_FLAG") then 
                tinsert(categoriesTable,cat)
            end        
        end

         -- append blizzard auctiuon categories
        for catId, cat in ipairs(AuctionCategories) do 
            if not cat:HasFlag("WOW_TOKEN_FLAG") then 
                tinsert(categoriesTable,cat)
            end        
        end

        AuctionCategories = categoriesTable


        hooksecurefunc("AuctionFrameFilters_UpdateCategories", function(categoriesList, forceSelectionIntoView)
            local cdata = categoriesList:GetCategoryData()
            if cdata and (cdata:HasFlag("AHCC_CATEGORY") or cdata:HasFlag("AHCC_SUBCATEGORY")) then
                AuctionHouseFrame.SearchBar:Hide()
                AHCC.searchButton:Show()
            else 
                AHCC.searchButton:Hide()
                AuctionHouseFrame.SearchBar:Show()
            end
        end)

        AHCC:initSort()
    end
end