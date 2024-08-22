local Data = AHCC:NewModule("DATA_DF_Items", AHCC_DATA)
local L, _ = AHCC:GetLibs()

Data.Config = {
    expansionLevel = 9
} 

local function getCategoryId(name, ...)
    _.forEach({...}, function(v)
        name = name .. " " .. L[v]
    end)    
    return name:gsub(" ", "_")
end

Data.Items = {
    [getCategoryId("enchants", "NECK")] = {
        { ["id"] = { 192992, 192993, 192994 } }, -- Gestufte Medaillonfassung
    },
    [getCategoryId("enchants", "SHOULDER")] = {
        { ["id"] = { 204568, 204565, 204567 } }, -- Illusorische Verzierung: Sporen
        { ["id"] = { 201315, 201314, 201313 } }, -- Illusorische Verzierung: Erde
        { ["id"] = { 200614, 200615, 200616 } }, -- Illusorische Verzierung: Feuer
        { ["id"] = { 201321, 201320, 201319 } }, -- Illusorische Verzierung: Ordnung
        { ["id"] = { 201318, 201317, 201316 } }, -- Illusorische Verzierung: Luft
    },
    [getCategoryId("enchants", "CLOAK")] = {
        { ["id"] = { 199949, 199991, 200033 } }, -- Umhang - Regenerativer Lebensraub 
        { ["id"] = { 199948, 199990, 200032 } }, -- Umhang - Schnelle Heimkehr 
        { ["id"] = { 199947, 199989, 200031 } }, -- Umhang - Anmutiges Ausweichen 
    },
    [getCategoryId("enchants", "CHEST")] = {
        { ["id"] = { 199944, 199986, 200028 } }, -- Brustrüstung - Reserve der Intelligenz 
        { ["id"] = { 199945, 199987, 200029 } }, -- Brustrüstung - Anhaltende Stärke 
        { ["id"] = { 199946, 199988, 200030 } }, -- Brustrüstung - Erweckte Werte 
    },
    [getCategoryId("enchants", "WRIST")] = {
        { ["id"] = { 199937, 199979, 200021 } }, -- Armschienen - Hingabe der Vermeidung 
        { ["id"] = { 199938, 199980, 200022 } }, -- Armschienen - Hingabe des Lebensraubs 
        { ["id"] = { 199939, 199981, 200023 } }, -- Armschienen - Hingabe der Geschwindigkeit 
    },
    [getCategoryId("enchants", "WAIST")] = {
        { ["id"] = { 205043, 205044, 205039 } }, -- Überschattete Gürtelschnalle 
    },
    [getCategoryId("enchants", "LEGS")] = {
        { ["id"] = { 194011, 194012, 194013 } }, -- Gefrorener Zauberfaden 
        { ["id"] = { 194014, 194015, 194016 } }, -- Temporaler Zauberfaden 
        { ["id"] = { 194008, 194009, 194010 } }, -- Schillernder Zauberfaden 
        { ["id"] = { 204700, 204701, 204702 } }, -- Flackerndes Aufwertungsset 
        { ["id"] = { 193557, 193561, 193565 } }, -- Wildes Aufwertungsset 
        { ["id"] = { 193556, 193560, 193564 } }, -- Frostiges Aufwertungsset 
        { ["id"] = { 193559, 193563, 193567 } }, -- Verstärktes Aufwertungsset 
    },
    [getCategoryId("enchants", "FEET")] = {
        { ["id"] = { 199934, 199976, 200018 } }, -- Stiefel - Brise des Ebenenläufers 
        { ["id"] = { 199935, 199977, 200019 } }, -- Stiefel - Sicherheit des Reiters 
        { ["id"] = { 199936, 199978, 200020 } }, -- Stiefel - Lehm des Hüters 
    },
    [getCategoryId("enchants", "FINGER")] ={
        { ["id"] = { 199953, 199995, 200037 } }, -- Ring - Hingabe des kritischen Trefferwerts 
        { ["id"] = { 199954, 199996, 200038 } }, -- Ring - Hingabe des Tempos 
        { ["id"] = { 199955, 199997, 200039 } }, -- Ring - Hingabe der Meisterschaft 
        { ["id"] = { 199956, 199998, 200040 } }, -- Ring - Hingabe der Vielseitigkeit 
    },
    [getCategoryId("enchants", "WEAPON")] = {
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
    },
    [getCategoryId("enchants", "RANGED")] = {
        { ["id"] = { 198313, 198314, 198315 } }, -- Geschossschleudertrieb 
        { ["id"] = { 198316, 198317, 198318 } }, -- Hochleistungsthermoscanner 
        { ["id"] = { 198310, 198311, 198312 } }, -- Gyroskopisches Kaleidoskop 
    },
    [getCategoryId("enchants", "TOOL")] = {
        { ["id"] = { 199961, 200003, 200045 } }, -- Enchant Tool - Draconic Deftness
        { ["id"] = { 199962, 200004, 200046 } }, -- Enchant Tool - Draconic Finesse
        { ["id"] = { 199963, 200005, 200047 } }, -- Enchant Tool - Draconic Ingenuity
        { ["id"] = { 199964, 200006, 200048 } }, -- Enchant Tool - Draconic Perception
        { ["id"] = { 199965, 200007, 200049 } }, -- Enchant Tool - Draconic Resourcefulness
    }
    ,[getCategoryId("gems", "CRITICAL_STRIKE")] = {
        { ["id"] = { 192926, 192927, 192928 }, ["Stat1"] = 1, ["Stat2"] = 0 }, -- Tödlicher Alexstraszit 
        { ["id"] = { 192917, 192918, 192919 }, ["Stat1"] = 1, ["Stat2"] = 2 }, -- Listiger Alexstraszit 
        { ["id"] = { 192920, 192921, 192922 }, ["Stat1"] = 1, ["Stat2"] = 3 }, -- Alexstraszit des Mentors 
        { ["id"] = { 192923, 192924, 192925 }, ["Stat1"] = 1, ["Stat2"] = 4 }, -- Strahlender Alexstraszit 
    }
    ,[getCategoryId("gems", "HASTE")] = {
        { ["id"] = { 192953, 192954, 192955 }, ["Stat1"] = 2, ["Stat2"] = 0 }, -- Spiegelnder Ysmaragd 
        { ["id"] = { 192943, 192944, 192945 }, ["Stat1"] = 2, ["Stat2"] = 1 }, -- Listiger Ysmaragd 
        { ["id"] = { 192946, 192947, 192948 }, ["Stat1"] = 2, ["Stat2"] = 3 }, -- Schneidender Ysmaragd 
        { ["id"] = { 192950, 192951, 192952 }, ["Stat1"] = 2, ["Stat2"] = 4 }, -- Geladener Ysmaragd 
    }
    ,[getCategoryId("gems", "MASTERY")] = {
        { ["id"] = { 192965, 192966, 192967 }, ["Stat1"] = 3, ["Stat2"] = 0 }, -- Rissiger Neltharit 
        { ["id"] = { 192956, 192957, 192958 }, ["Stat1"] = 3, ["Stat2"] = 1 }, -- Neltharit des Mentors 
        { ["id"] = { 192959, 192960, 192961 }, ["Stat1"] = 3, ["Stat2"] = 2 }, -- Schneidender Neltharit 
        { ["id"] = { 192962, 192963, 192964 }, ["Stat1"] = 3, ["Stat2"] = 4 }, -- Meditativer Neltharit 
    }
    ,[getCategoryId("gems", "VERSATILITY")] = {
        { ["id"] = { 192940, 192941, 192942 }, ["Stat1"] = 4, ["Stat2"] = 0 }, -- Stürmischer Malygit 
        { ["id"] = { 192929, 192931, 192932 }, ["Stat1"] = 4, ["Stat2"] = 1 }, -- Strahlender Malygit 
        { ["id"] = { 192933, 192934, 192935 }, ["Stat1"] = 4, ["Stat2"] = 2 }, -- Geladener Malygit 
        { ["id"] = { 192936, 192937, 192938 }, ["Stat1"] = 4, ["Stat2"] = 3 }, -- Meditativer Malygit 
    }
    ,[getCategoryId("gems", "STAMINA")] = {
        { ["id"] = { 192968, 192969, 192970 }, ["Stat1"] = 5, ["Stat2"] = 1 }, -- Gezackter Nozdorit 
        { ["id"] = { 192971, 192972, 192973 }, ["Stat1"] = 5, ["Stat2"] = 2 }, -- Kraftvoller Nozdorit 
        { ["id"] = { 192974, 192975, 192976 }, ["Stat1"] = 5, ["Stat2"] = 3 }, -- Imposanter Nozdorit 
        { ["id"] = { 192977, 192978, 192979 }, ["Stat1"] = 5, ["Stat2"] = 4 }, -- Beständiger Nozdorit 
    }
    ,[getCategoryId("consumables", "Runes")] = {
        { ["id"] = { 198491, 198492, 198493 }, ["versionStart"] = 100000 }, -- Vantus Rune: Vault of the Incarnates
        { ["id"] = { 204858, 204859, 204860 }, ["versionStart"] = 100100 }, -- Vantus Rune: Aberrus, the Shadowed Crucible
        { ["id"] = { 210247, 210248, 210249 }, ["versionStart"] = 100200 }, -- Vantus Rune: Amirdrassil, the Dream's Hope
        { ["id"] = { 194817, 194819, 194820 } }, -- Heulrune 
        { ["id"] = { 194821, 194822, 194823 } }, -- Summrune 
        { ["id"] = { 204971, 204972, 204973 } }, -- Zischende Rune 
        { ["id"] = { 194824, 194825, 194826 } }, -- Zwitscherrune 
        { ["id"] = { 198160, 198161, 198162 } }, -- Vollkommen sichere Raketen 
        { ["id"] = { 198163, 198164, 198165 } }, -- Endloser Nadelhaufen 
        { ["id"] = { 191933, 191939, 191940 } }, -- Urzeitlicher Schleifstein 
        { ["id"] = { 191943, 191944, 191945 } }, -- Urzeitlicher Gewichtsstein 
    }
    ,[getCategoryId("consumables", "Flasks")] = {
        { ["id"] = { 191327, 191328, 191329 } }, -- Eisige Phiole der verderbenden Wut 
        { ["id"] = { 191330, 191331, 191332 } }, -- Phiole der aufgeladenen Isolation 
        { ["id"] = { 191333, 191334, 191335 } }, -- Phiole des eisigen Zorns 
        { ["id"] = { 191336, 191337, 191338 } }, -- Phiole der statischen Ermächtigung 
        { ["id"] = { 191318, 191319, 191320 } }, -- Phiole des Auges im Sturm 
        { ["id"] = { 191357, 191358, 191359 } }, -- Phiole des elementaren Chaos 
        { ["id"] = { 191348, 191349, 191350 } }, -- Aufgeladene Phiole der Inbrunst 
        { ["id"] = { 191339, 191340, 191341 } }, -- Phiole der mäßigen Vielseitigkeit 
        { ["id"] = { 191324, 191325, 191326 } }, -- Phiole der eisigen Konservierung 
        { ["id"] = { 191321, 191322, 191323 } }, -- Phiole der stillen Luft 
    }
    ,[getCategoryId("consumables", "Potions")] = {
        { ["id"] = { 191384, 191385, 191386 } }, -- Lufterfüllter Manatrank 
        { ["id"] = { 191360, 191361, 191362 } }, -- Fäulnis in der Flasche 
        { ["id"] = { 191375, 191376, 191377 } }, -- Empfindliche Sporensuspension 
        { ["id"] = { 191387, 191388, 191389 } }, -- Elementartrank der Macht 
        { ["id"] = { 191381, 191382, 191383 } }, -- Elementartrank der ultimativen Macht 
        { ["id"] = { 191366, 191367, 191368 } }, -- Trank der kühlen Klarheit 
        { ["id"] = { 191351, 191352, 191353 } }, -- Trank des gefrorenen Verhängnisses 
        { ["id"] = { 191363, 191364, 191365 } }, -- Trank des gefrorenen Fokus 
        { ["id"] = { 191396, 191397, 191398 } }, -- Trank der Böen 
        { ["id"] = { 191399, 191400, 191401 } }, -- Trank der schockierenden Offenbarung 
        { ["id"] = { 191393, 191394, 191395 } }, -- Trank des verstummten Zephyrs 
        { ["id"] = { 191369, 191370, 191371 } }, -- Trank der welkenden Vitalität 
        { ["id"] = { 207021, 207022, 207023 } }, -- Dreamwalker's Healing Potion
        { ["id"] = { 207039, 207040, 207041 } }, -- Potion of Withering Dreams
        { ["id"] = { 191372, 191373, 191374 } }, -- Residualer Wirkstoff der Neuralkanalisierung 
    }
    ,[getCategoryId("consumables", "Food")] = {
        { ["id"] = 204072 }, -- Teuflisch gefüllte Eier
        { ["id"] = 197792 }, -- Schicksalhafter Glückskeks

        { ["id"] = 197793 }, -- Yusas herzhafter Eintopf
        { ["id"] = 197795 }, -- Vorrat an drakonischen Delikatessen
        { ["id"] = 197794 }, -- Großbankett der Kalu'ak
    }
    ,[getCategoryId("optionalReagents", "Draconic Missive", "CRITICAL_STRIKE")] = {
        { ["id"] = { 192553, 192554, 192552 }, ["Stat1"] = 1, ["Stat2"] = 2 }, -- Drakonisches Schreiben des Feuerpeitsche
        { ["id"] = { 194579, 194580, 194578 }, ["Stat1"] = 1, ["Stat2"] = 3 }, -- Drakonisches Schreiben der Unvergleichlichkeit
        { ["id"] = { 194573, 194574, 194572 }, ["Stat1"] = 1, ["Stat2"] = 4 }, -- Drakonisches Schreiben der Schnellklinge
    }
    ,[getCategoryId("optionalReagents", "Draconic Missive", "HASTE")] = {
        { ["id"] = { 192553, 192554, 192552 }, ["Stat1"] = 2, ["Stat2"] = 1 }, -- Drakonisches Schreiben des Feuerpeitsche
        { ["id"] = { 194567, 194568, 194566 }, ["Stat1"] = 2, ["Stat2"] = 3 }, -- Drakonisches Schreiben des Hitzeschocks
        { ["id"] = { 194570, 194571, 194569 }, ["Stat1"] = 2, ["Stat2"] = 4 }, -- Drakonisches Schreiben der Aurora
    }
    ,[getCategoryId("optionalReagents", "Draconic Missive", "MASTERY")] = {
        { ["id"] = { 194579, 194580, 194578 }, ["Stat1"] = 3, ["Stat2"] = 1 }, -- Drakonisches Schreiben der Unvergleichlichkeit
        { ["id"] = { 194567, 194568, 194566 }, ["Stat1"] = 3, ["Stat2"] = 2 }, -- Drakonisches Schreiben des Hitzeschocks
        { ["id"] = { 194576, 194577, 194575 }, ["Stat1"] = 3, ["Stat2"] = 4 }, -- Drakonisches Schreiben der Harmonischen
    }
    ,[getCategoryId("optionalReagents", "Draconic Missive", "VERSATILITY")] = {
        { ["id"] = { 194573, 194574, 194572 }, ["Stat1"] = 4, ["Stat2"] = 1 }, -- Drakonisches Schreiben der Schnellklinge
        { ["id"] = { 194570, 194571, 194569 }, ["Stat1"] = 4, ["Stat2"] = 2 }, -- Drakonisches Schreiben der Aurora
        { ["id"] = { 194576, 194577, 194575 }, ["Stat1"] = 4, ["Stat2"] = 3 }, -- Drakonisches Schreiben der Harmonischen
    }
    ,[getCategoryId("optionalReagents", "Embellishments")] =  {
        { ["id"] = { 191532, 191533, 191534 }}, -- Potion Absorption Inhibitor
        { ["id"] = { 191250, 191872, 191873 }}, --Armor Spikes
        { ["id"] = { 193469, 193552, 193555 }}, -- Toxified Armor Patch
        { ["id"] = { 193468, 193551, 193554 }}, -- Fang Adornments
        { ["id"] = { 193944, 193945, 193946 }}, -- Blue Silken Lining
        { ["id"] = { 193941, 193942, 193943 }}, -- Bronzed Grip Wrappings
        { ["id"] = 200652 }, -- Alchemical Flavor Pocket
        { ["id"] = 205012 }, -- Reserve Parachute
        { ["id"] = 205411 }, -- Medical Wrap Kit
        { ["id"] = { 204708, 204709, 204710 }}, -- Shadowflame-Tempered Armor Patch
        { ["id"] = { 204909, 205115, 205170 }}, -- Statuette of Foreseen Power
        { ["id"] = { 205171, 205172, 205173 }}, -- Figurine of the Gathering Storm
        { ["id"] = { 210671, 210672, 210673 }}, -- Verdant Tether
        { ["id"] = 203652 }, -- Gaunahs Allzweck-Verzierungspulver
    }
}