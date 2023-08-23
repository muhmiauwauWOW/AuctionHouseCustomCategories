local Data = AHCC:NewModule("AHCC_DATA_enchants", AHCC_DATA)
local L, _ = AHCC:GetLibs()


Data.Config = {
    mode = "insert",
    nav = {}
} 

Data.Categories = {
    {
        ["name"] =  L["Enchants"],
        ["subCategories"] = {
            {
                ["name"] = L["NECK"],
                ["Items"] = {
                    { ["id"] = { 192992, 192993, 192994 } }, -- Gestufte Medaillonfassung
                }
            },
            {
                ["name"] = L["SHOULDER"],
                ["Items"] = {
                    { ["category"] = 1, ["subCategory"] = 2,  ["id"] = { 204568, 204565, 204567 } }, -- Illusorische Verzierung: Sporen
                    { ["category"] = 1, ["subCategory"] = 2,  ["id"] = { 201315, 201314, 201313 } }, -- Illusorische Verzierung: Erde
                    { ["category"] = 1, ["subCategory"] = 2,  ["id"] = { 200614, 200615, 200616 } }, -- Illusorische Verzierung: Feuer
                    { ["category"] = 1, ["subCategory"] = 2,  ["id"] = { 201321, 201320, 201319 } }, -- Illusorische Verzierung: Ordnung
                    { ["category"] = 1, ["subCategory"] = 2,  ["id"] = { 201318, 201317, 201316 } }, -- Illusorische Verzierung: Luft
                }
            },
            {
                ["name"] = L["CLOAK"],
                ["Items"] = {
                    { ["category"] = 1, ["subCategory"] = 3,  ["id"] = { 199949, 199991, 200033 } }, -- Umhang - Regenerativer Lebensraub
                    { ["category"] = 1, ["subCategory"] = 3,  ["id"] = { 199949, 199991, 200033 } }, -- Umhang - Regenerativer Lebensraub
                    { ["category"] = 1, ["subCategory"] = 3,  ["id"] = { 199949, 199991, 200033 } }, -- Umhang - Regenerativer Lebensraub 
                    { ["category"] = 1, ["subCategory"] = 3,  ["id"] = { 199948, 199990, 200032 } }, -- Umhang - Schnelle Heimkehr 
                    { ["category"] = 1, ["subCategory"] = 3,  ["id"] = { 199947, 199989, 200031 } }, -- Umhang - Anmutiges Ausweichen 
                }
            },
            {
                ["name"] = L["CHEST"],
                ["Items"] = {
                    { ["category"] = 1, ["subCategory"] = 4,  ["id"] = { 199944, 199986, 200028 } }, -- Brustrüstung - Reserve der Intelligenz 
                    { ["category"] = 1, ["subCategory"] = 4,  ["id"] = { 199945, 199987, 200029 } }, -- Brustrüstung - Anhaltende Stärke 
                    { ["category"] = 1, ["subCategory"] = 4,  ["id"] = { 199946, 199988, 200030 } }, -- Brustrüstung - Erweckte Werte 
                }
            },
            {
                ["name"] = L["WRIST"],
                ["Items"] = {
                    { ["category"] = 1, ["subCategory"] = 5,  ["id"] = { 199937, 199979, 200021 } }, -- Armschienen - Hingabe der Vermeidung 
                    { ["category"] = 1, ["subCategory"] = 5,  ["id"] = { 199938, 199980, 200022 } }, -- Armschienen - Hingabe des Lebensraubs 
                    { ["category"] = 1, ["subCategory"] = 5,  ["id"] = { 199939, 199981, 200023 } }, -- Armschienen - Hingabe der Geschwindigkeit 
                }
            },
            {
                ["name"] = L["WAIST"],
                ["Items"] = {
                    { ["category"] = 1, ["subCategory"] = 6,  ["id"] = { 205043, 205044, 205039 } }, -- Überschattete Gürtelschnalle 
                }
            },
            {
                ["name"] = L["LEGS"],
                ["Items"] = {
                    { ["category"] = 1, ["subCategory"] = 7,  ["id"] = { 194011, 194012, 194013 } }, -- Gefrorener Zauberfaden 
                    { ["category"] = 1, ["subCategory"] = 7,  ["id"] = { 194014, 194015, 194016 } }, -- Temporaler Zauberfaden 
                    { ["category"] = 1, ["subCategory"] = 7,  ["id"] = { 194008, 194009, 194010 } }, -- Schillernder Zauberfaden 
                    { ["category"] = 1, ["subCategory"] = 7,  ["id"] = { 204700, 204701, 204702 } }, -- Flackerndes Aufwertungsset 
                    { ["category"] = 1, ["subCategory"] = 7,  ["id"] = { 193557, 193561, 193565 } }, -- Wildes Aufwertungsset 
                    { ["category"] = 1, ["subCategory"] = 7,  ["id"] = { 193556, 193560, 193564 } }, -- Frostiges Aufwertungsset 
                    { ["category"] = 1, ["subCategory"] = 7,  ["id"] = { 193559, 193563, 193567 } }, -- Verstärktes Aufwertungsset 
                }
            },
            {
                ["name"] = L["FEET"],
                ["Items"] = {
                    { ["category"] = 1, ["subCategory"] = 8,  ["id"] = { 199934, 199976, 200018 } }, -- Stiefel - Brise des Ebenenläufers 
                    { ["category"] = 1, ["subCategory"] = 8,  ["id"] = { 199935, 199977, 200019 } }, -- Stiefel - Sicherheit des Reiters 
                    { ["category"] = 1, ["subCategory"] = 8,  ["id"] = { 199936, 199978, 200020 } }, -- Stiefel - Lehm des Hüters 
                }
            },
            {
                ["name"] = L["FINGER"],
                ["Items"] = {
                    { ["category"] = 1, ["subCategory"] = 9,  ["id"] = { 199953, 199995, 200037 } }, -- Ring - Hingabe des kritischen Trefferwerts 
                    { ["category"] = 1, ["subCategory"] = 9,  ["id"] = { 199954, 199996, 200038 } }, -- Ring - Hingabe des Tempos 
                    { ["category"] = 1, ["subCategory"] = 9,  ["id"] = { 199955, 199997, 200039 } }, -- Ring - Hingabe der Meisterschaft 
                    { ["category"] = 1, ["subCategory"] = 9,  ["id"] = { 199956, 199998, 200040 } }, -- Ring - Hingabe der Vielseitigkeit 
                }
            },
            {
                ["name"] = L["WEAPON"],
                ["Items"] = {
                    { ["category"] = 1, ["subCategory"] = 10,  ["id"] = { 204621, 204622, 204623 } }, -- Waffe - Umhüllung der Schattenflamme 
                    { ["category"] = 1, ["subCategory"] = 10,  ["id"] = { 204613, 204614, 204615 } }, -- Waffe - Sporenhirte 
                    { ["category"] = 1, ["subCategory"] = 10,  ["id"] = { 199966, 200008, 200050 } }, -- Waffe - Brennende Hingabe 
                    { ["category"] = 1, ["subCategory"] = 10,  ["id"] = { 199967, 200009, 200051 } }, -- Waffe - Brennende Schrift 
                    { ["category"] = 1, ["subCategory"] = 10,  ["id"] = { 199968, 200010, 200052 } }, -- Waffe - Irdene Hingabe 
                    { ["category"] = 1, ["subCategory"] = 10,  ["id"] = { 199969, 200011, 200053 } }, -- Waffe - Irdene Schrift 
                    { ["category"] = 1, ["subCategory"] = 10,  ["id"] = { 199970, 200012, 200054 } }, -- Waffe - Weise Hingabe 
                    { ["category"] = 1, ["subCategory"] = 10,  ["id"] = { 199971, 200013, 200055 } }, -- Waffe - Weise Verfügung 
                    { ["category"] = 1, ["subCategory"] = 10,  ["id"] = { 199972, 200014, 200056 } }, -- Waffe - Gefrorene Hingabe 
                    { ["category"] = 1, ["subCategory"] = 10,  ["id"] = { 199973, 200015, 200057 } }, -- Waffe - Gefrorene Schrift 
                    { ["category"] = 1, ["subCategory"] = 10,  ["id"] = { 199974, 200016, 200058 } }, -- Waffe - Wehende Hingabe 
                    { ["category"] = 1, ["subCategory"] = 10,  ["id"] = { 199975, 200017, 200059 } }, -- Waffe - Wehende Schrift 
                }
            },
            {
                ["name"] = L["RANGED"],
                ["Items"] = {
                    { ["category"] = 1, ["subCategory"] = 11,  ["id"] = { 198313, 198314, 198315 } }, -- Geschossschleudertrieb 
                    { ["category"] = 1, ["subCategory"] = 11,  ["id"] = { 198316, 198317, 198318 } }, -- Hochleistungsthermoscanner 
                    { ["category"] = 1, ["subCategory"] = 11,  ["id"] = { 198310, 198311, 198312 } }, -- Gyroskopisches Kaleidoskop 
                }
            }
        }
    }
}