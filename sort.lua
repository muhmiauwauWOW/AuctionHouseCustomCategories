local AHCC = LibStub("AceAddon-3.0"):GetAddon("AHCC")

local sortConfig = {
    name = true,
    quality = false
}

local getSortFunc = function(key)
    if sortConfig[key] then 
        return function(k1, k2) return k1[key] < k2[key] end
    else 
        return function(k1, k2) return k1[key] > k2[key] end
    end
end

function AHCC:sortResult(self, sortOrder)

    local key = ""
    local tempResultTable = {}
    local sortedResultTable = {}

    if sortOrder == 98 then 
        key = "name"
    elseif sortOrder == 99  then
        key = "quality"
    end

    -- toggle order
    sortConfig[key] = not sortConfig[key]

    for idx, entry in ipairs(AHCC.searchResultTable) do 
        if not tempResultTable[entry.quality] then 
            tempResultTable[entry.quality] = {
                quality = entry.quality,
                entries = {}
            }
        end
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
    self.BrowseResultsFrame.browseResults = AHCC.searchResultTable;
    self.BrowseResultsFrame.ItemList:DirtyScrollFrame();
end


function AHCC:initSort()
    function AuctionHouseFrame:SetBrowseSortOrder(sortOrder)
        if sortOrder > 90 then 
            AHCC:sortResult(self, sortOrder)            
        else -- blizzard org func
            local browseSearchContext = self:GetBrowseSearchContext();
            self:SetSortOrder(browseSearchContext, sortOrder);
        end
    end
end
