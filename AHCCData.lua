local AHCC = LibStub("AceAddon-3.0"):GetAddon("AHCC")
local L, _ = AHCC:GetLibs()


AHCCData = {}

function AHCCData:checkVersion(obj)
    if obj.versionStart and obj.versionEnd then
        return (tonumber(obj.versionStart) <= tonumber(AHCC.gameVersion)) and (tonumber(obj.versionEnd) > tonumber(AHCC.gameVersion))
     elseif obj.versionStart then
        return tonumber(obj.versionStart) <= tonumber(AHCC.gameVersion)
     elseif obj.versionEnd then
         return tonumber(obj.versionEnd) > tonumber(AHCC.gameVersion)
     else
         return true
     end
end


function AHCCData:add(data, mode)
    if data.Config then 
        if not AHCCData:checkVersion(data.Config) then return end
        local function checkExpansionLevel(expansionLevel)
            if not expansionLevel then return true end
            return GetExpansionLevel() == expansionLevel
        end

        if not checkExpansionLevel(data.Config.expansionLevel) then return end
    end

    local function createId(parent, name, entry)
        if entry.id then return entry.id end
        local id = parent .. " " .. name
        return id:gsub(" ", "_")
    end
    
    data.id = data.name

    -- categories
    local function addCategoriesRecursiv(data)
        local root = data.IsEnabled and true or false
        _.forEach(data.Categories, function(entry)
            local id = createId(data.id, entry.name, entry)
            entry.id = id
            entry.parent = (root == true) and "root" or data.id

            if mode == "merge" then 
                id = AHCCCategory:merge(entry)
            else
                AHCCCategory:add(entry)
            end

            if entry.categories then
                local e = {
                    id = id,
                    name = entry.name,
                    parent = entry.parent,
                    Categories = entry.categories
                }
                addCategoriesRecursiv(e)
            end
        end)
    end

    addCategoriesRecursiv(data)



   -- AHCCItems

    local function addItemsRecursiv(data, parent)        
        _.forEach(data, function(entry, key)
            if _.isString(key) then 
                --local id = createId(parent, key, {})
                addItemsRecursiv(entry, key)
                return
            end
            _.forEach(data, function(Item)
                Item.nav = parent;
                AHCCItems:add(Item) 
            end)
        end)
    end

    addItemsRecursiv(data.Items, data.id)


    AHCCItems:add({ ["id"] = { 192965, 192966, 192967 }, ["Stat1"] = 3, ["Stat2"] = 0, ["nav"] = data.name .. "_Cat_1"  })
end









AHCC_DATA = AHCC_DATA or {}

local DataTable = {}

AHCC_DATA["OnEnable"] = function(self)
   -- AHCCData:add(self)
    table.insert(DataTable, {
        data = self
    })
    self.loaded = true
    AHCC_DATA__checkModules()
end

AHCC_DATA["OnDisable"] = function(self)
  -- AHCCData:add(self.Categories, self.Config)
    self.loaded = false
    AHCC_DATA__checkModules()
end 

AHCC_DATA__ticker = nil

function AHCC_DATA__checkModules()
    local modules = AHCC:IterateModules()
    local check = _.every(modules, function(module)
        return module.loaded
    end)

    if AHCC_DATA__ticker then
        AHCC_DATA__ticker:Cancel()
	end

    if check then
        AHCC_DATA__ticker = C_Timer.NewTimer(0.1, function()
            AHCC_DATA__ticker:Cancel()
            local insertData =_.filter(DataTable, function(data)
                return data.data.Config.mode == nil or data.data.Config.mode == "insert"
            end)

            _.forEach(insertData, function(data)
                AHCCData:add(data.data, "insert")
            end)

            local mergeData =_.filter(DataTable, function(data)
                return  data.data.Config.mode == "merge"
            end)

            _.forEach(mergeData, function(data)
                AHCCData:add(data.data, "merge")
            end)

            AHCCCategoryList:Init()
            AHCCCategoryList:update()
        end)
    end
end
