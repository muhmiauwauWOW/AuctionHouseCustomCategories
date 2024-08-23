local AHCC = LibStub("AceAddon-3.0"):GetAddon("AHCC")
local L, _ = AHCC:GetLibs()


 
AHCCCategory = {}
AHCCCategory.categories = {}
function AHCCCategory:add(category)

    table.insert(self.categories, {
        id = category.id,
        name = category.name,
        parent = category.parent,
    })

    AHCCCategory.config:add(category.id, {
        columns = category.columns
    })

end



function AHCCCategory:merge(entry)
   -- print(entry.name,entry.parent)
    local newParent = _.find(self.categories, function(data)
        return data.id == entry.id and data.parent == entry.parent
    end)

    if newParent then  return newParent.id end

    -- fallback
    self:add(entry)
    return entry.id

end


function AHCCCategory:get(name)
    if not name then return self.categories  end
    return _.find(self.categories, function(data)
        return data.name == name
    end)
end


AHCCCategory.config = {}
AHCCCategory.config.Config = {}

function AHCCCategory.config:get(...)
    return _.get(self.Config, {...})
end

function AHCCCategory.config:add(key, config)
    self.Config[key] = config
    return config
end

function AHCCCategory.config:set(key, configKey, value)
    if self.Config[key] then 
        self.Config[key][configKey] = value
        return self.Config[key]
    end
   return false
end

function AHCCCategory.config:getColumns(key)
    local colsStart = { "Price", "Name" }
    local colsEnd = { "Quality" }
    local columns = self:get(key, "columns") or {}
    return _.union(colsStart, columns, colsEnd)
end