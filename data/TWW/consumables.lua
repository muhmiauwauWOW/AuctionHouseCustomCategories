local Data = AHCC:NewModule("AHCC_DATA_TWW_consumables", AHCC_DATA)
local L, _ = AHCC:GetLibs()


--print(C_AddOns.GetAddOnMetadata("AuctionHouseCustomCategories_Data_TWW", "Version"))

Data.Config = {
    mode = "insert",
    nav = {},
    expansionLevel = 10
} 

Data.Categories = {
    {
        ["name"] =  L["Consumables"],
        ["subCategories"] = {
            {
                ["name"] = L["TemporaryEnhancements"],
                ["Items"] = {
                    { ["id"] = { 226034, 226035, 226036 } }, -- Vantus Rune: Nerub-ar Palace
                    { ["id"] = { 222502, 222503, 222504 } }, -- Ironclaw Whetstone
                    { ["id"] = { 222505, 222506, 222507 } }, -- Ironclaw Razorstone
                    { ["id"] = { 222508, 222509, 222510 } }, -- Ironclaw Weightstone
                    { ["id"] = { 224105, 224106, 224107 } }, -- Algari Mana Oil
                    { ["id"] = { 224108, 224109, 224110 } }, -- Oil of Beledar's Grace
                    { ["id"] = { 224111, 224112, 224113 } }, -- Oil of Deep Toxins
                }
            },
            {
                ["name"] = L["Flasks"],
                ["Items"] = {
                    { ["id"] = { 212281, 212282, 212283 } }, -- Flask of Alchemical Chaos
                    { ["id"] = { 212299, 212300, 212301 } }, -- Flask of Saving Graces
                    { ["id"] = { 212305, 212306, 212307 } }, -- Phial of Concentrated Ingenuity
                    { ["id"] = { 212308, 212309, 212310 } }, -- Phial of Truesight
                    { ["id"] = { 212311, 212312, 212313 } }, -- Phial of Enhanced Ambidextry
                    { ["id"] = { 212314, 212315, 212316 } }, -- Phial of Bountiful Seasons
                }
            },
            {
                ["name"] = L["Potions"],
                ["Items"] = {
                    { ["id"] = { 211878, 211879, 211880 } }, -- Algari Healing Potion
                    { ["id"] = { 212239, 212240, 212241 } }, -- Algari Mana Potion
                    { ["id"] = { 212242, 212243, 212244 } }, -- Cavedweller's Delight
                    { ["id"] = { 212245, 212246, 212247 } }, -- Slumbering Soul Serum
                    { ["id"] = { 212248, 212249, 212250 } }, -- Draught of Silent Footfalls
                    { ["id"] = { 212251, 212252, 212253 } }, -- Draught of Shocking Revelations
                    { ["id"] = { 212254, 212255, 212256 } }, -- Grotesque Vial
                    { ["id"] = { 212257, 212258, 212259 } }, -- Potion of Unwavering Focus
                    { ["id"] = { 212260, 212261, 212262 } }, -- Frontline Potion
                    { ["id"] = { 212263, 212264, 212265 } }, -- Tempered Potion
                    { ["id"] = { 212266, 212267, 212268 } }, -- Potion of the Reborn Cheetah
                }
            },
            {
                ["name"] = L["Food"],
                ["config"] = {
                    ["columns"] = {}
                },
                ["Items"] = {
                    { ["id"] = 204072 }, -- Teuflisch gefüllte Eier
                    { ["id"] = 197792 }, -- Schicksalhafter Glückskeks

                    { ["id"] = 197793 }, -- Yusas herzhafter Eintopf
                    { ["id"] = 197795 }, -- Vorrat an drakonischen Delikatessen
                    { ["id"] = 197794 }, -- Großbankett der Kalu'ak
                }
            }
        }
    },
}