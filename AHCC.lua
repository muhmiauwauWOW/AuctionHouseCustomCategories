AHCC = LibStub("AceAddon-3.0"):NewAddon("AHCC")
local L = LibStub("AceLocale-3.0"):GetLocale("AHCC")
local _ = LibStub("LibLodash-1"):Get()

AHCC:SetDefaultModuleState(true)

function AHCC:GetLibs() return L, _ end

AHCC.gameVersion = select(4, GetBuildInfo())

local DBdefaults = {
    global = {
        prices = {},
        lastScan = nil,
        sort = {
            {reverseSort = false, sortOrder = 0},
            {reverseSort = false, sortOrder = 1}
        },
        customCategories = {
            {
                order = 1,
                name = L["My Warband Items"],
                id = "myItems",
                categories = {}
            }
        },
        customItems = {
			["myItems"] = {}
        }

    },
    profile = {},
    char = {QualitySelected = {true, true}}

}

AHCC.Nav = nil

function AHCC:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("AHCCDB3", DBdefaults, true)
    AHCC.Config.ProfessionsQualityActive = self.db.char.QualitySelected
    AHCCItems:Init()

    if Auctionator and Auctionator.API and Auctionator.API.v1 and
        type(Auctionator.API.v1.GetAuctionPriceByItemID) == "function" then
        AHCCItems:registerPriceProvider("Auctionator", function(itemID)
            return Auctionator.API.v1.GetAuctionPriceByItemID("AHCC", itemID)
        end)
    end

    self.PriceScan = CreateFrame("Frame", nil, AHCCBrowseResultsFrame, "AHCCPriceScanTemplate")

    local checktime = time() - (60 * 6)
    if not self.db.global.lastScan or
        (self.db.global.lastScan and self.db.global.lastScan < checktime) then
        self.PriceScan:Show()
    end

	AHCCOptions:init()
end

function AHCC:performSearch(refresh)
    AHCCBrowseResultsFrame:performSearch(refresh)
end

-- support for all the ELVUI fanbois out there
function AHCC:ElvSkin()
    if not C_AddOns.IsAddOnLoaded("ElvUI") then return end
    local E, L, V, P, G = unpack(ElvUI)
    if not (E.private.skins.blizzard.enable and
        E.private.skins.blizzard.auctionhouse) then return end

    local S = E:GetModule("Skins")

    S:HandleButton(AHCCQualitySelectFrame.Quality1Button)
    S:HandleButton(AHCCQualitySelectFrame.Quality2Button)

    local function HandleHeaders(frame)
        local maxHeaders = frame.HeaderContainer:GetNumChildren()
        for i, header in next, {frame.HeaderContainer:GetChildren()} do
            if not header.IsSkinned then
                header:DisableDrawLayer('BACKGROUND')

                if not header.backdrop then
                    header:CreateBackdrop('Transparent')
                end

                header.IsSkinned = true
            end

            if header.backdrop then
                header.backdrop:Point('BOTTOMRIGHT', i < maxHeaders and -5 or 0,
                                      -2)
            end
        end
    end

    local function HandleSellList(frame)
        frame:StripTextures()
        frame:SetTemplate('Transparent')

        S:HandleTrimScrollBar(frame.ScrollBar)
        frame.ScrollBar:ClearAllPoints()
        frame.ScrollBar:Point('TOPRIGHT', frame, -10, -16)
        frame.ScrollBar:Point('BOTTOMRIGHT', frame, -10, 16)

        hooksecurefunc(frame, 'RefreshScrollFrame', HandleHeaders)
    end
    HandleSellList(AHCCBrowseResultsFrame.ItemList)
end
