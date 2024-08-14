local Data = AHCC:NewModule("AHCC_DATA_DF_enchants", AHCC_DATA)
local L, _ = AHCC:GetLibs()


Data.Config = {
    mode = "insert",
    nav = {},
    expansionLevel = 9
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
                    { ["id"] = { 204568, 204565, 204567 } }, -- Illusorische Verzierung: Sporen
                    { ["id"] = { 201315, 201314, 201313 } }, -- Illusorische Verzierung: Erde
                    { ["id"] = { 200614, 200615, 200616 } }, -- Illusorische Verzierung: Feuer
                    { ["id"] = { 201321, 201320, 201319 } }, -- Illusorische Verzierung: Ordnung
                    { ["id"] = { 201318, 201317, 201316 } }, -- Illusorische Verzierung: Luft
                }
            },
            {
                ["name"] = L["CLOAK"],
                ["Items"] = {
                    { ["id"] = { 199949, 199991, 200033 } }, -- Umhang - Regenerativer Lebensraub 
                    { ["id"] = { 199948, 199990, 200032 } }, -- Umhang - Schnelle Heimkehr 
                    { ["id"] = { 199947, 199989, 200031 } }, -- Umhang - Anmutiges Ausweichen 
                }
            },
            {
                ["name"] = L["CHEST"],
                ["Items"] = {
                    { ["id"] = { 199944, 199986, 200028 } }, -- Brustrüstung - Reserve der Intelligenz 
                    { ["id"] = { 199945, 199987, 200029 } }, -- Brustrüstung - Anhaltende Stärke 
                    { ["id"] = { 199946, 199988, 200030 } }, -- Brustrüstung - Erweckte Werte 
                }
            },
            {
                ["name"] = L["WRIST"],
                ["Items"] = {
                    { ["id"] = { 199937, 199979, 200021 } }, -- Armschienen - Hingabe der Vermeidung 
                    { ["id"] = { 199938, 199980, 200022 } }, -- Armschienen - Hingabe des Lebensraubs 
                    { ["id"] = { 199939, 199981, 200023 } }, -- Armschienen - Hingabe der Geschwindigkeit 
                }
            },
            {
                ["name"] = L["WAIST"],
                ["Items"] = {
                    { ["id"] = { 205043, 205044, 205039 } }, -- Überschattete Gürtelschnalle 
                }
            },
            {
                ["name"] = L["LEGS"],
                ["Items"] = {
                    { ["id"] = { 194011, 194012, 194013 } }, -- Gefrorener Zauberfaden 
                    { ["id"] = { 194014, 194015, 194016 } }, -- Temporaler Zauberfaden 
                    { ["id"] = { 194008, 194009, 194010 } }, -- Schillernder Zauberfaden 
                    { ["id"] = { 204700, 204701, 204702 } }, -- Flackerndes Aufwertungsset 
                    { ["id"] = { 193557, 193561, 193565 } }, -- Wildes Aufwertungsset 
                    { ["id"] = { 193556, 193560, 193564 } }, -- Frostiges Aufwertungsset 
                    { ["id"] = { 193559, 193563, 193567 } }, -- Verstärktes Aufwertungsset 
                }
            },
            {
                ["name"] = L["FEET"],
                ["Items"] = {
                    { ["id"] = { 199934, 199976, 200018 } }, -- Stiefel - Brise des Ebenenläufers 
                    { ["id"] = { 199935, 199977, 200019 } }, -- Stiefel - Sicherheit des Reiters 
                    { ["id"] = { 199936, 199978, 200020 } }, -- Stiefel - Lehm des Hüters 
                }
            },
            {
                ["name"] = L["FINGER"],
                ["Items"] = {
                    { ["id"] = { 199953, 199995, 200037 } }, -- Ring - Hingabe des kritischen Trefferwerts 
                    { ["id"] = { 199954, 199996, 200038 } }, -- Ring - Hingabe des Tempos 
                    { ["id"] = { 199955, 199997, 200039 } }, -- Ring - Hingabe der Meisterschaft 
                    { ["id"] = { 199956, 199998, 200040 } }, -- Ring - Hingabe der Vielseitigkeit 
                }
            },
            {
                ["name"] = L["WEAPON"],
                ["Items"] = {
                    { ["id"] = { 204621, 204622, 204623 } }, -- Waffe - Umhüllung der Schattenflamme 
                    { ["id"] = { 204613, 204614, 204615 } }, -- Waffe - Sporenhirte 
                    { ["id"] = { 199966, 200008, 200050 } }, -- Waffe - Brennende Hingabe 
                    { ["id"] = { 199967, 200009, 200051 } }, -- Waffe - Brennende Schrift 
                    { ["id"] = { 199968, 200010, 200052 } }, -- Waffe - Irdene Hingabe 
                    { ["id"] = { 199969, 200011, 200053 } }, -- Waffe - Irdene Schrift 
                    { ["id"] = { 199970, 200012, 200054 } }, -- Waffe - Weise Hingabe 
                    { ["id"] = { 199971, 200013, 200055 } }, -- Waffe - Weise Verfügung 
                    { ["id"] = { 199972, 200014, 200056 } }, -- Waffe - Gefrorene Hingabe 
                    { ["id"] = { 199973, 200015, 200057 } }, -- Waffe - Gefrorene Schrift 
                    { ["id"] = { 199974, 200016, 200058 } }, -- Waffe - Wehende Hingabe 
                    { ["id"] = { 199975, 200017, 200059 } }, -- Waffe - Wehende Schrift 
                }
            },
            {
                ["name"] = L["RANGED"],
                ["Items"] = {
                    { ["id"] = { 198313, 198314, 198315 } }, -- Geschossschleudertrieb 
                    { ["id"] = { 198316, 198317, 198318 } }, -- Hochleistungsthermoscanner 
                    { ["id"] = { 198310, 198311, 198312 } }, -- Gyroskopisches Kaleidoskop 
                }
            },
            {
                ["name"] = L["TOOL"],
                ["Items"] = {
                    { ["id"] = { 199961, 200003, 200045 } }, -- Enchant Tool - Draconic Deftness
                    { ["id"] = { 199962, 200004, 200046 } }, -- Enchant Tool - Draconic Finesse
                    { ["id"] = { 199963, 200005, 200047 } }, -- Enchant Tool - Draconic Ingenuity
                    { ["id"] = { 199964, 200006, 200048 } }, -- Enchant Tool - Draconic Perception
                    { ["id"] = { 199965, 200007, 200049 } }, -- Enchant Tool - Draconic Resourcefulness
                    { ["id"] = { 223693, 223694, 223695 }, ["versionStart"] = 110020 }, -- Enchant Tool - Algari Deftness
                    { ["id"] = { 223696, 223697, 223698 }, ["versionStart"] = 110020 }, -- Enchant Tool - Algari Finesse
                    { ["id"] = { 223699, 223700, 223701 }, ["versionStart"] = 110020 }, -- Enchant Tool - Algari Ingenuity
                    { ["id"] = { 223702, 223703, 223704 }, ["versionStart"] = 110020 }, -- Enchant Tool - Algari Perception
                    { ["id"] = { 223705, 223706, 223707 }, ["versionStart"] = 110020 }, -- Enchant Tool - Algari Resourcefulness
                }
            },
        }
    }
}
