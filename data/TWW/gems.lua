local Data = AHCC:NewModule("AHCC_DATA_TWW_gems", AHCC_DATA)
local L, _ = AHCC:GetLibs()


Data.Config = {
    mode = "insert",
    nav = {},
    versionStart = 110020,
    versionEnd = 120020
} 


Data.Categories = {
    {
        ["name"] = L["Gems"],
        ["config"] = {
            ["columns"] = {"Stat1", "Stat2", "Quality"}
        },
        ["subCategories"] = {
            {
                ["name"] = L["CRITICAL_STRIKE"],
                ["config"] = {
                    ["columns"] = {"Stat2", "Quality"}
                },
                ["Items"] = {
                    { ["Stat1"] = 1, ["Stat2"] = 0, ["id"] = { 213462, 213463, 213464 } }, -- Deadly Ruby
                    { ["Stat1"] = 1, ["Stat2"] = 2, ["id"] = { 213453, 213454, 213455 } }, -- Quick Ruby
                    { ["Stat1"] = 1, ["Stat2"] = 3, ["id"] = { 213456, 213457, 213458 } }, -- Masterful Ruby
                    { ["Stat1"] = 1, ["Stat2"] = 4, ["id"] = { 213459, 213460, 213461 } }, -- Versatile Ruby
                },
            },
            {
                ["name"] = L["HASTE"],
                ["config"] = {
                    ["columns"] = {"Stat2", "Quality"}
                },
                ["Items"] = {
                    { ["Stat1"] = 2, ["Stat2"] = 0, ["id"] = { 213486, 213487, 213488 } }, -- Quick Emerald
                    { ["Stat1"] = 2, ["Stat2"] = 1, ["id"] = { 213477, 213478, 213479 } }, -- Deadly Emerald
                    { ["Stat1"] = 2, ["Stat2"] = 3, ["id"] = { 213480, 213481, 213482 } }, -- Masterful Emerald
                    { ["Stat1"] = 2, ["Stat2"] = 4, ["id"] = { 213483, 213484, 213485 } }, -- Versatile Emerald
                },
            },
            {
                ["name"] = L["MASTERY"],
                ["config"] = {
                    ["columns"] = {"Stat2", "Quality"}
                },
                ["Items"] = {
                    { ["Stat1"] = 3, ["Stat2"] = 0, ["id"] = { 213498, 213499, 213500 } }, -- Masterful Onyx
                    { ["Stat1"] = 3, ["Stat2"] = 1, ["id"] = { 213489, 213490, 213491 } }, -- Deadly Onyx
                    { ["Stat1"] = 3, ["Stat2"] = 2, ["id"] = { 213492, 213493, 213494 } }, -- Quick Onyx
                    { ["Stat1"] = 3, ["Stat2"] = 4, ["id"] = { 213495, 213496, 213497 } }, -- Versatile Onyx
                },
            },
            {
                ["name"] = L["VERSATILITY"],
                ["config"] = {
                    ["columns"] = {"Stat2", "Quality"}
                },
                ["Items"] = {
                    { ["Stat1"] = 4, ["Stat2"] = 0, ["id"] = { 213474, 213475, 213476 } }, -- Versatile Sapphire
                    { ["Stat1"] = 4, ["Stat2"] = 1, ["id"] = { 213465, 213466, 213467 } }, -- Deadly Sapphire
                    { ["Stat1"] = 4, ["Stat2"] = 2, ["id"] = { 213468, 213469, 213470 } }, -- Quick Sapphire
                    { ["Stat1"] = 4, ["Stat2"] = 3, ["id"] = { 213471, 213472, 213473 } }, -- Masterful Sapphire
                },
            },
            {
                ["name"] = L["STAMINA"],
                ["config"] = {
                    ["columns"] = {"Stat2", "Quality"}
                },
                ["Items"] = {
                    { ["Stat1"] = 5, ["Stat2"] = 0, ["id"] = { 213515, 213516, 213517 } }, -- Solid Amber
                    { ["Stat1"] = 5, ["Stat2"] = 1, ["id"] = { 213501, 213502, 213503 } }, -- Deadly Amber
                    { ["Stat1"] = 5, ["Stat2"] = 2, ["id"] = { 213504, 213505, 213506 } }, -- Quick Amber
                    { ["Stat1"] = 5, ["Stat2"] = 3, ["id"] = { 213507, 213508, 213509 } }, -- Masterful Amber
                    { ["Stat1"] = 5, ["Stat2"] = 4, ["id"] = { 213510, 213511, 213512 } }, -- Versatile Amber
                },
            }
        },
    },
}









