local AHCC = LibStub("AceAddon-3.0"):GetAddon("AHCC")
local _ = LibStub("Lodash"):Get()

local sortConfigDefault = {
    Name = false,
    quality = false,
    stat1 = false,
    stat2 = false,
    Price = false,
}

local sortConfig = sortConfigDefault


function AHCC:sortResult(self, sortOrder, notReverse)


    local keyObj = _.find(_.pairs(Enum.AuctionHouseSortOrder), function(enum)
        return enum[2] == sortOrder
    end)

    local key = keyObj and  keyObj[1] or ""

    local ViewIndex = _.findIndex(AHCC.viewConfig.columns, function(col)
        return col == key
    end)

    if not notReverse then
        sortConfig[key] = not sortConfig[key]
    end

    local sortedResults = AHCC.searchResultTable

    sortedResults = _.map(sortedResults, function (entry)
        if entry[key] == nil then
            entry[key] = ""
        end
        return entry
    end)

    table.sort(sortedResults, function(a,b) 
        return a[key] < b[key]
    end)

    if sortConfig[key] then
        sortedResults = _.reverse(sortedResults)
    end



    _.forEach(self.headers, function(header) 
        header.Arrow:Hide()
    end)

    if ViewIndex ~= -1 then
        if self.headers[ViewIndex] then
            self.headers[ViewIndex].Arrow:Show()

            if sortConfig[key] then
                self.headers[ViewIndex].Arrow:SetTexCoord(0, 1, 1, 0);
            else
                self.headers[ViewIndex].Arrow:SetTexCoord(0, 1, 0, 1);
            end
        end
    end

     -- display results
    AHCC.searchResultTable = sortedResults
    self.browseResults = AHCC.searchResultTable;
    self.ItemList:DirtyScrollFrame();
end


function AHCC:initSort()
    function AuctionHouseFrame:SetBrowseSortOrder(sortOrder)
        if AHCC.isInCustomCategory then 
            AHCC:sortResult(self.BrowseResultsFrame, sortOrder) 
        else -- blizzard org func
            local browseSearchContext = self:GetBrowseSearchContext();
            self:SetSortOrder(browseSearchContext, sortOrder);
        end
    end
end
