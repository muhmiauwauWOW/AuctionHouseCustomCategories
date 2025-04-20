local Data = AHCC:NewModule("DATA_TWW_Categories", AHCC_DATA)
local L, _ = AHCC:GetLibs()


Data.Config = {
    expansionLevel = 10
} 


Data.Categories = {
    
    {
        name = L["Enchants"],
        id = "enchants",
        categories =  {
            { name =  L["SOCKETS"] },
            { name =  L["SHOULDER"] },
            { name =  L["CLOAK"] },
            { name =  L["CHEST"] },
            { name =  L["WRIST"] },
            -- { name =  L["WAIST"] },
            { name =  L["LEGS"] },
            { name =  L["FEET"] },
            { name =  L["FINGER"] ,  columns = {"Stat1", "Quality"}},
            { name =  L["WEAPON"] },
            { name =  L["TOOL"] }
        }
    },
    {
        name =  L["Gems"],
        id = "gems",
        columns = {"Stat1", "Stat2", "Quality"},
        categories =  {
            { name = L["PRISMATIC_GEM"] },
            { name = L["CRITICAL_STRIKE"], columns = {"Stat2", "Quality"} },
            { name = L["HASTE"], columns = {"Stat2", "Quality"} },
            { name = L["MASTERY"], columns = {"Stat2", "Quality"} },
            { name = L["VERSATILITY"], columns = {"Stat2", "Quality"} },

        }
    },
    {
        name =  L["Consumables"],
        id = "consumables",
        categories =  {
            { name = L["Runes"] },
            { name = L["Flasks"] },
            { name = L["Potions"] },
            { name = L["Food"] }
        }
    },
    {
        name =  L["Optional Reagents"],
        id = "optionalReagents",
        categories =  {
            { 
                name = L["Algari Missive"],
                columns = {"Stat1", "Stat2", "Quality"},
                categories =  {
                    { name = L["CRITICAL_STRIKE"], columns = {"Stat2", "Quality"} },
                    { name = L["HASTE"], columns = {"Stat2", "Quality"} },
                    { name = L["MASTERY"], columns = {"Stat2", "Quality"} },
                    { name = L["VERSATILITY"], columns = {"Stat2", "Quality"} },
            }
            },
            { name = L["Embellishments"]}
        }
    },
}


