local Data = AHCC:NewModule("AHCC_DATA_gems", AHCC_DATA)
local L, _ = AHCC:GetLibs()

Data.Categories = {
    {
        ["id"] = 2,
        ["name"] = L["Gems"],
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
                    { ["category"] = 2, ["subCategory"] = 1,  ["id"] = { 192926, 192927, 192928 }, ["stat1"] = 1, ["stat2"] = 0 }, -- Tödlicher Alexstraszit 
                    { ["category"] = 2, ["subCategory"] = 1,  ["id"] = { 192917, 192918, 192919 }, ["stat1"] = 1, ["stat2"] = 2 }, -- Listiger Alexstraszit 
                    { ["category"] = 2, ["subCategory"] = 1,  ["id"] = { 192920, 192921, 192922 }, ["stat1"] = 1, ["stat2"] = 3 }, -- Alexstraszit des Mentors 
                    { ["category"] = 2, ["subCategory"] = 1,  ["id"] = { 192923, 192924, 192925 }, ["stat1"] = 1, ["stat2"] = 4 }, -- Strahlender Alexstraszit 
                },
            },
            {
                ["id"] = 2,
                ["name"] = L["HASTE"],
                ["config"] = {
                    ["columns"] = {"stat2", "quality"}
                },
                ["Items"] = {
                    { ["category"] = 2, ["subCategory"] = 2,  ["id"] = { 192953, 192954, 192955 }, ["stat1"] = 2, ["stat2"] = 0 }, -- Spiegelnder Ysmaragd 
                    { ["category"] = 2, ["subCategory"] = 2,  ["id"] = { 192943, 192944, 192945 }, ["stat1"] = 2, ["stat2"] = 1 }, -- Listiger Ysmaragd 
                    { ["category"] = 2, ["subCategory"] = 2,  ["id"] = { 192946, 192947, 192948 }, ["stat1"] = 2, ["stat2"] = 3 }, -- Schneidender Ysmaragd 
                    { ["category"] = 2, ["subCategory"] = 2,  ["id"] = { 192950, 192951, 192952 }, ["stat1"] = 2, ["stat2"] = 4 }, -- Geladener Ysmaragd 
                },
            },
            {
                ["id"] = 3,
                ["name"] = L["MASTERY"],
                ["config"] = {
                    ["columns"] = {"stat2", "quality"}
                },
                ["Items"] = {
                    { ["category"] = 2, ["subCategory"] = 3,  ["id"] = { 192965, 192966, 192967 }, ["stat1"] = 3, ["stat2"] = 0 }, -- Rissiger Neltharit 
                    { ["category"] = 2, ["subCategory"] = 3,  ["id"] = { 192956, 192957, 192958 }, ["stat1"] = 3, ["stat2"] = 1 }, -- Neltharit des Mentors 
                    { ["category"] = 2, ["subCategory"] = 3,  ["id"] = { 192959, 192960, 192961 }, ["stat1"] = 3, ["stat2"] = 2 }, -- Schneidender Neltharit 
                    { ["category"] = 2, ["subCategory"] = 3,  ["id"] = { 192962, 192963, 192964 }, ["stat1"] = 3, ["stat2"] = 4 }, -- Meditativer Neltharit 
                },
            },
            {
                ["id"] = 4,
                ["name"] = L["VERSATILITY"],
                ["config"] = {
                    ["columns"] = {"stat2", "quality"}
                },
                ["Items"] = {
                    { ["category"] = 2, ["subCategory"] = 4,  ["id"] = { 192940, 192941, 192942 }, ["stat1"] = 4, ["stat2"] = 0 }, -- Stürmischer Malygit 
                    { ["category"] = 2, ["subCategory"] = 4,  ["id"] = { 192929, 192931, 192932 }, ["stat1"] = 4, ["stat2"] = 1 }, -- Strahlender Malygit 
                    { ["category"] = 2, ["subCategory"] = 4,  ["id"] = { 192933, 192934, 192935 }, ["stat1"] = 4, ["stat2"] = 2 }, -- Geladener Malygit 
                    { ["category"] = 2, ["subCategory"] = 4,  ["id"] = { 192936, 192937, 192938 }, ["stat1"] = 4, ["stat2"] = 3 }, -- Meditativer Malygit 
                },
            },
            {
                ["id"] = 5,
                ["name"] = L["STAMINA"],
                ["config"] = {
                    ["columns"] = {"stat2", "quality"}
                },
                ["Items"] = {
                    { ["category"] = 2, ["subCategory"] = 5,  ["id"] = { 192968, 192969, 192970 }, ["stat1"] = 5, ["stat2"] = 1 }, -- Gezackter Nozdorit 
                    { ["category"] = 2, ["subCategory"] = 5,  ["id"] = { 192971, 192972, 192973 }, ["stat1"] = 5, ["stat2"] = 2 }, -- Kraftvoller Nozdorit 
                    { ["category"] = 2, ["subCategory"] = 5,  ["id"] = { 192974, 192975, 192976 }, ["stat1"] = 5, ["stat2"] = 3 }, -- Imposanter Nozdorit 
                    { ["category"] = 2, ["subCategory"] = 5,  ["id"] = { 192977, 192978, 192979 }, ["stat1"] = 5, ["stat2"] = 4 }, -- Beständiger Nozdorit 
                },
            }
        },
    },
}









