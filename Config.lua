local AHCC = LibStub("AceAddon-3.0"):GetAddon("AHCC")
local L = LibStub("AceLocale-3.0"):GetLocale("AHCC")


AHCC.Config = {}
AHCC.Config.sortOrder = {
    name = 91,
    stat1 = 92,
    stat2 = 93,
    quality = 99
}

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