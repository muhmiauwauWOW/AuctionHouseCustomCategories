local Data = AHCC:NewModule("AHCC_DATA_gems", AHCC_DATA)
local L, _ = AHCC:GetLibs()


Data.Config = {
    mode = "insert",
    nav = {}
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
                    { ["id"] = { 192926, 192927, 192928 }, ["Stat1"] = 1, ["Stat2"] = 0 }, -- Tödlicher Alexstraszit 
                    { ["id"] = { 192917, 192918, 192919 }, ["Stat1"] = 1, ["Stat2"] = 2 }, -- Listiger Alexstraszit 
                    { ["id"] = { 192920, 192921, 192922 }, ["Stat1"] = 1, ["Stat2"] = 3 }, -- Alexstraszit des Mentors 
                    { ["id"] = { 192923, 192924, 192925 }, ["Stat1"] = 1, ["Stat2"] = 4 }, -- Strahlender Alexstraszit 
                },
            },
            {
                ["name"] = L["HASTE"],
                ["config"] = {
                    ["columns"] = {"Stat2", "Quality"}
                },
                ["Items"] = {
                    { ["id"] = { 192953, 192954, 192955 }, ["Stat1"] = 2, ["Stat2"] = 0 }, -- Spiegelnder Ysmaragd 
                    { ["id"] = { 192943, 192944, 192945 }, ["Stat1"] = 2, ["Stat2"] = 1 }, -- Listiger Ysmaragd 
                    { ["id"] = { 192946, 192947, 192948 }, ["Stat1"] = 2, ["Stat2"] = 3 }, -- Schneidender Ysmaragd 
                    { ["id"] = { 192950, 192951, 192952 }, ["Stat1"] = 2, ["Stat2"] = 4 }, -- Geladener Ysmaragd 
                },
            },
            {
                ["name"] = L["MASTERY"],
                ["config"] = {
                    ["columns"] = {"Stat2", "Quality"}
                },
                ["Items"] = {
                    { ["id"] = { 192965, 192966, 192967 }, ["Stat1"] = 3, ["Stat2"] = 0 }, -- Rissiger Neltharit 
                    { ["id"] = { 192956, 192957, 192958 }, ["Stat1"] = 3, ["Stat2"] = 1 }, -- Neltharit des Mentors 
                    { ["id"] = { 192959, 192960, 192961 }, ["Stat1"] = 3, ["Stat2"] = 2 }, -- Schneidender Neltharit 
                    { ["id"] = { 192962, 192963, 192964 }, ["Stat1"] = 3, ["Stat2"] = 4 }, -- Meditativer Neltharit 
                },
            },
            {
                ["name"] = L["VERSATILITY"],
                ["config"] = {
                    ["columns"] = {"Stat2", "Quality"}
                },
                ["Items"] = {
                    { ["id"] = { 192940, 192941, 192942 }, ["Stat1"] = 4, ["Stat2"] = 0 }, -- Stürmischer Malygit 
                    { ["id"] = { 192929, 192931, 192932 }, ["Stat1"] = 4, ["Stat2"] = 1 }, -- Strahlender Malygit 
                    { ["id"] = { 192933, 192934, 192935 }, ["Stat1"] = 4, ["Stat2"] = 2 }, -- Geladener Malygit 
                    { ["id"] = { 192936, 192937, 192938 }, ["Stat1"] = 4, ["Stat2"] = 3 }, -- Meditativer Malygit 
                },
            },
            {
                ["name"] = L["STAMINA"],
                ["config"] = {
                    ["columns"] = {"Stat2", "Quality"}
                },
                ["Items"] = {
                    { ["id"] = { 192968, 192969, 192970 }, ["Stat1"] = 5, ["Stat2"] = 1 }, -- Gezackter Nozdorit 
                    { ["id"] = { 192971, 192972, 192973 }, ["Stat1"] = 5, ["Stat2"] = 2 }, -- Kraftvoller Nozdorit 
                    { ["id"] = { 192974, 192975, 192976 }, ["Stat1"] = 5, ["Stat2"] = 3 }, -- Imposanter Nozdorit 
                    { ["id"] = { 192977, 192978, 192979 }, ["Stat1"] = 5, ["Stat2"] = 4 }, -- Beständiger Nozdorit 
                },
            }
        },
    },
}









