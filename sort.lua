local AHCC = LibStub("AceAddon-3.0"):GetAddon("AHCC")

local sortConfigDefault = {
    name = true,
    quality = false,
    stat1 = true,
    stat2 = true,
}

local sortConfig = sortConfigDefault

local getSortFunc = function(key)
    if sortConfig[key] then 
        return function(k1, k2) if k1[key] ~= nil and k2[key] ~= nil then return k1[key] < k2[key] end end
    else
        return function(k1, k2) if k1[key] ~= nil and k2[key] ~= nil then return k1[key] > k2[key] end end
    end
end

function AHCC:sortResult(self, sortOrder, notReverse)


    local key = ""
    local tempResultTable = {}
    local sortedResultTable = {}

    if sortOrder == AHCC.Config.sortOrder.name then 
        key = "name"
    elseif sortOrder == AHCC.Config.sortOrder.stat1  then
        key = "stat1"
    elseif sortOrder == AHCC.Config.sortOrder.stat2  then
        key = "stat2"
    elseif sortOrder == AHCC.Config.sortOrder.quality  then
        key = "quality"
    end


    if notReverse then
        sortConfig = {
            name = true,
            quality = false,
            stat1 = true,
            stat2 = true,
        }
    else -- toggle order
        sortConfig[key] = not sortConfig[key]
    end


    tempResultTable[1] = {
        quality = 1,
        entries = {}
    }

    tempResultTable[2] = {
        quality = 2,
        entries = {}
    }

    tempResultTable[3] = {
        quality = 3,
        entries = {}
    }

    for idx, entry in ipairs(AHCC.searchResultTable) do 
        tinsert(tempResultTable[entry.quality]["entries"], entry)
    end 

    -- sort by quality
    table.sort(tempResultTable, getSortFunc("quality"))

    -- sort by key
    for idx, entry in ipairs(tempResultTable) do
        if key ~= "quality" then
            table.sort(entry["entries"], getSortFunc(key))
        end
        tAppendAll(sortedResultTable,entry["entries"])
    end

     -- display results
    AHCC.searchResultTable = sortedResultTable
    self.browseResults = AHCC.searchResultTable;
    self.ItemList:DirtyScrollFrame();
end


function AHCC:initSort()
    function AuctionHouseFrame:SetBrowseSortOrder(sortOrder)
        if sortOrder > 90 then 
            AHCC:sortResult(self.BrowseResultsFrame, sortOrder)            
        else -- blizzard org func
            local browseSearchContext = self:GetBrowseSearchContext();
            self:SetSortOrder(browseSearchContext, sortOrder);
        end
    end
end
