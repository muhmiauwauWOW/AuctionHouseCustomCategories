local data = {
    {
        ["item_categories_name"] = "Enchants",
        ["sections"] = {
            {
                ["section_ids"] = "192994",
                ["section_name"] = "INVTYPE_NECK"
            },
            {
                ["section_ids"] = "204567,            201313,            200616,            201319,            201316,",
                ["section_name"] = "INVTYPE_SHOULDER"
            },
            {
                ["section_ids"] = "200033,            200032,            200031,",
                ["section_name"] = "INVTYPE_CLOAK"
            },
            {
                ["section_ids"] = "200028,            200029,            200030,",
                ["section_name"] = "INVTYPE_CHEST"
            },
            {
                ["section_ids"] = "200021,            200022,            200023,",
                ["section_name"] = "INVTYPE_WRIST"
            },
            {
                ["section_ids"] = "205039,",
                ["section_name"] = "INVTYPE_WAIST"
            },
            {
                ["section_ids"] = "  194013,            194016,            194010,            204702,            193565,            193564,            193567,",
                ["section_name"] = "INVTYPE_LEGS"
            },
            {
                ["section_ids"] = "200018,            200019,            200020,",
                ["section_name"] = "INVTYPE_FEET"
            },
            {
                ["section_ids"] = "200037,            200038,            200039,            200040,",
                ["section_name"] = "INVTYPE_FINGER"
            },
            {
                ["section_ids"] = "204623,            204615,            200050,            200051,            200052,            200053,            200054,            200055,            200056,            200057,            200058,            200059,            198315,            198318,            198312,",
                ["section_name"] = "INVTYPE_WEAPON"
            }
        }
    },
    {
        ["item_categories_name"] = "Gems",
        ["sections"] = {
            {
                ["section_ids"] = " 192928,            192919,            192922,            192925,",
                ["section_name"] = "STAT_CRITICAL_STRIKE"
            },
            {
                ["section_ids"] = " 192955,            192945,            192948,            192952,",
                ["section_name"] = "STAT_HASTE"
            },
            {
                ["section_ids"] = " 192967,            192958,            192961,            192964,",
                ["section_name"] = "STAT_MASTERY"
            },
            {
                ["section_ids"] = "  192942,            192932,            192935,            192938,",
                ["section_name"] = "STAT_VERSATILITY"
            },
            {
                ["section_ids"] = "192970,            192973,            192976,            192979, ",
                ["section_name"] = "STAMINA_COLON"
            }
            }
        },
    {
        ["item_categories_name"] = "Consumables",
        ["sections"] = {
            {
            ["section_ids"] = "194820,            194823,            204973,            194826,            198162,            198164,            191940,            191945,",
            ["section_name"] = "Runes"
            },
            {
            ["section_ids"] = "191329,            191332,            191335,            191338,            191320,            191359,            191350,            191341,            191326,            191323,",
            ["section_name"] = "Flasks"
            },
            {
            ["section_ids"] = "191386, 191362, 191377, 191389, 191383, 191368, 191353, 191365, 191398, 191401, 191395, 191371, 191380, 191374",
            ["section_name"] = "Potions"
            }
        }
    }
}


local dataCategories = {
    {
        ["id"] = 1,
        ["name"] = "Enchants",
        ["subCategories"] = {
            {
                ["id"] = 1,
                ["name"] = "INVTYPE_NECK"
            },
            {
                ["id"] = 2,
                ["name"] = "INVTYPE_SHOULDER",
            },
            {
                ["id"] = 3,
                ["name"] = "INVTYPE_CLOAK",
            },
            {
                ["id"] = 4,
                ["name"] = "INVTYPE_CHEST",
            },
            {
                ["id"] = 5,
                ["name"] = "INVTYPE_WRIST",
            },
            {
                ["id"] = 6,
                ["name"] = "INVTYPE_WAIST",
            },
            {
                ["id"] = 7,
                ["name"] = "INVTYPE_LEGS",
            },
            {
                ["id"] = 8,
                ["name"] = "INVTYPE_FEET",
            },
            {
                ["id"] = 9,
                ["name"] = "INVTYPE_FINGER",
            },
            {
                ["id"] = 10,
                ["name"] = "INVTYPE_WEAPON",
            }
        }
    },
    {
        ["id"] = 2,
        ["name"] = "Gems",
        ["subCategories"] = {
            {
                ["id"] = 1,
                ["name"] = "STAT_CRITICAL_STRIKE",
            },
            {
                ["id"] = 2,
                ["name"] = "STAT_HASTE",
            },
            {
                ["id"] = 3,
                ["name"] = "STAT_MASTERY",
            },
            {
                ["id"] = 4,
                ["name"] = "STAT_VERSATILITY",
            },
            {
                ["id"] = 5,
                ["name"] = "STAMINA_COLON"
            }
        },
    },
    {
        ["id"] = 3,
        ["name"] = "Consumables",
        ["subCategories"] = {
            {
                ["id"] = 1,
                ["name"] = "Runes",
            },
            {
                ["id"] = 2,
                ["name"] = "Flasks",
            },
            {
                ["id"] = 3,
                ["name"] = "Potions"
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
    { ["category"] = 1, ["subCategory"] = 10,  ["id"] = { 198313, 198314, 198315 } }, -- Geschossschleudertrieb 
    { ["category"] = 1, ["subCategory"] = 10,  ["id"] = { 198316, 198317, 198318 } }, -- Hochleistungsthermoscanner 
    { ["category"] = 1, ["subCategory"] = 10,  ["id"] = { 198310, 198311, 198312 } }, -- Gyroskopisches Kaleidoskop 

    { ["category"] = 2, ["subCategory"] = 1,  ["id"] = { 192926, 192927, 192928 } }, -- Tödlicher Alexstraszit 
    { ["category"] = 2, ["subCategory"] = 1,  ["id"] = { 192917, 192918, 192919 } }, -- Listiger Alexstraszit 
    { ["category"] = 2, ["subCategory"] = 1,  ["id"] = { 192920, 192921, 192922 } }, -- Alexstraszit des Mentors 
    { ["category"] = 2, ["subCategory"] = 1,  ["id"] = { 192923, 192924, 192925 } }, -- Strahlender Alexstraszit 
    { ["category"] = 2, ["subCategory"] = 2,  ["id"] = { 192953, 192954, 192955 } }, -- Spiegelnder Ysmaragd 
    { ["category"] = 2, ["subCategory"] = 2,  ["id"] = { 192943, 192944, 192945 } }, -- Listiger Ysmaragd 
    { ["category"] = 2, ["subCategory"] = 2,  ["id"] = { 192946, 192947, 192948 } }, -- Schneidender Ysmaragd 
    { ["category"] = 2, ["subCategory"] = 2,  ["id"] = { 192950, 192951, 192952 } }, -- Geladener Ysmaragd 
    { ["category"] = 2, ["subCategory"] = 3,  ["id"] = { 192965, 192966, 192967 } }, -- Rissiger Neltharit 
    { ["category"] = 2, ["subCategory"] = 3,  ["id"] = { 192956, 192957, 192958 } }, -- Neltharit des Mentors 
    { ["category"] = 2, ["subCategory"] = 3,  ["id"] = { 192959, 192960, 192961 } }, -- Schneidender Neltharit 
    { ["category"] = 2, ["subCategory"] = 3,  ["id"] = { 192962, 192963, 192964 } }, -- Meditativer Neltharit 
    { ["category"] = 2, ["subCategory"] = 4,  ["id"] = { 192940, 192941, 192942 } }, -- Stürmischer Malygit 
    { ["category"] = 2, ["subCategory"] = 4,  ["id"] = { 192929, 192931, 192932 } }, -- Strahlender Malygit 
    { ["category"] = 2, ["subCategory"] = 4,  ["id"] = { 192933, 192934, 192935 } }, -- Geladener Malygit 
    { ["category"] = 2, ["subCategory"] = 4,  ["id"] = { 192936, 192937, 192938 } }, -- Meditativer Malygit 
    { ["category"] = 2, ["subCategory"] = 5,  ["id"] = { 192968, 192969, 192970 } }, -- Gezackter Nozdorit 
    { ["category"] = 2, ["subCategory"] = 5,  ["id"] = { 192971, 192972, 192973 } }, -- Kraftvoller Nozdorit 
    { ["category"] = 2, ["subCategory"] = 5,  ["id"] = { 192974, 192975, 192976 } }, -- Imposanter Nozdorit 
    { ["category"] = 2, ["subCategory"] = 5,  ["id"] = { 192977, 192978, 192979 } }, -- Beständiger Nozdorit 
    { ["category"] = 3, ["subCategory"] = 1,  ["id"] = { 194817, 194819, 194820 } }, -- Heulrune 
    { ["category"] = 3, ["subCategory"] = 1,  ["id"] = { 194821, 194822, 194823 } }, -- Summrune 
    { ["category"] = 3, ["subCategory"] = 1,  ["id"] = { 194971, 194972, 194973 } }, -- Zischende Rune 
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


local resultsItems = {

}





local formatToResultLines = function(t)
    local newTable = {}
    for k, v in pairs(t) do 
        local itemKey = C_AuctionHouse.MakeItemKey(v)

        newTable[k] = {
            itemKey = itemKey,
            quality = k,
            name = GetItemInfo(v),
            totalQuantity=1,
            minPrice=1,
            containsOwnerItem=false
        }

    end
    return newTable
end



for k,v in ipairs(dataItems) do

    dataItems[k]["id"] = formatToResultLines(dataItems[k]["id"])

end



local findAllinTable =  function(t, search)
    local newTable = {}
    local c = 0
    for sk,sv in pairs(search) do 
        c = c + 1
    end

    for k,v in pairs(t) do
        local hit = 0;
        for sk,sv in pairs(search) do
            if (v[sk] == sv) then 
                hit = hit + 1
            end
        end
        if hit == c then
            tAppendAll(newTable, v["id"])
        end
    end
    return newTable
end



local getResults = function(c, s)

    local resultTable = nil 
    if resultsItems and resultsItems[c] and resultsItems[c][s] then 
        resultTable = resultsItems[c][s]
    end

    if resultTable == nil then
        resultsItems[c] = resultsItems[c] or {}

        local r = {}
        if s > 0  then 
            r = findAllinTable(dataItems, {
                ["category"] = c,
                ["subCategory"] = s
            })
        else
            r = findAllinTable(dataItems, {
                ["category"] = c,
            })
        end

        resultsItems[c][s] = r
        resultTable =  resultsItems[c][s]
    end


    return resultTable
end



local searchButton = nil
local searchResultTable = nil



AuctionHouseTableCellQualityMixin = CreateFromMixins(TableBuilderCellMixin);

function AuctionHouseTableCellQualityMixin:Init(owner)
	self.owner = owner;
end

function AuctionHouseTableCellQualityMixin:GetOwner()
	return self.owner;
end

function AuctionHouseTableCellQualityMixin:GetAuctionHouseFrame()
	return self:GetOwner():GetAuctionHouseFrame();
end

function AuctionHouseTableCellQualityMixin:Populate(rowData, dataIndex)
    local noneAvailable = self.rowData.totalQuantity == 0;
    self.Text:SetFontObject(noneAvailable and PriceFontGray or PriceFontWhite);
    local iconTable = {
        "Professions-Icon-Quality-Tier1-Small",
        "Professions-Icon-Quality-Tier2-Small",
        "Professions-Icon-Quality-Tier3-Small"
    }

    if iconTable[rowData.quality] then 
        local icon =  CreateAtlasMarkupWithAtlasSize(iconTable[rowData.quality], 0,0,nil,nil,nil,0.6)
        self.Text:SetText(icon);
    end
end




function GetBrowseListLayout(owner, itemList, extraInfoColumnText)
	local function LayoutBrowseListTableBuilder(tableBuilder)
		tableBuilder:SetColumnHeaderOverlap(1);
		tableBuilder:SetHeaderContainer(itemList:GetHeaderContainer());

		local restrictQualityToFilter = true;
		local hideItemLevel = extraInfoColumnText ~= nil;
		local nameColumn = tableBuilder:AddFillColumn(owner, 0, 1.0, 14, 14, 98, "AuctionHouseTableCellItemDisplayTemplate", restrictQualityToFilter, hideItemLevel);
		nameColumn:GetHeaderFrame():SetText(AUCTION_HOUSE_BROWSE_HEADER_NAME);

		local qualityColumn = tableBuilder:AddFixedWidthColumn(owner, 0, 84, 14, 14, 99, "AuctionHouseTableCellQualityTemplate");
        qualityColumn:GetHeaderFrame():SetText("Quality");
	end

	return LayoutBrowseListTableBuilder;
end



local performSearch = function(self, button) 

    local cdata = AuctionHouseFrame.CategoriesList:GetCategoryData()
    if cdata and cdata:HasFlag("OSAB_CATEGORY") then
        searchResultTable = getResults(cdata.OSAB_category, 0)
    elseif cdata and cdata:HasFlag("OSAB_SUBCATEGORY") then
        searchResultTable = getResults(cdata.OSAB_category, cdata.OSAB_subCategory)
    else 
        searchResultTable = nil
    end

    if searchResultTable then

        AuctionHouseFrame.BrowseResultsFrame:Reset()
        AuctionHouseFrame.BrowseResultsFrame.ItemList:SetTableBuilderLayout(GetBrowseListLayout(AuctionHouseFrame.BrowseResultsFrame, AuctionHouseFrame.BrowseResultsFrame.ItemList, nil));
        AuctionHouseFrame.BrowseResultsFrame.searchStarted = true;
        AuctionHouseFrame.BrowseResultsFrame.browseResults = searchResultTable;
        AuctionHouseFrame.BrowseResultsFrame.ItemList:SetRefreshCallback(nil)
        AuctionHouseFrame.BrowseResultsFrame.tableBuilderLayoutDirty = true;
        AuctionHouseFrame.BrowseResultsFrame.ItemList:DirtyScrollFrame();

        AuctionHouseFrame:SetDisplayMode(AuctionHouseFrameDisplayMode.Buy);
    end
end



local addona = CreateFrame("Frame")
addona:RegisterEvent("ADDON_LOADED")
addona:SetScript("OnEvent", function(self, event, name)
    if name == "Blizzard_AuctionHouseUI" then 

        searchButton = CreateFrame("Button", nil, AuctionHouseFrame, "UIPanelButtonTemplate")
        searchButton:SetPoint("RIGHT", AuctionHouseFrame.SearchBar ,"RIGHT" ,0, 0)
        searchButton:SetFrameStrata("HIGH")
        searchButton:SetSize(132, 22)
        searchButton:SetText(AUCTION_HOUSE_SEARCH_BUTTON)
        searchButton:SetScript("OnClick", performSearch)

        local categoriesTable = {}
        for categoryId, category in ipairs(dataCategories) do 
            categoriesTable[categoryId] = AuctionFrame_CreateCategory(category["name"])
            categoriesTable[categoryId]:SetFlag("OSAB_CATEGORY");
            categoriesTable[categoryId].OSAB_category = category["id"];
            for subCategoryId, subCategory in ipairs(category["subCategories"]) do 
                local name = _G[subCategory["name"]] or subCategory["name"]
                local subcat = categoriesTable[categoryId]:CreateNamedSubCategory(name);
                subcat:SetFlag("OSAB_SUBCATEGORY");
                subcat.OSAB_category= category["id"];
                subcat.OSAB_subCategory = subCategory["id"];
            end
        end

        hooksecurefunc("AuctionFrameFilters_UpdateCategories", function(categoriesList, forceSelectionIntoView)
            local cdata = categoriesList:GetCategoryData()
            if cdata and (cdata:HasFlag("OSAB_CATEGORY") or cdata:HasFlag("OSAB_SUBCATEGORY")) then
                AuctionHouseFrame.SearchBar:Hide()
                searchButton:Show()
            else 
                searchButton:Hide()
                AuctionHouseFrame.SearchBar:Show()
            end
        end)
    end
end)



local sortReverse = false

local getSortFunc = function(key, order)
    if order then 
        return function (k1, k2) return k1[key] < k2[key] end
    else 
        return function (k1, k2) return k1[key] > k2[key] end
    end
end

local sortResult = function(self, searchContext, sortOrder)
    local key = "";

    if sortOrder == 98 then 
        key = "name"
    elseif sortOrder == 99  then
        key = "quality"
    end


    sortReverse = not sortReverse
    table.sort(searchResultTable, getSortFunc(key, sortReverse))

    self.BrowseResultsFrame.browseResults = searchResultTable;
    self.BrowseResultsFrame.ItemList:DirtyScrollFrame();
end



local addona2 = CreateFrame("Frame")
addona2:RegisterEvent("ADDON_LOADED")
addona2:SetScript("OnEvent", function(self, event, name)
    if name == "Blizzard_AuctionHouseUI" then 

        function AuctionHouseFrame:SetBrowseSortOrder(sortOrder)
            if sortOrder > 90 then 
                local browseSearchContext = self:GetBrowseSearchContext();
                sortResult(self, browseSearchContext, sortOrder)            
            else -- blizzard org func
                local browseSearchContext = self:GetBrowseSearchContext();
                self:SetSortOrder(browseSearchContext, sortOrder);
            end
        end


    end
end)












