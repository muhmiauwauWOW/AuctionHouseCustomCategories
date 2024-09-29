AHCC = LibStub("AceAddon-3.0"):NewAddon("AHCC")
local L = LibStub("AceLocale-3.0"):GetLocale("AHCC")
local _ = LibStub("LibLodash-1"):Get()

AHCC:SetDefaultModuleState(true)

function AHCC:GetLibs()
    return L, _
end 

AHCC.gameVersion = select(4, GetBuildInfo())

local DBdefaults = {
    global = {
        prices = {},
        sort = {
            { reverseSort = false, sortOrder = 0 },
            { reverseSort = false, sortOrder = 1 },
        }
    },
    profile = {
    },
    char = {
        QualitySelected = {false, false, true}
    }

}

AHCC.Nav = nil

function AHCC:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("AHCCDB3", DBdefaults, true)
    AHCC.Config.ProfessionsQualityActive = self.db.char.QualitySelected
    AHCCItems:Init()

    self.PriceScan = CreateFrame("Frame", nil, UIParent, "AHCCPriceScanTemplate")
end


function AHCC:performSearch(refresh)
    AHCCBrowseResultsFrame:performSearch(refresh)
end