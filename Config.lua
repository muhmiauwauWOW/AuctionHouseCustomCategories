AHCC = LibStub("AceAddon-3.0"):NewAddon("AHCC", "AceEvent-3.0")

local L = LibStub("AceLocale-3.0"):GetLocale("AHCC")


AHCC.searchResultTable = nil
AHCC.searchButton = nil


function AHCC:OnInitialize()
	AHCC:loadData()
    AHCC:RegisterEvent("ADDON_LOADED", "AddonLoadedEvent")
end 


local findAllinTable =  function(t, search)
    local newTable = {}
    local c = 0
    for sk,sv in pairs(search) do 
        c = c + 1
    end

    for k,v in pairs(t) do
        local hit = 0;
        for sk,sv in pairs(search) do
            if (v[sk] == sv) then 
                hit = hit + 1
            end
        end
        if hit == c then
            tAppendAll(newTable, v["id"])
        end
    end
    return newTable
end



local getResults = function(c, s)

    local resultTable = nil 
    if AHCC.data.resultsItems and AHCC.data.resultsItems[c] and AHCC.data.resultsItems[c][s] then 
        resultTable = AHCC.data.resultsItems[c][s]
    end

    if resultTable == nil then
        AHCC.data.resultsItems[c] = AHCC.data.resultsItems[c] or {}

        local r = {}
        if s > 0  then 
            r = findAllinTable(AHCC.data.dataItems, {
                ["category"] = c,
                ["subCategory"] = s
            })
        else
            r = findAllinTable(AHCC.data.dataItems, {
                ["category"] = c,
            })
        end

        AHCC.data.resultsItems[c][s] = r
        resultTable =  AHCC.data.resultsItems[c][s]
    end


    return resultTable
end




AuctionHouseTableCellQualityMixin = CreateFromMixins(TableBuilderCellMixin);

function AuctionHouseTableCellQualityMixin:Init(owner)
	self.owner = owner;
end

function AuctionHouseTableCellQualityMixin:GetOwner()
	return self.owner;
end

function AuctionHouseTableCellQualityMixin:GetAuctionHouseFrame()
	return self:GetOwner():GetAuctionHouseFrame();
end

function AuctionHouseTableCellQualityMixin:Populate(rowData, dataIndex)
    local noneAvailable = self.rowData.totalQuantity == 0;
    self.Text:SetFontObject(noneAvailable and PriceFontGray or PriceFontWhite);
    local iconTable = {
        "Professions-Icon-Quality-Tier1-Small",
        "Professions-Icon-Quality-Tier2-Small",
        "Professions-Icon-Quality-Tier3-Small"
    }

    if iconTable[rowData.quality] then 
        local icon =  CreateAtlasMarkupWithAtlasSize(iconTable[rowData.quality], 0,0,nil,nil,nil,0.6)
        self.Text:SetText(icon);
    end
end




function GetBrowseListLayout(owner, itemList, extraInfoColumnText)
	local function LayoutBrowseListTableBuilder(tableBuilder)
		tableBuilder:SetColumnHeaderOverlap(1);
		tableBuilder:SetHeaderContainer(itemList:GetHeaderContainer());

		local restrictQualityToFilter = true;
		local hideItemLevel = extraInfoColumnText ~= nil;
		local nameColumn = tableBuilder:AddFillColumn(owner, 0, 1.0, 14, 14, 98, "AuctionHouseTableCellItemDisplayTemplate", restrictQualityToFilter, hideItemLevel);
		nameColumn:GetHeaderFrame():SetText(AUCTION_HOUSE_BROWSE_HEADER_NAME);

		local qualityColumn = tableBuilder:AddFixedWidthColumn(owner, 0, 84, 14, 14, 99, "AuctionHouseTableCellQualityTemplate");
        qualityColumn:GetHeaderFrame():SetText("Quality");
	end

	return LayoutBrowseListTableBuilder;
end



local performSearch = function(self, button) 

    local cdata = AuctionHouseFrame.CategoriesList:GetCategoryData()
    if cdata and cdata:HasFlag("OSAB_CATEGORY") then
        AHCC.searchResultTable = getResults(cdata.OSAB_category, 0)
    elseif cdata and cdata:HasFlag("OSAB_SUBCATEGORY") then
        AHCC.searchResultTable = getResults(cdata.OSAB_category, cdata.OSAB_subCategory)
    else 
        AHCC.searchResultTable = nil
    end

    if AHCC.searchResultTable then

        AuctionHouseFrame.BrowseResultsFrame:Reset()
        AuctionHouseFrame.BrowseResultsFrame.ItemList:SetTableBuilderLayout(GetBrowseListLayout(AuctionHouseFrame.BrowseResultsFrame, AuctionHouseFrame.BrowseResultsFrame.ItemList, nil));
        AuctionHouseFrame.BrowseResultsFrame.searchStarted = true;
        AuctionHouseFrame.BrowseResultsFrame.ItemList:SetRefreshCallback(nil)
        AuctionHouseFrame.BrowseResultsFrame.tableBuilderLayoutDirty = true;
        AHCC:sortResult(AuctionHouseFrame, 98, true)    

        AuctionHouseFrame:SetDisplayMode(AuctionHouseFrameDisplayMode.Buy);
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
            categoriesTable[categoryId]:SetFlag("OSAB_CATEGORY");
            categoriesTable[categoryId].OSAB_category = category["id"];
            for subCategoryId, subCategory in ipairs(category["subCategories"]) do 
                local subcat = categoriesTable[categoryId]:CreateNamedSubCategory(subCategory["name"]);
                subcat:SetFlag("OSAB_SUBCATEGORY");
                subcat.OSAB_category= category["id"];
                subcat.OSAB_subCategory = subCategory["id"];
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
            if cdata and (cdata:HasFlag("OSAB_CATEGORY") or cdata:HasFlag("OSAB_SUBCATEGORY")) then
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






