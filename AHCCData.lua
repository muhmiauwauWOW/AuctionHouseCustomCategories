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

    if data.Config.root then 
        print(data.Config.root)
        data.IsEnabled = false
        data.parent = data.Config.root
    end

    -- categories
    local function addCategoriesRecursiv(data)
        local root = data.IsEnabled and true or false
        _.forEach(data.Categories, function(entry)

            if data.Config and data.Config.root then 
                data.id = data.Config.root
            end

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
        AHCC_DATA__ticker = C_Timer.NewTimer(0.01, function()
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
            --@do-not-package@
                if UnitName("player") == "Muhmiauwaudk" then
                    AHCCTest.checkData()

                end
            --@end-do-not-package@
        end)
    end
end





--@do-not-package@
    local function deep_equals(o1, o2, ignore_mt)
        -- same object
        if o1 == o2 then return true end
    
        local o1Type = type(o1)
        local o2Type = type(o2)
        --- different type
        if o1Type ~= o2Type then return false end
        --- same type but not table, already compared above
        if o1Type ~= 'table' then return false end
    
        -- use metatable method
        if not ignore_mt then
            local mt1 = getmetatable(o1)
            if mt1 and mt1.__eq then
                --compare using built in method
                return o1 == o2
            end
        end
    
        -- iterate over o1
        for key1, value1 in pairs(o1) do
            local value2 = o2[key1]
            if value2 == nil or deep_equals(value1, value2, ignore_mt) == false then
                return false
            end
        end
    
        --- check keys in o2 but missing from o1
        for key2, _ in pairs(o2) do
            if o1[key2] == nil then return false end
        end
        return true
    end

AHCCTest = {}

function AHCCTest.checkData()

    -- local obj1 = {  a = "a"}
    -- local obj2 = {  a = "a"}

    local obj1 = AHCCCategory:get()
    local obj2 = AHCC.TestObj

    _.debug(obj1)

    if deep_equals(obj1, obj2) == false then 
        print(RED_FONT_COLOR:WrapTextInColorCode("#### Test failed"))
    else
        print(GREEN_FONT_COLOR:WrapTextInColorCode("#### Test successfull"))
    end


end



--@end-do-not-package@