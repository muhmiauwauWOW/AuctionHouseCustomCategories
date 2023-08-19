local AHCC = LibStub("AceAddon-3.0"):GetAddon("AHCC")
local _ = LibStub("Lodash"):Get()

local sortConfigDefault = {
    Name = true,
    quality = false,
    stat1 = true,
    stat2 = true,
    Price = true,
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

    if notReverse then
        sortConfig = {
            Name = true,
            quality = false,
            stat1 = true,
            stat2 = true,
            Price = false,
        }
    else -- toggle order
        sortConfig[key] = not sortConfig[key]
    end



    local sortedResults = AHCC.searchResultTable

    _.map(sortedResults, function (entry)
        if entry[key] == nil then
            entry[key] = ""
        end
        return entry
    end)

    sortedResults = _.sortBy(sortedResults, function (a)
        return a[key]
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
