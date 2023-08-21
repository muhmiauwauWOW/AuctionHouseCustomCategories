local Data = AHCC:NewModule("AHCC_DATA_consumables", AHCC_DATA)
local L, _ = AHCC:GetLibs()

Data.Categories = {
    {
        ["id"] = 3,
        ["name"] =  L["Consumables"],
        ["subCategories"] = {
            {
                ["id"] = 1,
                ["name"] = L["Runes"],
                ["Items"] = {
                    { ["category"] = 3, ["subCategory"] = 1,  ["id"] = { 204858, 204859, 204860 } }, -- Vantusrune: Aberrus, Schmelztiegel der Schatten
                    { ["category"] = 3, ["subCategory"] = 1,  ["id"] = { 194817, 194819, 194820 } }, -- Heulrune 
                    { ["category"] = 3, ["subCategory"] = 1,  ["id"] = { 194821, 194822, 194823 } }, -- Summrune 
                    { ["category"] = 3, ["subCategory"] = 1,  ["id"] = { 204971, 204972, 204973 } }, -- Zischende Rune 
                    { ["category"] = 3, ["subCategory"] = 1,  ["id"] = { 194824, 194825, 194826 } }, -- Zwitscherrune 
                    { ["category"] = 3, ["subCategory"] = 1,  ["id"] = { 198160, 198161, 198162 } }, -- Vollkommen sichere Raketen 
                    { ["category"] = 3, ["subCategory"] = 1,  ["id"] = { 198163, 198164, 198165 } }, -- Endloser Nadelhaufen 
                    { ["category"] = 3, ["subCategory"] = 1,  ["id"] = { 191939, 191933, 191940 } }, -- Urzeitlicher Schleifstein 
                    { ["category"] = 3, ["subCategory"] = 1,  ["id"] = { 191943, 191944, 191945 } }, -- Urzeitlicher Gewichtsstein 
                }
            },
            {
                ["id"] = 2,
                ["name"] = L["Flasks"],
                ["Items"] = {
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
                }
            },
            {
                ["id"] = 3,
                ["name"] = L["Potions"],
                ["Items"] = {
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
            },
            {
                ["id"] = 4,
                ["name"] = L["Food"],
                ["config"] = {
                    ["columns"] = {}
                },
                ["Items"] = {
                    { ["category"] = 3, ["subCategory"] = 4,  ["id"] = 204072 }, -- Teuflisch gefüllte Eier
                    { ["category"] = 3, ["subCategory"] = 4,  ["id"] = 197792 }, -- Schicksalhafter Glückskeks

                    { ["category"] = 3, ["subCategory"] = 4,  ["id"] = 197793 }, -- Yusas herzhafter Eintopf
                    { ["category"] = 3, ["subCategory"] = 4,  ["id"] = 197795 }, -- Vorrat an drakonischen Delikatessen
                    { ["category"] = 3, ["subCategory"] = 4,  ["id"] = 197794 }, -- Großbankett der Kalu'ak
                }
            }
        }
    },
}