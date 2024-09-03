local Data = AHCC:NewModule("DATA_TWW_Items", AHCC_DATA)
local L, _ = AHCC:GetLibs()

Data.Config = {
    expansionLevel = 10
} 

local function getCategoryId(name, ...)
    _.forEach({...}, function(v)
        name = name .. " " .. L[v]
    end)    
    return name:gsub(" ", "_")
end

Data.Items = {
    -- [getCategoryId("enchants", "NECK")] = {
    --    { ["id"] = 213777 }, -- Magnificent Jeweler's Setting
    -- },
    [getCategoryId("enchants", "SHOULDER")] = {
        { ["id"] = { 200614, 200615, 200616 } }, -- Illusory Adornment: Fire
        { ["id"] = { 201312, 201311, 201310 } }, -- Illusory Adornment: Frost
        { ["id"] = { 201315, 201314, 201313 } }, -- Illusory Adornment: Earth
        { ["id"] = { 201318, 201317, 201316 } }, -- Illusory Adornment: Air
        { ["id"] = { 201321, 201320, 201319 } }, -- Illusory Adornment: Order
        { ["id"] = { 204568, 204565, 204567 } }, -- Illusory Adornment: Spores
        { ["id"] = { 206967, 206968, 206969 } }, -- Illusory Adornment: Dreams
        { ["id"] = { 223746, 223745, 223747 } }, -- Illusory Adornment: Crystal
        { ["id"] = { 223748, 223749, 223750 } }, -- Illusory Adornment: Radiance
        { ["id"] = { 223751, 223752, 223753 } }, -- Illusory Adornment: Runes
        { ["id"] = { 223754, 223755, 223756 } }, -- Illusory Adornment: Shadow    
    },
    [getCategoryId("enchants", "CLOAK")] = {
        { ["id"] = { 223726, 223727, 223728 } }, -- Enchant Cloak - Whisper of Silken Avoidance
        { ["id"] = { 223729, 223730, 223731 } }, -- Enchant Cloak - Chant of Winged Grace
        { ["id"] = { 223732, 223733, 223734 } }, -- Enchant Cloak - Whisper of Silken Leech
        { ["id"] = { 223735, 223736, 223737 } }, -- Enchant Cloak - Chant of Leeching Fangs
        { ["id"] = { 223738, 223739, 223740 } }, -- Enchant Cloak - Whisper of Silken SpeedBonus   
        { ["id"] = { 223798, 223799, 223800 } }, -- Enchant Cloak - Chant of Burrowing Rapidity    
    },
    [getCategoryId("enchants", "CHEST")] = {
        { ["id"] = { 223681, 223682, 223683 } }, -- Enchant Chest - Stormrider's Agility
        { ["id"] = { 223684, 223685, 223686 } }, -- Enchant Chest - Council's Intellect
        { ["id"] = { 223687, 223688, 223689 } }, -- Enchant Chest - Oathsworn's Strength
        { ["id"] = { 223690, 223691, 223692 } }, -- Enchant Chest - Crystalline Radiance
    },
    [getCategoryId("enchants", "WRIST")] = {
        { ["id"] = { 223708, 223709, 223710 } }, -- Enchant Bracer - Whisper of Armored Avoidance
        { ["id"] = { 223711, 223712, 223713 } }, -- Enchant Bracer - Chant of Armored Avoidance
        { ["id"] = { 223714, 223715, 223716 } }, -- Enchant Bracer - Whisper of Armored Leech
        { ["id"] = { 223717, 223718, 223719 } }, -- Enchant Bracer - Chant of Armored Leech
        { ["id"] = { 223720, 223721, 223722 } }, -- Enchant Bracer - Whisper of Armored Speed
        { ["id"] = { 223723, 223724, 223725 } }, -- Enchant Bracer - Chant of Armored SpeedBonus        
    },
    [getCategoryId("enchants", "WAIST")] = {
     
    },
    [getCategoryId("enchants", "LEGS")] = {
        { ["id"] = { 219906, 219907, 219908 } }, -- Defender's Armor Kit
        { ["id"] = { 219909, 219910, 219911 } }, -- Stormbound Armor Kit
        { ["id"] = { 219912, 219913, 219914 } }, -- Dual Layered Armor Kit
        { ["id"] = { 222888, 222889, 222890 } }, -- Weavercloth Spellthread
        { ["id"] = { 222891, 222892, 222893 } }, -- Sunset Spellthread
        { ["id"] = { 222894, 222895, 222896 } }, -- Daybreak Spellthread
    },
    [getCategoryId("enchants", "FEET")] = {
        { ["id"] = { 223618, 223649, 223650 } }, -- Enchant Boots - Cavalry's March
        { ["id"] = { 223651, 223652, 223653 } }, -- Enchant Boots - Scout's March
        { ["id"] = { 223654, 223655, 223656 } }, -- Enchant Boots - Defender's March
    },
    [getCategoryId("enchants", "FINGER")] = {
        { ["id"] = { 223657, 223658, 223659 } }, -- Enchant Ring - Glimmering Critical Strike
        { ["id"] = { 223660, 223661, 223662 } }, -- Enchant Ring - Radiant Critical Strike
        { ["id"] = { 225652, 223664, 223665 } }, -- Enchant Ring - Glimmering Haste
        { ["id"] = { 223666, 223667, 223668 } }, -- Enchant Ring - Glimmering Mastery
        { ["id"] = { 223669, 223670, 223671 } }, -- Enchant Ring - Glimmering Versatility
        { ["id"] = { 223672, 223673, 223674 } }, -- Enchant Ring - Radiant Haste
        { ["id"] = { 223675, 223676, 223677 } }, -- Enchant Ring - Radiant Mastery
        { ["id"] = { 223678, 223679, 223680 } }, -- Enchant Ring - Radiant Versatility
        { ["id"] = { 223785, 223786, 223787 } }, -- Enchant Ring - Cursed Critical Strike
        { ["id"] = { 223788, 223789, 223790 } }, -- Enchant Ring - Cursed Haste
        { ["id"] = { 223791, 223792, 223793 } }, -- Enchant Ring - Cursed Mastery
        { ["id"] = { 223794, 223795, 223796 } }, -- Enchant Ring - Cursed Versatility
    },
    [getCategoryId("enchants", "WEAPON")] = {
        { ["id"] = { 223757, 223758, 223759 } }, -- Enchant Weapon - Council's Guile
        { ["id"] = { 223760, 223761, 223762 } }, -- Enchant Weapon - Stormrider's Fury
        { ["id"] = { 223763, 223764, 223765 } }, -- Enchant Weapon - Stonebound Artistry
        { ["id"] = { 223766, 223767, 223768 } }, -- Enchant Weapon - Oathsworn's Tenacity
        { ["id"] = { 223770, 223771, 223772 } }, -- Enchant Weapon - Authority of Storms
        { ["id"] = { 223773, 223774, 223775 } }, -- Enchant Weapon - Authority of Air
        { ["id"] = { 223776, 223777, 223778 } }, -- Enchant Weapon - Authority of Fiery Resolve
        { ["id"] = { 223779, 223780, 223781 } }, -- Enchant Weapon - Authority of Radiant Power
        -- wait for Season 1 { ["id"] = { 223782, 223783, 223784 } }, -- Enchant Weapon - Authority of the Depths
    },
    [getCategoryId("enchants", "RANGED")] = {
        { ["id"] = { 198313, 198314, 198315 } }, -- Geschossschleudertrieb 
        { ["id"] = { 198316, 198317, 198318 } }, -- Hochleistungsthermoscanner 
        { ["id"] = { 198310, 198311, 198312 } }, -- Gyroskopisches Kaleidoskop 
    },
    [getCategoryId("enchants", "TOOL")] = {
        { ["id"] = { 223693, 223694, 223695 } }, -- Enchant Tool - Algari Deftness
        { ["id"] = { 223696, 223697, 223698 } }, -- Enchant Tool - Algari Finesse
        { ["id"] = { 223699, 223700, 223701 } }, -- Enchant Tool - Algari Ingenuity
        { ["id"] = { 223702, 223703, 223704 } }, -- Enchant Tool - Algari Perception
        { ["id"] = { 223705, 223706, 223707 } }, -- Enchant Tool - Algari Resourcefulness
    }
    ,[getCategoryId("gems", "CRITICAL_STRIKE")] = {
        { ["Stat1"] = 1, ["Stat2"] = 0, ["id"] = { 213462, 213463, 213464 } }, -- Deadly Ruby
        { ["Stat1"] = 1, ["Stat2"] = 2, ["id"] = { 213453, 213454, 213455 } }, -- Quick Ruby
        { ["Stat1"] = 1, ["Stat2"] = 3, ["id"] = { 213456, 213457, 213458 } }, -- Masterful Ruby
        { ["Stat1"] = 1, ["Stat2"] = 4, ["id"] = { 213459, 213460, 213461 } }, -- Versatile Ruby
    }
    ,[getCategoryId("gems", "HASTE")] = {
        { ["Stat1"] = 2, ["Stat2"] = 0, ["id"] = { 213486, 213487, 213488 } }, -- Quick Emerald
        { ["Stat1"] = 2, ["Stat2"] = 1, ["id"] = { 213477, 213478, 213479 } }, -- Deadly Emerald
        { ["Stat1"] = 2, ["Stat2"] = 3, ["id"] = { 213480, 213481, 213482 } }, -- Masterful Emerald
        { ["Stat1"] = 2, ["Stat2"] = 4, ["id"] = { 213483, 213484, 213485 } }, -- Versatile Emerald
    }
    ,[getCategoryId("gems", "MASTERY")] = {
        { ["Stat1"] = 3, ["Stat2"] = 0, ["id"] = { 213498, 213499, 213500 } }, -- Masterful Onyx
        { ["Stat1"] = 3, ["Stat2"] = 1, ["id"] = { 213489, 213490, 213491 } }, -- Deadly Onyx
        { ["Stat1"] = 3, ["Stat2"] = 2, ["id"] = { 213492, 213493, 213494 } }, -- Quick Onyx
        { ["Stat1"] = 3, ["Stat2"] = 4, ["id"] = { 213495, 213496, 213497 } }, -- Versatile Onyx
    }
    ,[getCategoryId("gems", "VERSATILITY")] = {
        { ["Stat1"] = 4, ["Stat2"] = 0, ["id"] = { 213474, 213475, 213476 } }, -- Versatile Sapphire
        { ["Stat1"] = 4, ["Stat2"] = 1, ["id"] = { 213465, 213466, 213467 } }, -- Deadly Sapphire
        { ["Stat1"] = 4, ["Stat2"] = 2, ["id"] = { 213468, 213469, 213470 } }, -- Quick Sapphire
        { ["Stat1"] = 4, ["Stat2"] = 3, ["id"] = { 213471, 213472, 213473 } }, -- Masterful Sapphire
    }
    ,[getCategoryId("gems", "STAMINA")] = {
        { ["Stat1"] = 5, ["Stat2"] = 0, ["id"] = { 213515, 213516, 213517 } }, -- Solid Amber
        { ["Stat1"] = 5, ["Stat2"] = 1, ["id"] = { 213501, 213502, 213503 } }, -- Deadly Amber
        { ["Stat1"] = 5, ["Stat2"] = 2, ["id"] = { 213504, 213505, 213506 } }, -- Quick Amber
        { ["Stat1"] = 5, ["Stat2"] = 3, ["id"] = { 213507, 213508, 213509 } }, -- Masterful Amber
        { ["Stat1"] = 5, ["Stat2"] = 4, ["id"] = { 213510, 213511, 213512 } }, -- Versatile Amber
    }
    ,[getCategoryId("consumables", "Runes")] = {
        { ["id"] = { 226034, 226035, 226036 } }, -- Vantus Rune: Nerub-ar Palace
        { ["id"] = { 222502, 222503, 222504 } }, -- Ironclaw Whetstone
        { ["id"] = { 222505, 222506, 222507 } }, -- Ironclaw Razorstone
        { ["id"] = { 222508, 222509, 222510 } }, -- Ironclaw Weightstone
        { ["id"] = { 224105, 224106, 224107 } }, -- Algari Mana Oil
        { ["id"] = { 224108, 224109, 224110 } }, -- Oil of Beledar's Grace
        { ["id"] = { 224111, 224112, 224113 } }, -- Oil of Deep Toxins
    }
    ,[getCategoryId("consumables", "Flasks")] = {
        { ["id"] = { 212281, 212282, 212283 } }, -- Flask of Alchemical Chaos
        { ["id"] = { 212299, 212300, 212301 } }, -- Flask of Saving Graces
        { ["id"] = { 212305, 212306, 212307 } }, -- Phial of Concentrated Ingenuity
        { ["id"] = { 212308, 212309, 212310 } }, -- Phial of Truesight
        { ["id"] = { 212311, 212312, 212313 } }, -- Phial of Enhanced Ambidextry
        { ["id"] = { 212314, 212315, 212316 } }, -- Phial of Bountiful Seasons
    }
    ,[getCategoryId("consumables", "Potions")] = {
        { ["id"] = { 211878, 211879, 211880 } }, -- Algari Healing Potion
        { ["id"] = { 212239, 212240, 212241 } }, -- Algari Mana Potion
        { ["id"] = { 212242, 212243, 212244 } }, -- Cavedweller's Delight
        { ["id"] = { 212245, 212246, 212247 } }, -- Slumbering Soul Serum
        { ["id"] = { 212248, 212249, 212250 } }, -- Draught of Silent Footfalls
        { ["id"] = { 212251, 212252, 212253 } }, -- Draught of Shocking Revelations
        { ["id"] = { 212254, 212255, 212256 } }, -- Grotesque Vial
        { ["id"] = { 212257, 212258, 212259 } }, -- Potion of Unwavering Focus
        { ["id"] = { 212260, 212261, 212262 } }, -- Frontline Potion
        { ["id"] = { 212263, 212264, 212265 } }, -- Tempered Potion
        { ["id"] = { 212266, 212267, 212268 } }, -- Potion of the Reborn Cheetah
    }
    ,[getCategoryId("consumables", "Food")] = {
        { ["id"] = 222733 }, -- Feast of the Midnight Masquerade
        { ["id"] = 222732 }, -- feast-of-the-divine-day
        { ["id"] = 222720 }, -- the-sushi-special
        { ["id"] = 222727 }, -- anglers-delight
        { ["id"] = 222725 }, -- mycobloom-risotto
        { ["id"] = 222726 }, -- stuffed-cave-peppers
        { ["id"] = 222724 }, -- sizzling-honey-roast
        { ["id"] = 222731 }, -- outsiders-provisions
        { ["id"] = 222729 }, -- empress-farewell
        { ["id"] = 222730 }, -- jesters-board
        { ["id"] = 222735 }, -- everything-stew
    }
    ,[getCategoryId("optionalReagents", "Algari Missive", "CRITICAL_STRIKE")] = {
        { ["Stat1"] = 1, ["Stat2"] = 2, ["id"] = { 222585, 222586, 222587 } }, -- Algari Missive of the Fireflash
        { ["Stat1"] = 1, ["Stat2"] = 3, ["id"] = { 222591, 222592, 222593 } }, -- Algari Missive of the Peerless
        { ["Stat1"] = 1, ["Stat2"] = 4, ["id"] = { 222594, 222595, 222596 } }, -- Algari Missive of the Quickblade
    }
    ,[getCategoryId("optionalReagents", "Algari Missive", "HASTE")] = {
        { ["Stat1"] = 2, ["Stat2"] = 1, ["id"] = { 222585, 222586, 222587 } }, -- Algari Missive of the Fireflash
        { ["Stat1"] = 2, ["Stat2"] = 3, ["id"] = { 222582, 222583, 222584 } }, -- Algari Missive of the Feverflare
        { ["Stat1"] = 2, ["Stat2"] = 4, ["id"] = { 222579, 222580, 222581 } }, -- Algari Missive of the Aurora                      
    }
    ,[getCategoryId("optionalReagents", "Algari Missive", "MASTERY")] = {
        { ["Stat1"] = 3, ["Stat2"] = 1, ["id"] = { 222591, 222592, 222593 } }, -- Algari Missive of the Peerless
        { ["Stat1"] = 3, ["Stat2"] = 2, ["id"] = { 222582, 222583, 222584 } }, -- Algari Missive of the Feverflare
        { ["Stat1"] = 3, ["Stat2"] = 4, ["id"] = { 222588, 222589, 222590 } }, -- Algari Missive of the Harmonious
    }
    ,[getCategoryId("optionalReagents", "Algari Missive", "VERSATILITY")] = {
        { ["Stat1"] = 4, ["Stat2"] = 1, ["id"] = { 222594, 222595, 222596 } }, -- Algari Missive of the Quickblade
        { ["Stat1"] = 4, ["Stat2"] = 2, ["id"] = { 222579, 222580, 222581 } }, -- Algari Missive of the Aurora
        { ["Stat1"] = 4, ["Stat2"] = 3, ["id"] = { 222588, 222589, 222590 } }, -- Algari Missive of the Harmonious
    }
    ,[getCategoryId("optionalReagents", "Embellishments")] =  {
        { ["id"] = { 213768, 213769, 213770 } }, -- Elemental Focusing Lens
        { ["id"] = { 213771, 213772, 213773 } }, -- Prismatic Null Stone
        { ["id"] = { 213774, 213775, 213776 } }, -- Captured Starlight
        { ["id"] = { 221935, 221936, 221937 } }, -- Pouch of Pocket Grenades
        { ["id"] = { 221938, 221939, 221940 } }, -- Concealed Chaos Module
        { ["id"] = { 221941, 221942, 221943 } }, -- Energy Redistribution Beacon
        { ["id"] = { 219495, 219496, 219497 } }, -- Blessed Weapon Grip
        -- wait for Season 1 { ["id"] = { 222452, 222453, 222454 } }, -- Echoing Impact Seal
        -- wait for Season 1 { ["id"] = { 222455, 222456, 222457 } }, -- Arathor Armor Patch
        { ["id"] = { 219504, 219505, 219506 } }, -- Writhing Armor Banding
        { ["id"] = { 222868, 222869, 222870 } }, -- Dawnthread Lining
        -- wait for Season 1 { ["id"] = { 222871, 222872, 222873 } }, -- Duskthread Lining
        -- wait for Season 1 { ["id"] = { 222389, 221622, 221623 } }, -- Duskthread Lining
        { ["id"] = 228921 }, -- Griftah's Heavy-Duty Embellishing Powder
    }
}