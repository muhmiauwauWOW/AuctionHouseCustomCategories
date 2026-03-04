local Data = AHCC:NewModule("DATA_MN_Items", AHCC_DATA)
local L, _ = AHCC:GetLibs()

Data.Config = {
    expansionLevel = 11,
    mode = "merge"
} 

local function getCategoryId(name, ...)
    _.forEach({...}, function(v)
        name = name .. " " .. L[v]
    end)    
    return name:gsub(" ", "_")
end

Data.Items = {
    -- [getCategoryId("enchants", "SOCKETS")] = {
    --     { ["id"] = 213777 }, -- Magnificent Jeweler's Setting
    -- },
    [getCategoryId("enchants", "SHOULDER")] = {
        { ["id"] = { 244032, 244033 } }, -- Illusory Adornment - Blooming Light
        { ["id"] = { 244034, 244035 } }, -- Illusory Adornment - Nature's Embrace
        { ["id"] = { 244036, 244037 } }, -- Illusory Adornment - Voidtouched
    },
    -- [getCategoryId("enchants", "CLOAK")] = {
    --     { ["id"] = { 223726, 223727, 223728 } }, -- Enchant Cloak - Whisper of Silken Avoidance
    --     { ["id"] = { 223729, 223730, 223731 } }, -- Enchant Cloak - Chant of Winged Grace
    --     { ["id"] = { 223732, 223733, 223734 } }, -- Enchant Cloak - Whisper of Silken Leech
    --     { ["id"] = { 223735, 223736, 223737 } }, -- Enchant Cloak - Chant of Leeching Fangs
    --     { ["id"] = { 223738, 223739, 223740 } }, -- Enchant Cloak - Whisper of Silken SpeedBonus   
    --     { ["id"] = { 223798, 223799, 223800 } }, -- Enchant Cloak - Chant of Burrowing Rapidity    
    -- },
    [getCategoryId("enchants", "CHEST")] = {
        { ["id"] = { 243946, 243947 } }, -- Enchant Chest - Mark of Nalorakk
        { ["id"] = { 244002, 244003 } }, -- Enchant Chest - Mark of the Magister
        { ["id"] = { 243974, 243975 } }, -- Enchant Chest - Mark of the Rootwarden
        { ["id"] = { 243976, 243977 } }, -- Enchant Chest - Mark of the Worldsoul
    },
    -- [getCategoryId("enchants", "WRIST")] = {
    --     { ["id"] = { 223708, 223709, 223710 } }, -- Enchant Bracer - Whisper of Armored Avoidance
    --     { ["id"] = { 223711, 223712, 223713 } }, -- Enchant Bracer - Chant of Armored Avoidance
    --     { ["id"] = { 223714, 223715, 223716 } }, -- Enchant Bracer - Whisper of Armored Leech
    --     { ["id"] = { 223717, 223718, 223719 } }, -- Enchant Bracer - Chant of Armored Leech
    --     { ["id"] = { 223720, 223721, 223722 } }, -- Enchant Bracer - Whisper of Armored Speed
    --     { ["id"] = { 223723, 223724, 223725 } }, -- Enchant Bracer - Chant of Armored SpeedBonus        
    -- },
    -- [getCategoryId("enchants", "WAIST")] = {
     
    -- },
    [getCategoryId("enchants", "LEGS")] = {
        { ["id"] = { 240094, 240133 } }, -- Sunfire Silk Spellthread
        { ["id"] = { 240154, 240155 } }, -- Arcanoweave Spellthread
        { ["id"] = { 244640, 244641 } }, -- Forest Hunter's Armor Kit
        { ["id"] = { 240156, 240157 } }, -- Bright Linen Spellthread
        { ["id"] = { 244642, 244643 } }, -- Blood Knight's Armor Kit
        { ["id"] = { 244644, 244645 } }, -- Thalassian Scout Armor Kit

    },
    [getCategoryId("enchants", "FEET")] = {
        { ["id"] = { 244008, 244009 } }, -- Enchant Boots - Farstrider's Hunt
        { ["id"] = { 243952, 243953 } }, -- Enchant Boots - Lynx's Dexterity
        { ["id"] = { 243982, 243983 } }, -- Enchant Boots - Shaladrassil's Roots
    },
    [getCategoryId("enchants", "FINGER")] = {
        { ["Stat1"] = 3, ["id"] = { 243954, 243955 } }, -- Enchant Ring - Amani Mastery
        { ["Stat1"] = 1, ["id"] = { 243956, 243957 } }, -- Enchant Ring - Eyes of the Eagle
        { ["Stat1"] = 1, ["id"] = { 243986, 243987 } }, -- Enchant Ring - Nature's Fury
        { ["Stat1"] = 1, ["id"] = { 243984, 243985 } }, -- Enchant Ring - Nature's Wrath
        { ["Stat1"] = 2, ["id"] = { 244014, 244015 } }, -- Enchant Ring - Silvermoon's Alacrity
        { ["Stat1"] = 4, ["id"] = { 244016, 244017 } }, -- Enchant Ring - Silvermoon's Tenacity
        { ["Stat1"] = 2, ["id"] = { 244010, 244011 } }, -- Enchant Ring - Thalassian Haste
        { ["Stat1"] = 4, ["id"] = { 244012, 244013 } }, -- Enchant Ring - Thalassian Versatility
        { ["Stat1"] = 3, ["id"] = { 243958, 243959 } }, -- Enchant Ring - Zul'jin's Mastery
    },
    [getCategoryId("enchants", "WEAPON")] = {
        { ["id"] = { 244028, 244029 } }, -- Enchant Weapon - Acuity of the Ren'dorei
        { ["id"] = { 244030, 244031 } }, -- Enchant Weapon - Arcane Mastery
        { ["id"] = { 243972, 243973 } }, -- Enchant Weapon - Berserker's Rage
        { ["id"] = { 244026, 244027 } }, -- Enchant Weapon - Flames of the Sin'dorei
        { ["id"] = { 243970, 243971 } }, -- Enchant Weapon - Jan'alai's Precision
        { ["id"] = { 243968, 243969 } }, -- Enchant Weapon - Strength of Halazzi
        { ["id"] = { 243998, 243999 } }, -- Enchant Weapon - Worldsoul Aegis
        { ["id"] = { 243996, 243997 } }, -- Enchant Weapon - Worldsoul Cradle
        { ["id"] = { 244000, 244001 } }, -- Enchant Weapon - Worldsoul Tenacity
        { ["id"] = { 257747, 257748 } }, -- Smuggler's Lynxeye
        { ["id"] = { 257745, 257746 } }, -- Farstrider's Hawkeye
    },
    -- [getCategoryId("enchants", "TOOL")] = {
    --     { ["id"] = { 223693, 223694, 223695 } }, -- Enchant Tool - Algari Deftness
    --     { ["id"] = { 223696, 223697, 223698 } }, -- Enchant Tool - Algari Finesse
    --     { ["id"] = { 223699, 223700, 223701 } }, -- Enchant Tool - Algari Ingenuity
    --     { ["id"] = { 223702, 223703, 223704 } }, -- Enchant Tool - Algari Perception
    --     { ["id"] = { 223705, 223706, 223707 } }, -- Enchant Tool - Algari Resourcefulness
    -- },
    [getCategoryId("gems", "PRISMATIC_GEM")] = {
        { ["id"] = { 240982, 240983 } }, -- Indecipherable Eversong Diamond
        { ["id"] = { 240966, 240967 } }, -- Powerful Eversong Diamond
        { ["id"] = { 240970, 240971 } }, -- Stoic Eversong Diamond
        { ["id"] = { 240968, 240969 } }, -- Telluric Eversong Diamond

    }
    ,[getCategoryId("gems", "CRITICAL_STRIKE")] = {
        { ["Stat1"] = 1, ["Stat2"] = 1, ["id"] = { 240903, 240904 } }, -- Flawless Deadly Garnet
        { ["Stat1"] = 1, ["Stat2"] = 2, ["id"] = { 240905, 240906 } }, -- Flawless Quick Garnet
        { ["Stat1"] = 1, ["Stat2"] = 3, ["id"] = { 240907, 240908 } }, -- Flawless Masterful Garnet
        { ["Stat1"] = 1, ["Stat2"] = 4, ["id"] = { 240909, 240910 } }, -- Flawless Versatile Garnet
    },
    [getCategoryId("gems", "HASTE")] = {
        { ["Stat1"] = 2, ["Stat2"] = 0, ["id"] = { 240887, 240888 } }, -- Flawless Quick Peridot
        { ["Stat1"] = 2, ["Stat2"] = 1, ["id"] = { 240889, 240890 } }, -- Flawless Deadly Peridot
        { ["Stat1"] = 2, ["Stat2"] = 3, ["id"] = { 240891, 240892 } }, -- Flawless Masterful Peridot
        { ["Stat1"] = 2, ["Stat2"] = 4, ["id"] = { 240893, 240894 } }, -- Flawless Versatile Peridot
    }
    ,[getCategoryId("gems", "MASTERY")] = {
        { ["Stat1"] = 3, ["Stat2"] = 1, ["id"] = { 240897, 240898 } }, -- Flawless Deadly Amethyst
        { ["Stat1"] = 3, ["Stat2"] = 2, ["id"] = { 240899, 240900 } }, -- Flawless Quick Amethyst
        { ["Stat1"] = 3, ["Stat2"] = 0, ["id"] = { 240895, 240896 } }, -- Flawless Masterful Amethyst
        { ["Stat1"] = 3, ["Stat2"] = 4, ["id"] = { 240901, 240902 } }, -- Flawless Versatile Amethyst
    }
    ,[getCategoryId("gems", "VERSATILITY")] = {
        { ["Stat1"] = 4, ["Stat2"] = 0, ["id"] = { 240911, 240912 } }, -- Flawless Versatile Lapis
        { ["Stat1"] = 4, ["Stat2"] = 1, ["id"] = { 240913, 240914 } }, -- Flawless Deadly Lapis
        { ["Stat1"] = 4, ["Stat2"] = 2, ["id"] = { 240915, 240916 } }, -- Flawless Quick Lapis
        { ["Stat1"] = 4, ["Stat2"] = 3, ["id"] = { 240917, 240918 } }, -- Flawless Masterful Lapis
    }
    -- ,[getCategoryId("gems", "STAMINA")] = {
    --     { ["Stat1"] = 5, ["Stat2"] = 0, ["id"] = { 213515, 213516, 213517 } }, -- Solid Amber
    --     { ["Stat1"] = 5, ["Stat2"] = 1, ["id"] = { 213501, 213502, 213503 } }, -- Deadly Amber
    --     { ["Stat1"] = 5, ["Stat2"] = 2, ["id"] = { 213504, 213505, 213506 } }, -- Quick Amber
    --     { ["Stat1"] = 5, ["Stat2"] = 3, ["id"] = { 213507, 213508, 213509 } }, -- Masterful Amber
    --     { ["Stat1"] = 5, ["Stat2"] = 4, ["id"] = { 213510, 213511, 213512 } }, -- Versatile Amber
    -- }
    ,[getCategoryId("consumables", "Runes")] = {

        { ["id"] = { 257749, 257750 } }, -- Laced Zoomshots
        { ["id"] = { 243735, 243736 } }, -- Oil of Dawn
        { ["id"] = { 237372, 237373 } }, -- Refulgent Razorstone
        { ["id"] = { 237367, 237369 } }, -- Refulgent Weightstone
        { ["id"] = { 237370, 237371 } }, -- Refulgent Whetstone
        { ["id"] = { 243737, 243738 } }, -- Smuggler's Enchanted Edge
        { ["id"] = { 243733, 243734 } }, -- Thalassian Phoenix Oil
        { ["id"] = { 257751, 257752 } }, -- Weighted Boomshots

    }
    ,[getCategoryId("consumables", "Flasks")] = {
        { ["id"] = { 241321, 241320 } }, -- Flask of Thalassian Resistance, 
        { ["id"] = { 241325, 241324 } }, -- Flask of the Blood Knights, 
        { ["id"] = { 241323, 241322 } }, -- Flask of the Magisters, 
        { ["id"] = { 241327, 241326 } }, -- Flask of the Shattered Sun, 
        { ["id"] = { 241315, 241314 } }, -- Haranir Phial of Concentrated Ingenuity, 
        { ["id"] = { 241311, 241310 } }, -- Haranir Phial of Finesse, 
        { ["id"] = { 241313, 241312 } }, -- Haranir Phial of Ingenuity, 
        { ["id"] = { 241317, 241316 } }, -- Haranir Phial of Perception, 
        { ["id"] = {  241334 } }, -- Vicious Thalassian Flask of Honor, 241335,
    }
    ,[getCategoryId("consumables", "Potions")] = {
        { ["id"] = {241299, 241298} }, -- Amani Extract
        { ["id"] = {241293, 241292} }, -- Draught of Rampant Abandon
        { ["id"] = {241339, 241338} }, -- Enlightenment Tonic
        { ["id"] = {268954, 268955} }, -- Entropic Extract
        { ["id"] = {241309, 241308} }, -- Light's Potential
        { ["id"] = {241287, 241286} }, -- Light's Preservation
        { ["id"] = {241301, 241300} }, -- Lightfused Mana Potion
        { ["id"] = {241295, 241294} }, -- Potion of Devoured Dreams
        { ["id"] = {241289, 241288} }, -- Potion of Recklessness
        { ["id"] = {241297 ,241296} }, -- Potion of Zealotry
        { ["id"] = {241307, 241306} }, -- Refreshing Serum
        { ["id"] = {241305, 241304} }, -- Silvermoon Health Potion
    }
    ,[getCategoryId("consumables", "Food")] = {
        { ["id"] = 255846 }, -- Harandar Celebration
        { ["id"] = 255845 }, -- Silvermoon Parade
        { ["id"] = 242273 }, -- Blooming Feast
        { ["id"] = 242272 }, -- Quel'dorei Medley
        { ["id"] = 242275 }, -- Royal Roast
        { ["id"] = 255848 }, -- Flora Frenzy
        { ["id"] = 242274 }, -- Champion's Bento
        { ["id"] = 242283 }, -- Sun-Seared Lumifin
        { ["id"] = 242291 }, -- Fried Bloomtail
        { ["id"] = 242277 }, -- Crimson Calamari
        { ["id"] = 242285 }, -- Warped Wise Wings
        { ["id"] = 242276 }, -- Braised Blood Hunter
        { ["id"] = 242282 }, -- Null and Void Plate
        { ["id"] = 242281 }, -- Glitter Skewers
        { ["id"] = 255847 }, -- Impossibly Royal Roast
        { ["id"] = 242278 }, -- Tasty Smoked Tetra
        { ["id"] = 242293 }, -- Sunwell Delight
        { ["id"] = 242292 }, -- Eversong Pudding
        { ["id"] = 242280 }, -- Buttered Root Crab
        { ["id"] = 242287 }, -- Arcano Cutlets
        { ["id"] = 242284 }, -- Void-Kissed Fish Rolls
        { ["id"] = 242289 }, -- Spellfire Filet
        { ["id"] = 242286 }, -- Fel-Kissed Filet
        { ["id"] = 242288 }, -- Twilight Angler's Medley
        { ["id"] = 242294 }, -- Felberry Figs
        { ["id"] = 242295 }, -- Hearthflame Supper
        { ["id"] = 242290 }, -- Wise Tails
        { ["id"] = 242296 }, -- Bloodthistle-wrapped Cutlets
    }
    ,[getCategoryId("optionalReagents", "Algari Missive", "CRITICAL_STRIKE")] = {
        { ["Stat1"] = 1, ["Stat2"] = 2, ["id"] = { 245785, 245786 } }, -- Thalassian Missive of the Fireflash
        { ["Stat1"] = 1, ["Stat2"] = 3, ["id"] = { 245789, 245790 } }, -- Thalassian Missive of the Peerless
        { ["Stat1"] = 1, ["Stat2"] = 4, ["id"] = { 245791, 245792 } }, -- Thalassian Missive of the Quickblade
    }
    ,[getCategoryId("optionalReagents", "Algari Missive", "HASTE")] = {
        { ["Stat1"] = 2, ["Stat2"] = 1, ["id"] = { 245785, 245786 } }, -- Thalassian Missive of the Fireflash
        { ["Stat1"] = 2, ["Stat2"] = 3, ["id"] = { 245784, 245783 } }, -- Thalassian Missive of the Feverflare
        { ["Stat1"] = 2, ["Stat2"] = 4, ["id"] = { 245781, 245782 } }, -- Thalassian Missive of the Aurora                   
    }
    ,[getCategoryId("optionalReagents", "Algari Missive", "MASTERY")] = {
        { ["Stat1"] = 3, ["Stat2"] = 1, ["id"] = { 245789, 245790 } }, -- Thalassian Missive of the Peerless
        { ["Stat1"] = 3, ["Stat2"] = 2, ["id"] = { 245784, 245783 } }, -- Thalassian Missive of the Feverflare
        { ["Stat1"] = 3, ["Stat2"] = 4, ["id"] = { 245787, 245788 } }, -- Thalassian Missive of the Harmonious
    }
    ,[getCategoryId("optionalReagents", "Algari Missive", "VERSATILITY")] = {
        { ["Stat1"] = 4, ["Stat2"] = 1, ["id"] = { 245791, 245792 } }, -- Thalassian Missive of the Quickblade
        { ["Stat1"] = 4, ["Stat2"] = 2, ["id"] = { 245781, 245782 } }, -- Thalassian Missive of the Aurora
        { ["Stat1"] = 4, ["Stat2"] = 3, ["id"] = { 245787, 245788 } }, -- Thalassian Missive of the Harmonious
    }
    ,[getCategoryId("optionalReagents", "Embellishments")] =  {
        { ["id"] = {240166, 240167} }, -- Arcanoweave Lining
        { ["id"] = {244603, 244604} }, -- Blessed Pango Charm
        { ["id"] = {244674, 244675} }, -- Devouring Banding
        { ["id"] = 248130 }, -- Lucky Keychain
        { ["id"] = {244607, 244608} }, -- Primal Spore Binding
        { ["id"] = {251489, 251490} }, -- Stabilizing Gemstone Bandolier
        { ["id"] = {240164, 240165} }, -- Sunfire Silk Lining
        -- { ["id"] = 256342 }, -- Griftah's Fool-Proof Embellishing Powder
        { ["id"] = {257735, 257741} }, -- B0P, Curator of Booms
        { ["id"] = {248135, 248592} }, -- B1P, Scorcher of Souls
        { ["id"] = {245871, 245872} }, -- Darkmoon Sigil: Blood
        { ["id"] = {245875, 245876} }, -- Darkmoon Sigil: Hunt
        { ["id"] = {245877, 245878} }, -- Darkmoon Sigil: Rot
        { ["id"] = {245873, 245874} }, -- Darkmoon Sigil: Void
        { ["id"] = {255843, 255844} }, -- HU5H, Nonchalant Pup
        { ["id"] = {248132, 248133} }, -- Kinetic Ankle Primers
        { ["id"] = {248136, 248136} }, -- M3DDY, Travel-Sized
    }
}