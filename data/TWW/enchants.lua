local Data = AHCC:NewModule("AHCC_DATA_TWW_enchants", AHCC_DATA)
local L, _ = AHCC:GetLibs()


Data.Config = {
    mode = "insert",
    nav = {},
    versionStart = 110020,
    versionEnd = 120000
} 


Data.Categories = {
    {
        ["name"] =  L["Enchants"],
        ["subCategories"] = {
            {
                ["name"] = L["SOCKETS"],
                ["Items"] = {
                    { ["id"] = 213777 }, -- Magnificent Jeweler's Setting
                }
            },
            {
                ["name"] = L["SHOULDER"],
                ["Items"] = {
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
                }
            },
            {
                ["name"] = L["CLOAK"],
                ["Items"] = {
                    { ["id"] = { 223726, 223727, 223728 } }, -- Enchant Cloak - Whisper of Silken Avoidance
                    { ["id"] = { 223729, 223730, 223731 } }, -- Enchant Cloak - Chant of Winged Grace
                    { ["id"] = { 223732, 223733, 223734 } }, -- Enchant Cloak - Whisper of Silken Leech
                    { ["id"] = { 223735, 223736, 223737 } }, -- Enchant Cloak - Chant of Leeching Fangs
                    { ["id"] = { 223738, 223739, 223740 } }, -- Enchant Cloak - Whisper of Silken SpeedBonus   
                    { ["id"] = { 223798, 223799, 223800 } }, -- Enchant Cloak - Chant of Burrowing Rapidity    
                }
            },
            {
                ["name"] = L["CHEST"],
                ["Items"] = {
                    { ["id"] = { 223681, 223682, 223683 } }, -- Enchant Chest - Stormrider's Agility
                    { ["id"] = { 223684, 223685, 223686 } }, -- Enchant Chest - Council's Intellect
                    { ["id"] = { 223687, 223688, 223689 } }, -- Enchant Chest - Oathsworn's Strength
                    { ["id"] = { 223690, 223691, 223692 } }, -- Enchant Chest - Crystalline Radiance
                }
            },
            {
                ["name"] = L["WRIST"],
                ["Items"] = {
                    { ["id"] = { 223708, 223709, 223710 } }, -- Enchant Bracer - Whisper of Armored Avoidance
                    { ["id"] = { 223711, 223712, 223713 } }, -- Enchant Bracer - Chant of Armored Avoidance
                    { ["id"] = { 223714, 223715, 223716 } }, -- Enchant Bracer - Whisper of Armored Leech
                    { ["id"] = { 223717, 223718, 223719 } }, -- Enchant Bracer - Chant of Armored Leech
                    { ["id"] = { 223720, 223721, 223722 } }, -- Enchant Bracer - Whisper of Armored Speed
                    { ["id"] = { 223723, 223724, 223725 } }, -- Enchant Bracer - Chant of Armored SpeedBonus        
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
                    { ["id"] = { 219906, 219907, 219908 } }, -- Defender's Armor Kit
                    { ["id"] = { 219909, 219910, 219911 } }, -- Stormbound Armor Kit
                    { ["id"] = { 219912, 219913, 219914 } }, -- Dual Layered Armor Kit
                    { ["id"] = { 222888, 222889, 222890 } }, -- Weavercloth Spellthread
                    { ["id"] = { 222891, 222892, 222893 } }, -- Sunset Spellthread
                    { ["id"] = { 222894, 222895, 222896 } }, -- Daybreak Spellthread
                }
            },
            {
                ["name"] = L["FEET"],
                ["Items"] = {
                    { ["id"] = { 223618, 223649, 223650 } }, -- Enchant Boots - Cavalry's March
                    { ["id"] = { 223651, 223652, 223653 } }, -- Enchant Boots - Scout's March
                    { ["id"] = { 223654, 223655, 223656 } }, -- Enchant Boots - Defender's March
                }
            },
            {
                ["name"] = L["FINGER"],
                ["Items"] = {
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
                }
            },
            {
                ["name"] = L["WEAPON"],
                ["Items"] = {
                    { ["id"] = { 223757, 223758, 223759 } }, -- Enchant Weapon - Council's Guile
                    { ["id"] = { 223760, 223761, 223762 } }, -- Enchant Weapon - Stormrider's Fury
                    { ["id"] = { 223763, 223764, 223765 } }, -- Enchant Weapon - Stonebound Artistry
                    { ["id"] = { 223766, 223767, 223768 } }, -- Enchant Weapon - Oathsworn's Tenacity
                    { ["id"] = { 223770, 223771, 223772 } }, -- Enchant Weapon - Authority of Storms
                    { ["id"] = { 223773, 223774, 223775 } }, -- Enchant Weapon - Authority of Air
                    { ["id"] = { 223776, 223777, 223778 } }, -- Enchant Weapon - Authority of Fiery Resolve
                    { ["id"] = { 223779, 223780, 223781 } }, -- Enchant Weapon - Authority of Radiant Power
                    { ["id"] = { 223782, 223783, 223784 } }, -- Enchant Weapon - Authority of the Depths
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
                    { ["id"] = { 223693, 223694, 223695 } }, -- Enchant Tool - Algari Deftness
                    { ["id"] = { 223696, 223697, 223698 } }, -- Enchant Tool - Algari Finesse
                    { ["id"] = { 223699, 223700, 223701 } }, -- Enchant Tool - Algari Ingenuity
                    { ["id"] = { 223702, 223703, 223704 } }, -- Enchant Tool - Algari Perception
                    { ["id"] = { 223705, 223706, 223707 } }, -- Enchant Tool - Algari Resourcefulness
                }
            },
        }
    }
}
