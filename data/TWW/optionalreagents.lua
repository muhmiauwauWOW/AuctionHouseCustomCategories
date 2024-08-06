local Data = AHCC:NewModule("AHCC_DATA_TWW_optionalreagents", AHCC_DATA)
local L, _ = AHCC:GetLibs()


Data.Config = {
    mode = "insert",
    nav = {},
    versionStart = 110000,
    versionEnd = 120000
} 


Data.Categories = {
    {
        ["name"] =  L["Optional Reagents"],
        ["config"] = {
        },
        ["subCategories"] = {
            {
                ["name"] =  L["Draconic Missive"],
                ["config"] = {
                    ["allowDuplicates"] = true,
                    ["columns"] = {"Stat1", "Stat2", "Quality"}
                },
                ["subCategories"] = {
                    {
                        ["name"] = L["CRITICAL_STRIKE"],
                        ["config"] = {
                            ["columns"] = {"Stat2", "Quality"}
                        },
                        ["Items"] = {
                            { ["Stat1"] = 1, ["Stat2"] = 3, ["id"] = { 222582, 222583, 222584 } }, -- Algari Missive of the Feverflare
                            { ["Stat1"] = 1, ["Stat2"] = 3, ["id"] = { 222591, 222592, 222593 } }, -- Algari Missive of the Peerless
                            { ["Stat1"] = 1, ["Stat2"] = 4, ["id"] = { 222594, 222595, 222596 } }, -- Algari Missive of the Quickblade
                        }
                    },
                    {
                        ["name"] = L["HASTE"],
                        ["config"] = {
                            ["columns"] = {"Stat2", "Quality"}
                        },
                        ["Items"] = {
                            { ["Stat1"] = 2, ["Stat2"] = 1, ["id"] = { 222585, 222586, 222587 } }, -- Algari Missive of the Fireflash
                            { ["Stat1"] = 2, ["Stat2"] = 2, ["id"] = { 222585, 222586, 222587 } }, -- Algari Missive of the Fireflash
                            { ["Stat1"] = 2, ["Stat2"] = 4, ["id"] = { 222579, 222580, 222581 } }, -- Algari Missive of the Aurora

                        }
                    },
                    {
                        ["name"] = L["MASTERY"],
                        ["config"] = {
                            ["columns"] = {"Stat2", "Quality"}
                        },
                        ["Items"] = {
                            { ["Stat1"] = 3, ["Stat2"] = 1, ["id"] = { 222591, 222592, 222593 } }, -- Algari Missive of the Peerless
                            { ["Stat1"] = 3, ["Stat2"] = 1, ["id"] = { 222582, 222583, 222584 } }, -- Algari Missive of the Feverflare
                            { ["Stat1"] = 3, ["Stat2"] = 4, ["id"] = { 222588, 222589, 222590 } }, -- Algari Missive of the Harmonious

                        }
                    },
                    {
                        ["name"] = L["VERSATILITY"],
                        ["config"] = {
                            ["columns"] = {"Stat2", "Quality"}
                        },
                        ["Items"] = {
                            { ["Stat1"] = 4, ["Stat2"] = 1, ["id"] = { 222594, 222595, 222596 } }, -- Algari Missive of the Quickblade
                            { ["Stat1"] = 4, ["Stat2"] = 2, ["id"] = { 222579, 222580, 222581 } }, -- Algari Missive of the Aurora
                            { ["Stat1"] = 4, ["Stat2"] = 3, ["id"] = { 222588, 222589, 222590 } }, -- Algari Missive of the Harmonious

                        }
                    },
                }
            },
            {
                ["name"] =  L["Embellishments"],
                ["config"] = {
                    ["columns"] = {"Quality"}
                },
                ["Items"] = {
                    { ["id"] = { 213768, 213769, 213770 } }, -- Elemental Focusing Lens
                    { ["id"] = { 213771, 213772, 213773 } }, -- Prismatic Null Stone
                    { ["id"] = { 213774, 213775, 213776 } }, -- Captured Starlight
                    { ["id"] = { 221935, 221936, 221937 } }, -- Pouch of Pocket Grenades
                    { ["id"] = { 221938, 221939, 221940 } }, -- Concealed Chaos Module
                    { ["id"] = { 221941, 221942, 221943 } }, -- Energy Redistribution Beacon
                    { ["id"] = { 219495, 219496, 219497 } }, -- Blessed Weapon Grip
                    { ["id"] = { 222452, 222453, 222454 } }, -- Echoing Impact Seal
                    { ["id"] = { 222455, 222456, 222457 } }, -- Arathor Armor Patch
                    { ["id"] = { 219504, 219505, 219506 } }, -- Writhing Armor Banding
                    { ["id"] = { 222868, 222869, 222870 } }, -- Dawnthread Lining
                    { ["id"] = { 222871, 222872, 222873 } }, -- Duskthread Lining
                    { ["id"] = { 222389, 221622, 221623 } }, -- Duskthread Lining
                    { ["id"] = 228921 }, -- Griftah's Heavy-Duty Embellishing Powder
                }
            }
        }
    }
}