AHCC = LibStub("AceAddon-3.0"):NewAddon("AHCC")
local L = LibStub("AceLocale-3.0"):GetLocale("AHCC")
local _ = LibStub("LibLodash-1"):Get()

AHCC:SetDefaultModuleState(true)

function AHCC:GetLibs()
    return L, _
end 

AHCC.gameVersion = select(4, GetBuildInfo())

local DBdefaults = {
    global = {
        lastReplicateDate = 0,
        prices = {},
        sort = {
            { reverseSort = false, sortOrder = 0 },
            { reverseSort = false, sortOrder = 1 },
        }
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
    self.db = LibStub("AceDB-3.0"):New("AHCCDB2", DBdefaults, true)
    AHCC.Config.ProfessionsQualityActive = self.db.char.QualitySelected

    AHCCItems:Init()
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


function AHCC:performSearch()
    AHCCReplicateButton:check()
    AHCC.searchResultTable = AHCC.isInCustomCategory and getResultsObj(AHCC.Nav) or nil

    if AHCC.searchResultTable then
        AHCCBrowseResultsFrame:Update(AHCC.searchResultTable)
    end
end
