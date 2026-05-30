local AHCC = LibStub("AceAddon-3.0"):GetAddon("AHCC")
local L, _ = AHCC:GetLibs()

AHCCCustom = {}


local function getCategoryId(name, ...)
    _.forEach({...}, function(v) name = name .. " " .. v end)
    return name:gsub(" ", "_")
end


function AHCCCustom:addRenameCategory(id, Text)
    if id == 0 then
        AHCCCustom:customCategoriesAddCategory(Text)
    else
        AHCCCustom:customCategoriesRenameCategory(id, Text)
    end
end

-- AHCC.db.global.customCategories 
function AHCCCustom:customCategoriesAddCategory(name)
    local data = AHCC.db.global.customCategories
    local baseId = getCategoryId(name):gsub(" ", "_")
    local id = baseId

    local function idExists(checkId)
        for _, cat in ipairs(data) do
            if cat.id == checkId then return true end
        end
        return false
    end

    local counter = 2
    while idExists(id) do
        id = baseId .. "_" .. counter
        counter = counter + 1
    end

    local newCategory = {
        order = #data + 1,
        name = name,
        id = getCategoryId(id),
        categories = {}
    }
    table.insert(data, newCategory)

    AHCC.db.global.customItems[newCategory.id] = {}

    return newCategory
end

function AHCCCustom:customCategoriesRenameCategory(id, newName)
    local data = AHCC.db.global.customCategories
    for index, cat in ipairs(data) do
        if index == id then
            cat.name = newName
            return true
        end
    end
    return false
end

function AHCCCustom:customCategoriesDeleteCategory(id)
    local data = AHCC.db.global.customCategories
    local customItems = AHCC.db.global.customItems

    for i, cat in ipairs(data) do
        if i == id then
            customItems[cat.id] = nil
            if cat.categories then
                for _, sub in ipairs(cat.categories) do
                    local subKey = (cat.id .. " " .. sub.name):gsub(" ", "_")
                    customItems[subKey] = nil
                end
            end
            table.remove(data, i)
            AHCC:performSearch(true)
            return true
        end
    end
    return false
end

function AHCCCustom:customCategoriesMoveUpDown(index, direction)
    local data = AHCC.db.global.customCategories
    local swapIndex

    if direction == "up" then
        if index <= 1 then return false end
        swapIndex = index - 1
    elseif direction == "down" then
        if index >= #data then return false end
        swapIndex = index + 1
    else
        return false
    end

    data[index], data[swapIndex] = data[swapIndex], data[index]
    data[index].order = index
    data[swapIndex].order = swapIndex

    return swapIndex
end


function AHCCCustom:customCategoriesMoveCategory(id, index, parent)
    local data = AHCC.db.global.customCategories

    local catIndex, cat
    for i, c in ipairs(data) do
        if c.id == id then
            catIndex = i
            cat = c
            break
        end
    end
    if not cat then return false end

    if parent then
        for _, parentCat in ipairs(data) do
            if parentCat.id == parent then
                table.remove(data, catIndex)
                index = math.max(1, math.min(index, #parentCat.categories + 1))
                table.insert(parentCat.categories, index, {name = cat.name})
                AHCC:performSearch(true)
                return true
            end
        end
        return false
    else
        table.remove(data, catIndex)
        index = math.max(1, math.min(index, #data + 1))
        table.insert(data, index, cat)
        for i, c in ipairs(data) do c.order = i end
        AHCC:performSearch(true)
        return true
    end
end

function AHCCCustom:inject(DataTable)

    local DbData1 = {
        data = {
            IsEnabled = true,
            id = "custom_Categories",
            Config = {mode = "merge"},
            Categories = AHCC.db.global.customCategories
        }
    }

    local DbData2 = {
        data = {
            IsEnabled = true,
            id = "custom_Items",
            Config = {mode = "merge"},
            Items = AHCC.db.global.customItems
        }
    }

    table.insert(DataTable, DbData1)
    table.insert(DataTable, DbData2)

    if DevTool and DevTool.AddData then
        DevTool:AddData(AHCC.db.global.customItems, "customItems")
    end

    return DataTable
end

function AHCCCustom:addItemToCat(catName, itemId)

    if DevTool and DevTool.AddData then
        DevTool:AddData(AHCC.db.global.customItems, catName)
    end

    table.insert(AHCC.db.global.customItems[catName], {["id"] = {itemId}})

    AHCCItems:add({nav = catName, id = {itemId}})
end

function AHCCCustom:addItemFromCat(catName, itemId)

    if DevTool and DevTool.AddData then
        DevTool:AddData(AHCC.db.global.customItems[catName], catName)
    end

    if not AHCC.db.global.customItems[catName] then return end

    local function removeByValue(arr, value)
        for i, v in ipairs(arr) do
            if v == value then
                table.remove(arr, i)
                return true -- Item found and removed
            end
        end
        return false -- Item not found
    end

    for index, value in ipairs(AHCC.db.global.customItems[catName]) do
        removeByValue(value["id"], itemId)
        if #value["id"] == 0 then value = nil end
    end

    AHCCItems:remove({nav = catName, id = itemId})

    AHCC:performSearch(true)

end

function AHCCCustom:exist(itemID, catName)
    local data = AHCC.db.global.customItems[catName]
    local found = false
    if not data then return found end
    for index, value in pairs(data) do
        if found == false then found = _.includes(value.id, itemID) end
    end
    return found
end


function AHCCCustom:generateButton(itemKey, rootDescription)
    local function addButton(catName, text, sub)
        local pre = ""
        if AHCCCustom:exist(itemKey.itemID, catName) then
            pre = L["ctx_remove_from"]
        else
            pre = L["ctx_add_to"]
        end
        if sub then pre = "- " .. pre end
        rootDescription:CreateButton(pre .. " " .. text, function()
            if AHCCCustom:exist(itemKey.itemID, catName) then
                AHCCCustom:addItemFromCat(catName, itemKey.itemID)
            else
                AHCCCustom:addItemToCat(catName, itemKey.itemID)
            end
        end);
    end

    local data = AHCC.db.global.customCategories

    for index, value in ipairs(data) do
        addButton(getCategoryId(value.id), value.name)
        if value.categories and value.categories then
            for index, v in ipairs(value.categories) do
                addButton(getCategoryId(value.id, v.name), v.name, true)
            end
        end
    end

end

AuctionHouseFavoriteContextMenuOrg = AuctionHouseFavoriteContextMenu;

function AuctionHouseFavoriteContextMenu(frame, itemKey)
    MenuUtil.CreateContextMenu(frame, function(owner, rootDescription)
        rootDescription:SetTag("MENU_AUCTION_HOUSE_FAVORITE");

        local isFavorite = C_AuctionHouse.IsFavoriteItem(itemKey);

        local function CanChangeFavoriteState()
            return C_AuctionHouse.FavoritesAreAvailable() and
                       (isFavorite or not C_AuctionHouse.HasMaxFavorites());
        end

        local text = isFavorite and AUCTION_HOUSE_DROPDOWN_REMOVE_FAVORITE or
                         AUCTION_HOUSE_DROPDOWN_SET_FAVORITE;
        local buttonDesc = rootDescription:CreateButton(text, function()
            if CanChangeFavoriteState() then
                C_AuctionHouse.SetFavoriteItem(itemKey, not isFavorite);
            end
        end);

        AHCCCustom:generateButton(itemKey, rootDescription)

        buttonDesc:SetEnabled(CanChangeFavoriteState);
    end);
end

