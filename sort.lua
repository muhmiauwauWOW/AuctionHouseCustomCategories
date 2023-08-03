local AHCC = LibStub("AceAddon-3.0"):GetAddon("AHCC")

local sortReverse = true

local getSortFunc = function(key, order)
    if order then 
        return function(k1, k2) return k1[key] < k2[key] end
    else 
        return function(k1, k2) return k1[key] > k2[key] end
    end
end

function AHCC:sortResult(self, sortOrder, notReverse)
    local key = "";

    if sortOrder == 98 then 
        key = "name"
    elseif sortOrder == 99  then
        key = "quality"
    end

    if notReverse then 
        sortReverse = true
    else 
        sortReverse = not sortReverse
    end

    local tempResultTable = {}
    local sortedResultTable = {}

    for idx, entry in ipairs(AHCC.searchResultTable) do 
        if not tempResultTable[entry.quality] then 
            tempResultTable[entry.quality] = {
                quality = entry.quality,
                entries = {}
            }
        end
        tinsert(tempResultTable[entry.quality]["entries"], entry)
    end 

    table.sort(tempResultTable, getSortFunc("quality", false))

    if sortOrder == 99 then 
        table.sort(tempResultTable, getSortFunc("quality", sortReverse))
    else
        table.sort(tempResultTable, getSortFunc("quality", false))
    end

    for idx, entry in ipairs(tempResultTable) do
        table.sort(entry["entries"], getSortFunc(key, sortReverse))
        tAppendAll(sortedResultTable,entry["entries"])
    end 

    self.BrowseResultsFrame.browseResults = sortedResultTable;
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
