AHCC = LibStub("AceAddon-3.0"):NewAddon("AHCC")
local L = LibStub("AceLocale-3.0"):GetLocale("AHCC")
local _ = LibStub("LibLodash-1"):Get()
local LibAHTab = LibStub("LibAHTab-1-0")

AHCC:SetDefaultModuleState(true)

function AHCC:GetLibs()
    return L, _
end 

AHCC.gameVersion = select(4, GetBuildInfo())

local DBdefaults = {
    global = {
        lastReplicateDate = 0,
        prices = {},
    },
    profile = {
    },
    char = {
        QualitySelected = {false, false, true}
    }

}

AHCC.Nav = nil
AHCC.searchResultTable = nil
AHCC.isReplicateRunning = false

function AHCC:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("AHCCDB", DBdefaults, true)
    AHCC.Config.ProfessionsQualityActive = self.db.char.QualitySelected

    AHCCItems:Init()
end 

function AHCC:OnEnable()
    self:initQualityFrame()
    self:initReplicateButton()
end

function AHCC:initQualityFrame()
   AuctionHouseFrame.SearchBar.QualityFrame = CreateFrame ("Frame", nil, AuctionHouseFrame.SearchBar, "AHCCQualitySelectFrameTemplate")
end




local getResultsObj = function(nav)
    local function trim(s)
        return (s:gsub("^%s*(.-)%s*$", "%1"))
    end
    local searchString = trim(AuctionHouseFrame.SearchBar.SearchBox:GetSearchString())
    local results = AHCCItems:getByNav(nav)
    
    if (searchString ~= "") then 
        results = _.filter(results, function(filterEntry)
            return string.find(string.lower(filterEntry.Name), string.lower(searchString), 1, true)
        end)
    end

    results = _.filter(results, function(entry)
        return (entry.Quality == 0) and true or AHCC.Config.ProfessionsQualityActive[entry.Quality] 
    end)

    if #results == 0 then return nil end
    return results
end



function AHCC:AddFixedWidthColumn(AHCC, owner, tableBuilder, key)
    if not _.has(AHCC.Config.TableColums, {key}) then return end
    local colConfig = AHCC.Config.TableColums[key]
    local column = tableBuilder:AddFixedWidthColumn(owner, colConfig.padding, colConfig.width, colConfig.leftCellPadding, colConfig.rightCellPadding, Enum.AuctionHouseSortOrder[key], string.format("AuctionHouseTableCell%sTemplate", key));
    column:GetHeaderFrame():SetText(colConfig.name);
end




function GetBrowseListLayout(AHCC, owner, itemList)
	local function LayoutBrowseListTableBuilder(tableBuilder)
		tableBuilder:SetColumnHeaderOverlap(2);
		tableBuilder:SetHeaderContainer(itemList:GetHeaderContainer());

        _.forEach(AHCCCategory.config:getColumns(AHCC.Nav), function(colName)
            if colName == "Price" then 
                tableBuilder:AddFixedWidthColumn(owner, PRICE_DISPLAY_PADDING, 146, 0, 14, Enum.AuctionHouseSortOrder.Price , "AuctionHouseTableCellMinPriceTemplate");
            elseif colName == "Name" then 
                local nameColumn = tableBuilder:AddFillColumn(owner, 0, 1.0, 14, 14, Enum.AuctionHouseSortOrder.Name, "AuctionHouseTableCellItemDisplayTemplate");
                nameColumn:GetHeaderFrame():SetText(AUCTION_HOUSE_BROWSE_HEADER_NAME);
            else
                AHCC:AddFixedWidthColumn(AHCC, owner, tableBuilder, colName)
            end
        end)
	end

	return LayoutBrowseListTableBuilder;
end


function AHCC:performSearch()
    AHCCReplicateButton:check()
    local BRF = AuctionHouseFrame.BrowseResultsFrame
    AHCC:Reset()
    AHCC.searchResultTable = AHCC.isInCustomCategory and getResultsObj(AHCC.Nav) or nil

  

    if AHCC.searchResultTable then
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

    if not _.isTable(sorts) then return end
    
    if  sorts[1] == nil then 
        sorts[1] = { reverseSort = false, sortOrder = 1}
    end

    if #sorts == 1 then 
        sorts[2] = sorts[1]
    end

    local function getKey(idx)
        return _.findKey(Enum.AuctionHouseSortOrder, function(v) return v == sorts[idx].sortOrder end)
    end


    local priComp = (sorts[1] and sorts[1].reverseSort) and _.lt or _.gt
    local comp = (sorts[2] and sorts[2].reverseSort) and _.lt or _.gt

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



