local AHCC = LibStub("AceAddon-3.0"):GetAddon("AHCC")
local L, _ = AHCC:GetLibs()

AHCC.Config = {}




-- add Enum
Enum.AuctionHouseSortOrder.Stat1 = 92
Enum.AuctionHouseSortOrder.Stat2 = 95
Enum.AuctionHouseSortOrder.Quality = 99



local TableColumnsDefaults = {
    isFixed = false,
    width = 1.0,
    padding = 0,
    leftCellPadding = 10,
    rightCellPadding = 10,
}

AHCC.Config.TableColums = {}


AHCC.Config.TableColums["Price"] = {
    isFixed = true,
    width = 146,
    leftCellPadding = 0,
    sortOrder = Enum.AuctionHouseSortOrder.Price,
    template = "AHCCTableCellMoneyTemplate"
}

AHCC.Config.TableColums["Name"] = {
    name = AUCTION_HOUSE_BROWSE_HEADER_NAME,
    sortOrder = Enum.AuctionHouseSortOrder.Name,
    template = "AuctionHouseTableCellItemDisplayTemplate"
}

AHCC.Config.TableColums["Stat1"] = {
    name = L["TABLE_HEADER_STAT1"],
    sortOrder = Enum.AuctionHouseSortOrder.Stat1,
    template = "AuctionHouseTableCellStat1Template"
}
AHCC.Config.TableColums["Stat2"] = {
    name = L["TABLE_HEADER_STAT2"],
    sortOrder = Enum.AuctionHouseSortOrder.Stat2,
    template = "AuctionHouseTableCellStat2Template"
}

AHCC.Config.TableColums["Quality"] = {
    isFixed = true,
    name = "",
    sortOrder = Enum.AuctionHouseSortOrder.Quality,
    width = 24,
    leftCellPadding = 4,
    rightCellPadding = 0,
    template = "AuctionHouseTableCellQualityTemplate"
}


AHCC.Config.TableColums = _.map(AHCC.Config.TableColums, function(entry)
    return Mixin({}, TableColumnsDefaults, entry)
end)



AHCC.Config.tableCellStatColors = {
    { 1, 1, 1, 1},
    { 0.96, 0.29, 0.25, 1},
    { 0.64, 0.89, 0.52, 1},
    { 0.68, 0.62, 0.72, 1},
    { 0.57, 0.8, 0.99, 1},
    { 0.97, 0.74, 0.02, 1}
}

AHCC.Config.tableCellStats = {
    L["CELL_EMPTY"],
    L["CELL_CRITICAL_STRIKE"],
    L["CELL_HASTE"],
    L["CELL_MASTERY"],
    L["CELL_VERSATILITY"],
    L["CELL_STAMINA"]
}

AHCC.Config.ProfessionsQualityIconTable = {
    "Professions-Icon-Quality-Tier1-Small",
    "Professions-Icon-Quality-Tier2-Small",
    "Professions-Icon-Quality-Tier3-Small"
}

AHCC.Config.ProfessionsQualityIconSize = 0.6

AHCC.Config.ProfessionsQualityActive = {false, false, true}