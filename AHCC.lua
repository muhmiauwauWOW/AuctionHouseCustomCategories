AHCC = LibStub("AceAddon-3.0"):NewAddon("AHCC", "AceEvent-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("AHCC")
local _ = LibStub("Lodash"):Get()

function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end



AHCC.viewConfig = {}
AHCC.Nav = {}

AHCC.searchResultTable = nil
AHCC.searchButton = nil


function AHCC:OnInitialize()
   -- AHCC:initOptions()
end 

function AHCC:OnEnable()
   
    AHCC:RegisterEvent("ADDON_LOADED", "AddonLoadedEvent")
end


local getResults = function()
    local searchString = AuctionHouseFrame.SearchBar.SearchBox:GetSearchString()
    searchString = string.lower(searchString:gsub("%s+", ""))
  

    if not AHCC.Nav[1] then 
        return 
    end

    local results = _.filter(AHCC.data.dataStore, function(entry)
        if #AHCC.Nav == 1 then 
            return entry.category == AHCC.Nav[1]
        elseif #AHCC.Nav == 2 then 
            return entry.category == AHCC.Nav[1] and  entry.subCategory == AHCC.Nav[2]
        elseif #AHCC.Nav == 3 and entry.subSubCategory then 
            return entry.category == AHCC.Nav[1] and  entry.subCategory == AHCC.Nav[2] and entry.subSubCategory == AHCC.Nav[3]
        else 
            return false
        end
    end)


    if (searchString ~= "") then 
        results = _.filter(results, function(filterEntry)
            return string.find(string.lower(filterEntry.name), searchString,1, true)
        end)
    end

    return _.filter(results, function(entry)
        return (entry.quality == 0) and true or AHCC.Config.ProfessionsQualityActive[entry.quality] 
    end)
end

function AHCC:AddFixedWidthColumn(owner, tableBuilder, name, width, key)
    local column = tableBuilder:AddFixedWidthColumn(owner, 0, width, 14, 14, AHCC.Config.sortOrder[key], "AuctionHouseTableCell"..firstToUpper(key).."Template");
    column:GetHeaderFrame():SetText(name);
end


function GetBrowseListLayout(owner, itemList)
	local function LayoutBrowseListTableBuilder(tableBuilder)
		tableBuilder:SetColumnHeaderOverlap(2);
		tableBuilder:SetHeaderContainer(itemList:GetHeaderContainer());

        if Auctionator then 
            tableBuilder:AddFixedWidthColumn(owner, PRICE_DISPLAY_PADDING, 146, 0, 14, Enum.AuctionHouseSortOrder.Price, "AuctionHouseTableCellMinPriceTemplate");
        end

        if _.find(AHCC.viewConfig.columns, function(column) return column == "name" end) then
            local nameColumn = tableBuilder:AddFillColumn(owner, 0, 1.0, 14, 14, AHCC.Config.sortOrder.name, "AuctionHouseTableCellItemDisplayTemplate");
            nameColumn:GetHeaderFrame():SetText(AUCTION_HOUSE_BROWSE_HEADER_NAME);
        end
             
        if _.find(AHCC.viewConfig.columns, function(column) return column == "stat1" end) then
            AHCC:AddFixedWidthColumn(owner, tableBuilder, L["TABLE_HEADER_STAT1"], 120, "stat1")
        end
        
        if _.find(AHCC.viewConfig.columns, function(column) return column == "stat2" end) then
            AHCC:AddFixedWidthColumn(owner, tableBuilder, L["TABLE_HEADER_STAT2"], 120, "stat2")
        end
    
        if _.find(AHCC.viewConfig.columns, function(column) return column == "quality" end) then
            AHCC:AddFixedWidthColumn(owner, tableBuilder, L["TABLE_HEADER_QUALITY"], 84, "quality")
        end
	end

	return LayoutBrowseListTableBuilder;
end

local performSearch = function()
    local AHF = AuctionHouseFrame
    local CL = AuctionHouseFrame.CategoriesList
    local BRF = AuctionHouseFrame.BrowseResultsFrame

    AHCC.searchResultTable = AHCC.isInCustomCategory and getResults() or nil

    if AHCC.searchResultTable then
        BRF:Reset()
        BRF.searchStarted = true;
        BRF.ItemList:SetRefreshCallback(nil)
        BRF.tableBuilderLayoutDirty = true;

        local sortby =  AHCC.Config.sortOrder.name

        if _.find(AHCC.viewConfig.columns, function(column) return  column == "stat2" end) then
            sortby = AHCC.Config.sortOrder.stat2
        end

        if _.find(AHCC.viewConfig.columns, function(column) return  column == "stat1" end) then
            sortby = AHCC.Config.sortOrder.stat1
        end

        AHCC:sortResult(BRF, sortby, true)
        BRF.ItemList:SetTableBuilderLayout(GetBrowseListLayout(BRF, BRF.ItemList));
        AHF:SetDisplayMode(AuctionHouseFrameDisplayMode.Buy);
    end
end


function AHCC:performSearch()
    local AHF = AuctionHouseFrame
    local CL = AuctionHouseFrame.CategoriesList
    local BRF = AuctionHouseFrame.BrowseResultsFrame
    performSearch()
    BRF.tableBuilderLayoutDirty = true;
end

function AHCC:Reset()
    local BRF = AuctionHouseFrame.BrowseResultsFrame
    BRF:Reset()
end


function AHCC:AddonLoadedEvent(event, name)
    if name == "Blizzard_AuctionHouseUI" then 
        AHCC:loadData()

        AuctionHouseFrame.SearchBar.QualityFrame = CreateFrame ("Frame", nil, AuctionHouseFrame.SearchBar, "AHCCQualitySelectFrameTemplate")




        local AHCCAuctionCategoryMixin = CreateFromMixins(AuctionCategoryMixin);


        function AHCCAuctionCategoryMixin:addIds(nav, parent)
            tinsert(nav, parent.AHCC_Id)
            return (parent.AHCC_parent) and  self:addIds(nav,parent.AHCC_parent) or nav
        end

        function AHCCAuctionCategoryMixin:AddNav(first)
            local nav = { self.AHCC_Id }

            if not first then 
                nav = self:addIds(nav, self.AHCC_parent)
            end

            nav =  _.reverse(nav)

            self.AHCC_Nav = nav
        end

        
        function AHCCAuctionCategoryMixin:SetConfig(config, first)
            self:SetFlag("AHCC");
            local cfg = config or {}

            if not first and #cfg == 0 then
                if self.AHCC_parent then 
                    cfg = self.AHCC_parent.AHCC_config or {}
                end
            end

            if not cfg.columns then 
                cfg.columns = {"name", "quality"}
            else
                local cols = {"name"}
                tAppendAll(cols, cfg.columns)
                cfg.columns = cols
            end

            self.AHCC_config = cfg
        end



        local function createCategory(parent, categoryEntry, categoryId, first)
            local category = CreateFromMixins(AHCCAuctionCategoryMixin);
            category.name = categoryEntry.name
            category:SetConfig(categoryEntry.config, first);

            if first then 
                parent[categoryId] = category
            else 
                parent.subCategories[categoryId] = category
            end

            category.AHCC_Id = categoryId
            category.AHCC_parent = parent
            category:AddNav(first)

            if categoryEntry.subCategories then
                category.subCategories = {}
                _.forEach(categoryEntry["subCategories"], function(subCategoryEntry, subCategoryId) 
                    createCategory(category, subCategoryEntry, subCategoryId)
                end)
            end
        end


        local categoriesTable = {}
        _.forEach(AHCC.data.dataCategories, function(categoryEntry, categoryId) 
            createCategory(categoriesTable, categoryEntry, categoryId, true)
        end)

        AuctionCategories = _.union(categoriesTable, {_.last(AuctionCategories)}, _.initial(AuctionCategories))


        hooksecurefunc("AuctionFrameFilters_UpdateCategories", function(categoriesList, forceSelectionIntoView)
            local cdata = categoriesList:GetCategoryData()
            if cdata and cdata:HasFlag("AHCC") then
                AHCC.Nav = cdata.AHCC_Nav
                AHCC.isInCustomCategory = true
                AuctionHouseFrame.SearchBar.QualityFrame:Show()
                AuctionHouseFrame.SearchBar.FilterButton:Hide()
                AHCC.viewConfig = cdata.AHCC_config
              
                performSearch()
            else
                AHCC.isInCustomCategory = false
                AuctionHouseFrame.SearchBar.QualityFrame:Hide()
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