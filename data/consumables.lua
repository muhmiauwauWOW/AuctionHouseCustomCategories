local Data = AHCC:NewModule("AHCC_DATA_consumables", AHCC_DATA)
local L, _ = AHCC:GetLibs()


Data.Config = {
    mode = "insert",
    nav = {}
} 

Data.Categories = {
    {
        ["name"] =  L["Consumables"],
        ["subCategories"] = {
            {
                ["name"] = L["Runes"],
                ["Items"] = {
                    { ["id"] = { 204858, 204859, 204860 } }, -- Vantusrune: Aberrus, Schmelztiegel der Schatten
                    { ["id"] = { 194817, 194819, 194820 } }, -- Heulrune 
                    { ["id"] = { 194821, 194822, 194823 } }, -- Summrune 
                    { ["id"] = { 204971, 204972, 204973 } }, -- Zischende Rune 
                    { ["id"] = { 194824, 194825, 194826 } }, -- Zwitscherrune 
                    { ["id"] = { 198160, 198161, 198162 } }, -- Vollkommen sichere Raketen 
                    { ["id"] = { 198163, 198164, 198165 } }, -- Endloser Nadelhaufen 
                    { ["id"] = { 191939, 191933, 191940 } }, -- Urzeitlicher Schleifstein 
                    { ["id"] = { 191943, 191944, 191945 } }, -- Urzeitlicher Gewichtsstein 
                }
            },
            {
                ["name"] = L["Flasks"],
                ["Items"] = {
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
            },
            {
                ["name"] = L["Potions"],
                ["Items"] = {
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
                    { ["id"] = { 191378, 191379, 191380 } }, -- Erfrischender Heiltrank 
                    { ["id"] = { 191372, 191373, 191374 } }, -- Residualer Wirkstoff der Neuralkanalisierung 
                }
            },
            {
                ["name"] = L["Food"],
                ["config"] = {
                    ["columns"] = {}
                },
                ["Items"] = {
                    { ["id"] = 204072 }, -- Teuflisch gefüllte Eier
                    { ["id"] = 197792 }, -- Schicksalhafter Glückskeks

                    { ["id"] = 197793 }, -- Yusas herzhafter Eintopf
                    { ["id"] = 197795 }, -- Vorrat an drakonischen Delikatessen
                    { ["id"] = 197794 }, -- Großbankett der Kalu'ak
                }
            }
        }
    },
}