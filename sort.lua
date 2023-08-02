local AHCC = LibStub("AceAddon-3.0"):GetAddon("AHCC")

local sortReverse = false

local getSortFunc = function(key, order)
    if order then 
        return function (k1, k2) return k1[key] < k2[key] end
    else 
        return function (k1, k2) return k1[key] > k2[key] end
    end
end

local sortResult = function(self, searchContext, sortOrder)
    local key = "";

    if sortOrder == 98 then 
        key = "name"
    elseif sortOrder == 99  then
        key = "quality"
    end

    sortReverse = not sortReverse
    table.sort(AHCC.searchResultTable, getSortFunc(key, sortReverse))

    self.BrowseResultsFrame.browseResults = AHCC.searchResultTable;
    self.BrowseResultsFrame.ItemList:DirtyScrollFrame();
end


function AHCC:initSort()
    function AuctionHouseFrame:SetBrowseSortOrder(sortOrder)
        if sortOrder > 90 then 
            local browseSearchContext = self:GetBrowseSearchContext();
            sortResult(self, browseSearchContext, sortOrder)            
        else -- blizzard org func
            local browseSearchContext = self:GetBrowseSearchContext();
            self:SetSortOrder(browseSearchContext, sortOrder);
        end
    end
end
