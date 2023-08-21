local Data = AHCC:NewModule("AHCC_DATA_optionalreagents", AHCC_DATA)
local L, _ = AHCC:GetLibs()

Data.Categories = {
    {
        ["id"] = 4,
        ["name"] =  L["Optional Reagents"],
        ["config"] = {
            ["type"] = "test"
        },
        ["subCategories"] = {
            {
                ["id"] = 1,
                ["name"] =  L["Draconic Missive"],
                ["config"] = {
                    ["columns"] = {"stat1", "stat2", "quality"}
                },
                ["subCategories"] = {
                    {
                        ["id"] = 1,
                        ["name"] = L["CRITICAL_STRIKE"],
                        ["config"] = {
                            ["columns"] = {"stat2", "quality"}
                        },
                        ["Items"] = {
                            { ["category"] = 4, ["subCategory"] = 1, ["subSubCategory"] = 1,   ["id"] = { 192553, 192554, 192552 },  ["stat2"] = 2 }, -- Drakonisches Schreiben des Feuerpeitsche
                            { ["category"] = 4, ["subCategory"] = 1, ["subSubCategory"] = 1,   ["id"] = { 194579, 194580, 194578 },  ["stat2"] = 3 }, -- Drakonisches Schreiben der Unvergleichlichkeit
                            { ["category"] = 4, ["subCategory"] = 1, ["subSubCategory"] = 1,   ["id"] = { 194573, 194574, 194572 },  ["stat2"] = 4 }, -- Drakonisches Schreiben der Schnellklinge
                            
                        }
                    },
                    {
                        ["id"] = 2,
                        ["name"] = L["HASTE"],
                        ["config"] = {
                            ["columns"] = {"stat2", "quality"}
                        },
                        ["Items"] = {
                            { ["category"] = 4, ["subCategory"] = 1, ["subSubCategory"] = 2,   ["id"] = { 192553, 192554, 192552 }, ["stat2"] = 1 }, -- Drakonisches Schreiben des Feuerpeitsche
                            { ["category"] = 4, ["subCategory"] = 1, ["subSubCategory"] = 2,   ["id"] = { 194567, 194568, 194566 }, ["stat2"] = 3 }, -- Drakonisches Schreiben des Hitzeschocks
                            { ["category"] = 4, ["subCategory"] = 1, ["subSubCategory"] = 2,   ["id"] = { 194570, 194571, 194569 }, ["stat2"] = 4 }, -- Drakonisches Schreiben der Aurora

                        }
                    },
                    {
                        ["id"] = 3,
                        ["name"] = L["MASTERY"],
                        ["config"] = {
                            ["columns"] = {"stat2", "quality"}
                        },
                        ["Items"] = {
                            { ["category"] = 4, ["subCategory"] = 1, ["subSubCategory"] = 3,   ["id"] = { 194579, 194580, 194578 }, ["stat2"] = 1 }, -- Drakonisches Schreiben der Unvergleichlichkeit
                            { ["category"] = 4, ["subCategory"] = 1, ["subSubCategory"] = 3,   ["id"] = { 194567, 194568, 194566 }, ["stat2"] = 2 }, -- Drakonisches Schreiben des Hitzeschocks
                            { ["category"] = 4, ["subCategory"] = 1, ["subSubCategory"] = 3,   ["id"] = { 194576, 194577, 194575 }, ["stat2"] = 4 }, -- Drakonisches Schreiben der Harmonischen

                        }
                    },
                    {
                        ["id"] = 4,
                        ["name"] = L["VERSATILITY"],
                        ["config"] = {
                            ["columns"] = {"stat2", "quality"}
                        },
                        ["Items"] = {
                            { ["category"] = 4, ["subCategory"] = 1, ["subSubCategory"] = 4,   ["id"] = { 194573, 194574, 194572 }, ["stat2"] = 1 }, -- Drakonisches Schreiben der Schnellklinge
                            { ["category"] = 4, ["subCategory"] = 1, ["subSubCategory"] = 4,   ["id"] = { 194570, 194571, 194569 }, ["stat2"] = 2 }, -- Drakonisches Schreiben der Aurora
                            { ["category"] = 4, ["subCategory"] = 1, ["subSubCategory"] = 4,   ["id"] = { 194576, 194577, 194575 }, ["stat2"] = 3 }, -- Drakonisches Schreiben der Harmonischen

                        }
                    },
                }
            },
            {
                ["id"] = 2,
                ["name"] =  L["Embellishments"],
                ["config"] = {
                    ["columns"] = {"quality"}
                },
                ["Items"] = {
                    { ["category"] = 4, ["subCategory"] = 2, ["id"] = { 191532, 191533, 191534 }}, -- Potion Absorption Inhibitor
                    { ["category"] = 4, ["subCategory"] = 2, ["id"] = { 191250, 191872, 191873 }}, --Armor Spikes
                    { ["category"] = 4, ["subCategory"] = 2, ["id"] = { 193469, 193552, 193555 }}, -- Toxified Armor Patch
                    { ["category"] = 4, ["subCategory"] = 2, ["id"] = { 193468, 193551, 193554 }}, -- Fang Adornments
                    { ["category"] = 4, ["subCategory"] = 2, ["id"] = { 193944, 193945, 193946 }}, -- Blue Silken Lining
                    { ["category"] = 4, ["subCategory"] = 2, ["id"] = { 193941, 193942, 193943 }}, -- Bronzed Grip Wrappings
                    { ["category"] = 4, ["subCategory"] = 2, ["id"] = 200652 }, -- Alchemical Flavor Pocket
                    { ["category"] = 4, ["subCategory"] = 2, ["id"] = 205012 }, -- Reserve Parachute
                    { ["category"] = 4, ["subCategory"] = 2, ["id"] = 205411 }, -- Medical Wrap Kit
                    { ["category"] = 4, ["subCategory"] = 2, ["id"] = { 204708, 204709, 204710 }}, -- Shadowflame-Tempered Armor Patch
                    { ["category"] = 4, ["subCategory"] = 2, ["id"] = { 204909, 205115, 205170 }}, -- Statuette of Foreseen Power
                    { ["category"] = 4, ["subCategory"] = 2, ["id"] = { 205171, 205172, 205173 }}, -- Figurine of the Gathering Storm
                    { ["category"] = 4, ["subCategory"] = 2, ["id"] = 203652 }, -- Gaunahs Allzweck-Verzierungspulver
                }
            }
        }
    }
}