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
            ["columns"] = {"stat1", "stat2", "quality"}
        },
        ["subCategories"] = {
            {
                ["name"] = L["CRITICAL_STRIKE"],
                ["config"] = {
                    ["columns"] = {"stat2", "quality"}
                },
                ["Items"] = {
                    { ["id"] = { 192926, 192927, 192928 }, ["stat1"] = 1, ["stat2"] = 0 }, -- Tödlicher Alexstraszit 
                    { ["id"] = { 192917, 192918, 192919 }, ["stat1"] = 1, ["stat2"] = 2 }, -- Listiger Alexstraszit 
                    { ["id"] = { 192920, 192921, 192922 }, ["stat1"] = 1, ["stat2"] = 3 }, -- Alexstraszit des Mentors 
                    { ["id"] = { 192923, 192924, 192925 }, ["stat1"] = 1, ["stat2"] = 4 }, -- Strahlender Alexstraszit 
                },
            },
            {
                ["name"] = L["HASTE"],
                ["config"] = {
                    ["columns"] = {"stat2", "quality"}
                },
                ["Items"] = {
                    { ["id"] = { 192953, 192954, 192955 }, ["stat1"] = 2, ["stat2"] = 0 }, -- Spiegelnder Ysmaragd 
                    { ["id"] = { 192943, 192944, 192945 }, ["stat1"] = 2, ["stat2"] = 1 }, -- Listiger Ysmaragd 
                    { ["id"] = { 192946, 192947, 192948 }, ["stat1"] = 2, ["stat2"] = 3 }, -- Schneidender Ysmaragd 
                    { ["id"] = { 192950, 192951, 192952 }, ["stat1"] = 2, ["stat2"] = 4 }, -- Geladener Ysmaragd 
                },
            },
            {
                ["name"] = L["MASTERY"],
                ["config"] = {
                    ["columns"] = {"stat2", "quality"}
                },
                ["Items"] = {
                    { ["id"] = { 192965, 192966, 192967 }, ["stat1"] = 3, ["stat2"] = 0 }, -- Rissiger Neltharit 
                    { ["id"] = { 192956, 192957, 192958 }, ["stat1"] = 3, ["stat2"] = 1 }, -- Neltharit des Mentors 
                    { ["id"] = { 192959, 192960, 192961 }, ["stat1"] = 3, ["stat2"] = 2 }, -- Schneidender Neltharit 
                    { ["id"] = { 192962, 192963, 192964 }, ["stat1"] = 3, ["stat2"] = 4 }, -- Meditativer Neltharit 
                },
            },
            {
                ["name"] = L["VERSATILITY"],
                ["config"] = {
                    ["columns"] = {"stat2", "quality"}
                },
                ["Items"] = {
                    { ["id"] = { 192940, 192941, 192942 }, ["stat1"] = 4, ["stat2"] = 0 }, -- Stürmischer Malygit 
                    { ["id"] = { 192929, 192931, 192932 }, ["stat1"] = 4, ["stat2"] = 1 }, -- Strahlender Malygit 
                    { ["id"] = { 192933, 192934, 192935 }, ["stat1"] = 4, ["stat2"] = 2 }, -- Geladener Malygit 
                    { ["id"] = { 192936, 192937, 192938 }, ["stat1"] = 4, ["stat2"] = 3 }, -- Meditativer Malygit 
                },
            },
            {
                ["name"] = L["STAMINA"],
                ["config"] = {
                    ["columns"] = {"stat2", "quality"}
                },
                ["Items"] = {
                    { ["id"] = { 192968, 192969, 192970 }, ["stat1"] = 5, ["stat2"] = 1 }, -- Gezackter Nozdorit 
                    { ["id"] = { 192971, 192972, 192973 }, ["stat1"] = 5, ["stat2"] = 2 }, -- Kraftvoller Nozdorit 
                    { ["id"] = { 192974, 192975, 192976 }, ["stat1"] = 5, ["stat2"] = 3 }, -- Imposanter Nozdorit 
                    { ["id"] = { 192977, 192978, 192979 }, ["stat1"] = 5, ["stat2"] = 4 }, -- Beständiger Nozdorit 
                },
            }
        },
    },
}









