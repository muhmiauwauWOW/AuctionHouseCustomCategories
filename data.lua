local AHCC = LibStub("AceAddon-3.0"):GetAddon("AHCC")
local L = LibStub("AceLocale-3.0"):GetLocale("AHCC")



local dataCategories = {
    {
        ["id"] = 1,
        ["name"] =  L["Enchants"],
        ["subCategories"] = {
            {
                ["id"] = 1,
                ["name"] = L["NECK"]
            },
            {
                ["id"] = 2,
                ["name"] = L["SHOULDER"],
            },
            {
                ["id"] = 3,
                ["name"] = L["CLOAK"],
            },
            {
                ["id"] = 4,
                ["name"] = L["CHEST"],
            },
            {
                ["id"] = 5,
                ["name"] = L["WRIST"],
            },
            {
                ["id"] = 6,
                ["name"] = L["WAIST"],
            },
            {
                ["id"] = 7,
                ["name"] = L["LEGS"],
            },
            {
                ["id"] = 8,
                ["name"] = L["FEET"],
            },
            {
                ["id"] = 9,
                ["name"] = L["FINGER"],
            },
            {
                ["id"] = 10,
                ["name"] = L["WEAPON"],
            },
            {
                ["id"] = 11,
                ["name"] = L["RANGED"],
            }
        }
    },
    {
        ["id"] = 2,
        ["name"] = L["Gems"],
        ["showStats"] = true,
        ["subCategories"] = {
            {
                ["id"] = 1,
                ["name"] = L["CRITICAL_STRIKE"],
            },
            {
                ["id"] = 2,
                ["name"] = L["HASTE"],
            },
            {
                ["id"] = 3,
                ["name"] = L["MASTERY"],
            },
            {
                ["id"] = 4,
                ["name"] = L["VERSATILITY"],
            },
            {
                ["id"] = 5,
                ["name"] = L["STAMINA"]
            }
        },
    },
    {
        ["id"] = 3,
        ["name"] =  L["Consumables"],
        ["subCategories"] = {
            {
                ["id"] = 1,
                ["name"] = L["Runes"],
            },
            {
                ["id"] = 2,
                ["name"] = L["Flasks"],
            },
            {
                ["id"] = 3,
                ["name"] = L["Potions"] 
            }
        }
    }
}

local dataItems = {
    { ["category"] = 1, ["subCategory"] = 1,  ["id"] = { 192992, 192993, 192994 } }, -- Gestufte Medaillonfassung
    { ["category"] = 1, ["subCategory"] = 2,  ["id"] = { 204568, 204565, 204567 } }, -- Illusorische Verzierung: Sporen
    { ["category"] = 1, ["subCategory"] = 2,  ["id"] = { 201315, 201314, 201313 } }, -- Illusorische Verzierung: Erde
    { ["category"] = 1, ["subCategory"] = 2,  ["id"] = { 200614, 200615, 200616 } }, -- Illusorische Verzierung: Feuer
    { ["category"] = 1, ["subCategory"] = 2,  ["id"] = { 201321, 201320, 201319 } }, -- Illusorische Verzierung: Ordnung
    { ["category"] = 1, ["subCategory"] = 2,  ["id"] = { 201318, 201317, 201316 } }, -- Illusorische Verzierung: Luft
    { ["category"] = 1, ["subCategory"] = 3,  ["id"] = { 199949, 199991, 200033 } }, -- Umhang - Regenerativer Lebensraub
    { ["category"] = 1, ["subCategory"] = 3,  ["id"] = { 199949, 199991, 200033 } }, -- Umhang - Regenerativer Lebensraub
    { ["category"] = 1, ["subCategory"] = 3,  ["id"] = { 199949, 199991, 200033 } }, -- Umhang - Regenerativer Lebensraub 
    { ["category"] = 1, ["subCategory"] = 3,  ["id"] = { 199948, 199990, 200032 } }, -- Umhang - Schnelle Heimkehr 
    { ["category"] = 1, ["subCategory"] = 3,  ["id"] = { 199947, 199989, 200031 } }, -- Umhang - Anmutiges Ausweichen 
    { ["category"] = 1, ["subCategory"] = 4,  ["id"] = { 199944, 199986, 200028 } }, -- Brustrüstung - Reserve der Intelligenz 
    { ["category"] = 1, ["subCategory"] = 4,  ["id"] = { 199945, 199987, 200029 } }, -- Brustrüstung - Anhaltende Stärke 
    { ["category"] = 1, ["subCategory"] = 4,  ["id"] = { 199946, 199988, 200030 } }, -- Brustrüstung - Erweckte Werte 
    { ["category"] = 1, ["subCategory"] = 5,  ["id"] = { 199937, 199979, 200021 } }, -- Armschienen - Hingabe der Vermeidung 
    { ["category"] = 1, ["subCategory"] = 5,  ["id"] = { 199938, 199980, 200022 } }, -- Armschienen - Hingabe des Lebensraubs 
    { ["category"] = 1, ["subCategory"] = 5,  ["id"] = { 199939, 199981, 200023 } }, -- Armschienen - Hingabe der Geschwindigkeit 
    { ["category"] = 1, ["subCategory"] = 6,  ["id"] = { 205043, 205044, 205039 } }, -- Überschattete Gürtelschnalle 
    { ["category"] = 1, ["subCategory"] = 7,  ["id"] = { 194011, 194012, 194013 } }, -- Gefrorener Zauberfaden 
    { ["category"] = 1, ["subCategory"] = 7,  ["id"] = { 194014, 194015, 194016 } }, -- Temporaler Zauberfaden 
    { ["category"] = 1, ["subCategory"] = 7,  ["id"] = { 194008, 194009, 194010 } }, -- Schillernder Zauberfaden 
    { ["category"] = 1, ["subCategory"] = 7,  ["id"] = { 204700, 204701, 204702 } }, -- Flackerndes Aufwertungsset 
    { ["category"] = 1, ["subCategory"] = 7,  ["id"] = { 193557, 193561, 193565 } }, -- Wildes Aufwertungsset 
    { ["category"] = 1, ["subCategory"] = 7,  ["id"] = { 193556, 193560, 193564 } }, -- Frostiges Aufwertungsset 
    { ["category"] = 1, ["subCategory"] = 7,  ["id"] = { 193559, 193563, 193567 } }, -- Verstärktes Aufwertungsset 
    { ["category"] = 1, ["subCategory"] = 8,  ["id"] = { 199934, 199976, 200018 } }, -- Stiefel - Brise des Ebenenläufers 
    { ["category"] = 1, ["subCategory"] = 8,  ["id"] = { 199935, 199977, 200019 } }, -- Stiefel - Sicherheit des Reiters 
    { ["category"] = 1, ["subCategory"] = 8,  ["id"] = { 199936, 199978, 200020 } }, -- Stiefel - Lehm des Hüters 
    { ["category"] = 1, ["subCategory"] = 9,  ["id"] = { 199953, 199995, 200037 } }, -- Ring - Hingabe des kritischen Trefferwerts 
    { ["category"] = 1, ["subCategory"] = 9,  ["id"] = { 199954, 199996, 200038 } }, -- Ring - Hingabe des Tempos 
    { ["category"] = 1, ["subCategory"] = 9,  ["id"] = { 199955, 199997, 200039 } }, -- Ring - Hingabe der Meisterschaft 
    { ["category"] = 1, ["subCategory"] = 9,  ["id"] = { 199956, 199998, 200040 } }, -- Ring - Hingabe der Vielseitigkeit 
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
    { ["category"] = 1, ["subCategory"] = 11,  ["id"] = { 198313, 198314, 198315 } }, -- Geschossschleudertrieb 
    { ["category"] = 1, ["subCategory"] = 11,  ["id"] = { 198316, 198317, 198318 } }, -- Hochleistungsthermoscanner 
    { ["category"] = 1, ["subCategory"] = 11,  ["id"] = { 198310, 198311, 198312 } }, -- Gyroskopisches Kaleidoskop 

    { ["category"] = 2, ["subCategory"] = 1,  ["id"] = { 192926, 192927, 192928 }, ["stat2"] = 0 }, -- Tödlicher Alexstraszit 
    { ["category"] = 2, ["subCategory"] = 1,  ["id"] = { 192917, 192918, 192919 }, ["stat2"] = 2 }, -- Listiger Alexstraszit 
    { ["category"] = 2, ["subCategory"] = 1,  ["id"] = { 192920, 192921, 192922 }, ["stat2"] = 3 }, -- Alexstraszit des Mentors 
    { ["category"] = 2, ["subCategory"] = 1,  ["id"] = { 192923, 192924, 192925 }, ["stat2"] = 4 }, -- Strahlender Alexstraszit 
    { ["category"] = 2, ["subCategory"] = 2,  ["id"] = { 192953, 192954, 192955 }, ["stat2"] = 0 }, -- Spiegelnder Ysmaragd 
    { ["category"] = 2, ["subCategory"] = 2,  ["id"] = { 192943, 192944, 192945 }, ["stat2"] = 1 }, -- Listiger Ysmaragd 
    { ["category"] = 2, ["subCategory"] = 2,  ["id"] = { 192946, 192947, 192948 }, ["stat2"] = 3 }, -- Schneidender Ysmaragd 
    { ["category"] = 2, ["subCategory"] = 2,  ["id"] = { 192950, 192951, 192952 }, ["stat2"] = 4 }, -- Geladener Ysmaragd 
    { ["category"] = 2, ["subCategory"] = 3,  ["id"] = { 192965, 192966, 192967 }, ["stat2"] = 0 }, -- Rissiger Neltharit 
    { ["category"] = 2, ["subCategory"] = 3,  ["id"] = { 192956, 192957, 192958 }, ["stat2"] = 1 }, -- Neltharit des Mentors 
    { ["category"] = 2, ["subCategory"] = 3,  ["id"] = { 192959, 192960, 192961 }, ["stat2"] = 2 }, -- Schneidender Neltharit 
    { ["category"] = 2, ["subCategory"] = 3,  ["id"] = { 192962, 192963, 192964 }, ["stat2"] = 4 }, -- Meditativer Neltharit 
    { ["category"] = 2, ["subCategory"] = 4,  ["id"] = { 192940, 192941, 192942 }, ["stat2"] = 0 }, -- Stürmischer Malygit 
    { ["category"] = 2, ["subCategory"] = 4,  ["id"] = { 192929, 192931, 192932 }, ["stat2"] = 1 }, -- Strahlender Malygit 
    { ["category"] = 2, ["subCategory"] = 4,  ["id"] = { 192933, 192934, 192935 }, ["stat2"] = 2 }, -- Geladener Malygit 
    { ["category"] = 2, ["subCategory"] = 4,  ["id"] = { 192936, 192937, 192938 }, ["stat2"] = 3 }, -- Meditativer Malygit 
    { ["category"] = 2, ["subCategory"] = 5,  ["id"] = { 192968, 192969, 192970 }, ["stat2"] = 1 }, -- Gezackter Nozdorit 
    { ["category"] = 2, ["subCategory"] = 5,  ["id"] = { 192971, 192972, 192973 }, ["stat2"] = 2 }, -- Kraftvoller Nozdorit 
    { ["category"] = 2, ["subCategory"] = 5,  ["id"] = { 192974, 192975, 192976 }, ["stat2"] = 3 }, -- Imposanter Nozdorit 
    { ["category"] = 2, ["subCategory"] = 5,  ["id"] = { 192977, 192978, 192979 }, ["stat2"] = 4 }, -- Beständiger Nozdorit 

    { ["category"] = 3, ["subCategory"] = 1,  ["id"] = { 194817, 194819, 194820 } }, -- Heulrune 
    { ["category"] = 3, ["subCategory"] = 1,  ["id"] = { 194821, 194822, 194823 } }, -- Summrune 
    { ["category"] = 3, ["subCategory"] = 1,  ["id"] = { 204971, 204972, 204973 } }, -- Zischende Rune 
    { ["category"] = 3, ["subCategory"] = 1,  ["id"] = { 194824, 194825, 194826 } }, -- Zwitscherrune 
    { ["category"] = 3, ["subCategory"] = 1,  ["id"] = { 198160, 198161, 198162 } }, -- Vollkommen sichere Raketen 
    { ["category"] = 3, ["subCategory"] = 1,  ["id"] = { 198163, 198164, 198165 } }, -- Endloser Nadelhaufen 
    { ["category"] = 3, ["subCategory"] = 1,  ["id"] = { 191939, 191933, 191940 } }, -- Urzeitlicher Schleifstein 
    { ["category"] = 3, ["subCategory"] = 1,  ["id"] = { 191943, 191945, 191944 } }, -- Urzeitlicher Gewichtsstein 
    { ["category"] = 3, ["subCategory"] = 2,  ["id"] = { 191327, 191328, 191329 } }, -- Eisige Phiole der verderbenden Wut 
    { ["category"] = 3, ["subCategory"] = 2,  ["id"] = { 191330, 191331, 191332 } }, -- Phiole der aufgeladenen Isolation 
    { ["category"] = 3, ["subCategory"] = 2,  ["id"] = { 191333, 191334, 191335 } }, -- Phiole des eisigen Zorns 
    { ["category"] = 3, ["subCategory"] = 2,  ["id"] = { 191336, 191337, 191338 } }, -- Phiole der statischen Ermächtigung 
    { ["category"] = 3, ["subCategory"] = 2,  ["id"] = { 191318, 191319, 191320 } }, -- Phiole des Auges im Sturm 
    { ["category"] = 3, ["subCategory"] = 2,  ["id"] = { 191357, 191358, 191359 } }, -- Phiole des elementaren Chaos 
    { ["category"] = 3, ["subCategory"] = 2,  ["id"] = { 191348, 191349, 191350 } }, -- Aufgeladene Phiole der Inbrunst 
    { ["category"] = 3, ["subCategory"] = 2,  ["id"] = { 191339, 191340, 191341 } }, -- Phiole der mäßigen Vielseitigkeit 
    { ["category"] = 3, ["subCategory"] = 2,  ["id"] = { 191324, 191325, 191326 } }, -- Phiole der eisigen Konservierung 
    { ["category"] = 3, ["subCategory"] = 2,  ["id"] = { 191321, 191322, 191323 } }, -- Phiole der stillen Luft 
    { ["category"] = 3, ["subCategory"] = 3,  ["id"] = { 191384, 191385, 191386 } }, -- Lufterfüllter Manatrank 

    { ["category"] = 3, ["subCategory"] = 3,  ["id"] = { 191360, 191361, 191362 } }, -- Fäulnis in der Flasche 
    { ["category"] = 3, ["subCategory"] = 3,  ["id"] = { 191375, 191376, 191377 } }, -- Empfindliche Sporensuspension 
    { ["category"] = 3, ["subCategory"] = 3,  ["id"] = { 191387, 191388, 191389 } }, -- Elementartrank der Macht 
    { ["category"] = 3, ["subCategory"] = 3,  ["id"] = { 191381, 191382, 191383 } }, -- Elementartrank der ultimativen Macht 
    { ["category"] = 3, ["subCategory"] = 3,  ["id"] = { 191366, 191367, 191368 } }, -- Trank der kühlen Klarheit 
    { ["category"] = 3, ["subCategory"] = 3,  ["id"] = { 191351, 191352, 191353 } }, -- Trank des gefrorenen Verhängnisses 
    { ["category"] = 3, ["subCategory"] = 3,  ["id"] = { 191363, 191364, 191365 } }, -- Trank des gefrorenen Fokus 
    { ["category"] = 3, ["subCategory"] = 3,  ["id"] = { 191396, 191397, 191398 } }, -- Trank der Böen 
    { ["category"] = 3, ["subCategory"] = 3,  ["id"] = { 191399, 191400, 191401 } }, -- Trank der schockierenden Offenbarung 
    { ["category"] = 3, ["subCategory"] = 3,  ["id"] = { 191393, 191394, 191395 } }, -- Trank des verstummten Zephyrs 
    { ["category"] = 3, ["subCategory"] = 3,  ["id"] = { 191369, 191370, 191371 } }, -- Trank der welkenden Vitalität 
    { ["category"] = 3, ["subCategory"] = 3,  ["id"] = { 191378, 191379, 191380 } }, -- Erfrischender Heiltrank 
    { ["category"] = 3, ["subCategory"] = 3,  ["id"] = { 191372, 191373, 191374 } }, -- Residualer Wirkstoff der Neuralkanalisierung 

}


local formatToResultLines = function(t, parent)
    local newTable = {}
    for k, v in pairs(t) do 
        local itemKey = C_AuctionHouse.MakeItemKey(v)

        newTable[k] = {
            itemKey = itemKey,
            quality = k,
            name = GetItemInfo(v),
            totalQuantity=1,
            minPrice=1,
            containsOwnerItem=false,
            stat1 = parent["subCategory"],
            stat2 = parent["stat2"] or 0
        }

    end
    return newTable
end


function AHCC:loadData()
    
    for k,v in ipairs(dataItems) do
        dataItems[k]["id"] = formatToResultLines(dataItems[k]["id"], dataItems[k])
    end

    self.data = {
        dataCategories = dataCategories,
        dataItems = dataItems,
        resultsItems = {}
    }


end

