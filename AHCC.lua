AHCC = LibStub("AceAddon-3.0"):NewAddon("AHCC")
local L = LibStub("AceLocale-3.0"):GetLocale("AHCC")
local _ = LibStub("Lodash"):Get()

function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end


AHCC.viewConfig = {}
AHCC.Nav = {}

AHCC.searchResultTable = nil
AHCC.searchButton = nil


function AHCC:GetLibs()
    return L, _
end 


function AHCC:OnInitialize()
    AHCC:loadData()
end 

function AHCC:OnEnable()    
    AuctionHouseFrame.SearchBar.QualityFrame = CreateFrame ("Frame", nil, AuctionHouseFrame.SearchBar, "AHCCQualitySelectFrameTemplate")

    local categoriesTable = {}
    _.forEach(AHCC.data.dataCategories, function(categoryEntry, categoryId) 
        self:createCategory(categoriesTable, categoryEntry, categoryId, true)
    end)

    AuctionCategories = _.union(categoriesTable, {_.last(AuctionCategories)}, _.initial(AuctionCategories))
end

function AHCC:createCategory(parent, categoryEntry, categoryId, first)
    local category = CreateFromMixins(AHCCAuctionCategoryMixin);
    category:SetConfig(categoryEntry.config, first);
    
    if first then 
        parent[categoryId] = category
        g_auctionHouseSortsBySearchContext[categoryId + 300] = g_auctionHouseSortsBySearchContext[categoryId + 300] or {{ sortOrder = Enum.AuctionHouseSortOrder.Name, reverseSort = false }}
    else 
        parent.subCategories[categoryId] = category
    end

    category.name = categoryEntry.name
    category.AHCC_Id = categoryId
    category.AHCC_parent = parent
    category:AddNav(first)

    if categoryEntry.subCategories then
        category.subCategories = {}
        _.forEach(categoryEntry["subCategories"], function(subCategoryEntry, subCategoryId) 
            self:createCategory(category, subCategoryEntry, subCategoryId)
        end)
    end
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
            return string.find(string.lower(filterEntry.Name), searchString,1, true)
        end)
    end

    return _.filter(results, function(entry)
        return (entry.quality == 0) and true or AHCC.Config.ProfessionsQualityActive[entry.quality] 
    end)
end

function AHCC:AddFixedWidthColumn(AHCC, owner, tableBuilder, name, width, key)
        local column = tableBuilder:AddFixedWidthColumn(owner, 0, width, 14, 14, Enum.AuctionHouseSortOrder[key], "AuctionHouseTableCell"..firstToUpper(key).."Template");
        column:GetHeaderFrame():SetText(name);
end




function GetBrowseListLayout(AHCC, owner, itemList)
	local function LayoutBrowseListTableBuilder(tableBuilder)
		tableBuilder:SetColumnHeaderOverlap(2);
		tableBuilder:SetHeaderContainer(itemList:GetHeaderContainer());

        _.forEach(AHCC.viewConfig.columns, function(colName)
            if colName == "Price" then 
                tableBuilder:AddFixedWidthColumn(owner, PRICE_DISPLAY_PADDING, 146, 0, 14, Enum.AuctionHouseSortOrder.Price , "AuctionHouseTableCellMinPriceTemplate");
            elseif colName == "Name" then 
                local nameColumn = tableBuilder:AddFillColumn(owner, 0, 1.0, 14, 14, Enum.AuctionHouseSortOrder.Name, "AuctionHouseTableCellItemDisplayTemplate");
                nameColumn:GetHeaderFrame():SetText(AUCTION_HOUSE_BROWSE_HEADER_NAME);
            else
                AHCC:AddFixedWidthColumn(AHCC, owner, tableBuilder, AHCC.Config.TableColums[colName].name, AHCC.Config.TableColums[colName].size, colName)
            end
        end)
	end

	return LayoutBrowseListTableBuilder;
end


function AHCC:performSearch()
    local BRF = AuctionHouseFrame.BrowseResultsFrame

    AHCC.searchResultTable = AHCC.isInCustomCategory and getResults() or nil

    if AHCC.searchResultTable then
        AHCC:Reset()
        BRF.searchStarted = true;
        BRF.ItemList:SetRefreshCallback(nil)
        BRF.ItemList:SetTableBuilderLayout(GetBrowseListLayout(AHCC, BRF, BRF.ItemList));
        BRF.tableBuilderLayoutDirty = true;
        BRF.browseResults = AHCC.searchResultTable;
        AHCC:Sort()
    end
end

function AHCC:Reset()
    local BRF = AuctionHouseFrame.BrowseResultsFrame
    BRF:Reset()
    BRF.headers = {}
    BRF.browseResults = {}
    BRF.ItemList:DirtyScrollFrame();
end

function AHCC:Sort(sortOrder)
    local BRF = AuctionHouseFrame.BrowseResultsFrame
    
    local searchContext = AuctionHouseFrame:GetCategorySearchContext();
    local sorts = AuctionHouseFrame:GetSortsForContext(searchContext)

    if #sorts == 1 then 
        sorts[2] = sorts[1]
    end

    local function getKey(idx)
        local enum = sorts[idx].sortOrder
        local findK = _.findKey(Enum.AuctionHouseSortOrder,  function(v)
            return v == enum
        end)

        return findK
    end

    local priComp = sorts[1].reverseSort and _.lt or _.gt
    local comp = sorts[2].reverseSort and _.lt or _.gt

    local k1 = getKey(1)
    local k2 = getKey(2)

    table.sort(BRF.browseResults, function (a, b)
        if not a[k1] then return false end
        if not b[k1] then return false end

        if #sorts == 1 then 
            return  priComp(a[k1], b[k1])
        else
            if not a[k2] then return false end
            if not b[k2] then return false end
            return  priComp(a[k1], b[k1]) or 
                ( a[k1] == b[k1] and comp(a[k2], b[k2]))
        end
    end)

    BRF.ItemList:DirtyScrollFrame();
end