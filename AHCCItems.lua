local AHCC = LibStub("AceAddon-3.0"):GetAddon("AHCC")
local L, _ = AHCC:GetLibs()





AHCCItems = {}

function AHCCItems:Init()
    self.items = {}
end

function AHCCItems:set(data)
    self.items = data
end

function AHCCItems:get()
    return self.items or {}
end

function AHCCItems:add(Items, nav)
    if not nav then return end
    if not _.isTable(nav) then return end
    if not Items then return end

    if _.isTable(Items) then 
        _.forEach(Items, function(entry)
            entry.nav = nav
            tinsert(self.items, entry)
        end)
    else
        Items.nav = nav
        tinsert(self.items, Items)
    end
end


function AHCCItems:getByNav(nav)
    local function arrayEqual(a1, a2)
        for i, v in ipairs(a1) do
            if a1[i] ~= a2[i] then
                return false
            end
        end
    
        return true
    end

    return _.filter(self:get(), function(entry)
        return arrayEqual(nav, entry.nav)
    end)
end


