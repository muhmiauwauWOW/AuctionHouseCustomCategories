local AHCC = LibStub("AceAddon-3.0"):GetAddon("AHCC")
local L, _ = AHCC:GetLibs()


 
AHCCCategory = {}
AHCCCategory.categories = {}
function AHCCCategory:add(category)
    local cols = { "Price", "Name" }
    if category.columns then 
        tAppendAll(cols, category.columns)
    else
        tinsert(cols, "Quality")
    end

    table.insert(self.categories, {
        index = #self.categories,
        id = category.id,
        name = category.name,
        config = {
            columns = cols
        },
        parent = category.parent,
    })
end



function AHCCCategory:merge(entry)
   -- print(entry.name,entry.parent)
    local newParent = _.find(self.categories, function(data)
        return data.name == entry.name and data.parent == entry.parent
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
