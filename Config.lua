local AHCC = LibStub("AceAddon-3.0"):GetAddon("AHCC")
local L, _ = AHCC:GetLibs()

AHCC.Config = {}

AHCC.Config.TableColums = {
    ["Stat1"] = {
        name = L["TABLE_HEADER_STAT1"],
        width = 120,
        padding = 0,
        leftCellPadding = 14,
        rightCellPadding = 14
    },
    ["Stat2"] = {
        name = L["TABLE_HEADER_STAT2"],
        width = 120,
        padding = 0,
        leftCellPadding = 14,
        rightCellPadding = 14
    },
    ["Quality"] = {
        name = "",
        width = 24,
        padding = 0,
        leftCellPadding = 4,
        rightCellPadding = 0
    }
}

-- add Enum
Enum.AuctionHouseSortOrder.Stat1 = 92
Enum.AuctionHouseSortOrder.Stat2 = 93
Enum.AuctionHouseSortOrder.Quality = 99


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