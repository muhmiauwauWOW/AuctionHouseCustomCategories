local AHCC = LibStub("AceAddon-3.0"):GetAddon("AHCC")
local L, _ = AHCC:GetLibs()

local LibAHTab = LibStub("LibAHTab-1-0")



function GetBrowseListLayout(AHCC, owner, itemList)
	local function LayoutBrowseListTableBuilder(tableBuilder)
		tableBuilder:SetColumnHeaderOverlap(2);
		tableBuilder:SetHeaderContainer(itemList:GetHeaderContainer());

        _.forEach(AHCCCategory.config:getColumns(AHCC.Nav), function(colName)
            if colName == "Price" then 
                tableBuilder:AddFixedWidthColumn(owner, PRICE_DISPLAY_PADDING, 146, 0, 14, Enum.AuctionHouseSortOrder.Price , "AHCCTableCellMoneyTemplate");
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



AHCCBrowseResultsMixin = {}

function AHCCBrowseResultsMixin:SetupTableBuilder()
    -- self.ItemList:SetTableBuilderLayout(AuctionHouseTableBuilder.GetBrowseListLayout(self, self.ItemList, extraInfoColumn));

    self.ItemList:SetTableBuilderLayout(GetBrowseListLayout(AHCC, self, self.ItemList));
	self.tableBuilderLayoutDirty = false;
end

function AHCCBrowseResultsMixin:OnLoad()


    self:SetFrameLevel(10)


	self.ItemList:SetLineTemplate("AuctionHouseFavoritableLineTemplate");

	self.ItemList:SetSelectionCallback(function(browseResult)
		AuctionHouseFrame:SelectBrowseResult(browseResult);
        self:Hide()
		return false; -- browse lines are never selected.
	end);

	self.ItemList:SetLineOnEnterCallback(AuctionHouseUtil.LineOnEnterCallback);
	self.ItemList:SetLineOnLeaveCallback(AuctionHouseUtil.LineOnLeaveCallback);

    self:SetupTableBuilder();

    self.searchStarted =  true
    self.browseResults = {}

    


	local function BrowseListSearchStarted()
		return self.searchStarted, "lalaal";
	end

	local function BrowseListGetNumEntries()
		return #self.browseResults;
	end

	local function BrowseListGetEntry(index)
		return self.browseResults[index];
	end

    local function hasFullResultsFun()
		return false
	end

	self.ItemList:SetDataProvider(BrowseListSearchStarted, BrowseListGetEntry, BrowseListGetNumEntries, hasFullResultsFun);

	self:Reset();


end

function AHCCBrowseResultsMixin:Reset()
	self.browseResults = {};
	self.sortOrder = nil;
	self.isSortOrderReversed = false;
	self.searchStarted = false;
end

function AHCCBrowseResultsMixin:Update(items)
    
    self.ItemList:SetRefreshCallback(nil)
    self.searchStarted = true;
    self.browseResults = items
    self:SetupTableBuilder();
    self.ItemList:Reset();
    self.ItemList:DirtyScrollFrame();
end


function AHCCBrowseResultsMixin:OnShow()
	self.ItemList:RefreshScrollFrame();
end

function AHCCBrowseResultsMixin:OnHide()

end

function AHCCBrowseResultsMixin:OnEvent(event, ...)
	print("NOOO OnEvent")
end