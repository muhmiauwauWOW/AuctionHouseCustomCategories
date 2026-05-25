local addonName = ...
local AHCC = LibStub("AceAddon-3.0"):GetAddon("AHCC")
local L, _ = AHCC:GetLibs()

AHCCOptions = {}

function AHCCOptions:init()
    local AddOnInfo = {C_AddOns.GetAddOnInfo(addonName)}
    local category, layout = Settings.RegisterVerticalLayoutCategory(AddOnInfo[2])
    self.category = category
    self.layout = layout
  
    Settings.RegisterAddOnCategory(category)
    AHCC.OptionsID = category:GetID()

    local data = { settings = {}, text = L["opt_Desc"] }
	local initializer = Settings.CreatePanelInitializer("AHCCDescTemplate", data);
	self.layout:AddInitializer(initializer);



    local catOptionsKeys = {};
    local function GetOptions()
        local catOptions = Settings.CreateControlTextContainer();
        catOptions:Add(0, "");

        for index, entry in ipairs(AHCC.db.global.customCategories) do
            catOptions:Add(index, entry.name);
            table.insert(catOptionsKeys, index)
        end

        return catOptions:GetData();
    end

    local selectedOption = {}
    local categorieSetting = Settings.RegisterAddOnSetting(self.category,
                                                           "AHCCOptionsdummyVar",
                                                           "AHCCOptionsdummyVar",
                                                           selectedOption,
                                                           "number",
                                                           L["opt_dropdown_name"],
                                                           0)
    Settings.CreateDropdown(self.category, categorieSetting, GetOptions,
                            L["opt_dropdown_desc"]);

    self.layout:AddInitializer(CreateSettingsButtonInitializer("", L["opt_btn_add_rename"],
                                                               function()
        local Text = ""

        if not selectedOption.AHCCOptionsdummyVar then return end

        if selectedOption.AHCCOptionsdummyVar == 0 then
            Text = L["opt_new_category_prompt"]
        else
            for index, entry in ipairs(AHCC.db.global.customCategories) do
                if index == selectedOption.AHCCOptionsdummyVar then
                    Text = L["opt_rename_prefix"] .. entry.name
                end
            end
        end

        StaticPopupDialogs["AHCCOptions_add_rename_category"] = {
            text = Text,
            button1 = YES,
            button2 = CANCEL,
            hasEditBox = 1,
            maxLetters = 32,
            OnAccept = function(dialog, data)
                local text = dialog:GetEditBox():GetText();
                AHCCCustom:addRenameCategory(selectedOption.AHCCOptionsdummyVar,
                                             text)
            end,
            OnShow = function(dialog, data)
                dialog:GetEditBox():SetFocus();
            end,
            EditBoxOnEnterPressed = function(editBox, data)
                local dialog = editBox:GetParent();
                local text = editBox:GetText();
                AHCCCustom:addRenameCategory(selectedOption.AHCCOptionsdummyVar,
                                             text)
                dialog:Hide();
            end,
            timeout = 0,
            whileDead = true,
            hideOnEscape = true
        }

        StaticPopup_Show("AHCCOptions_add_rename_category")
    end, nil, false));

    self.layout:AddInitializer(CreateSettingsButtonInitializer("", L["opt_btn_up"],function()
       selectedOption.AHCCOptionsdummyVar = AHCCCustom:customCategoriesMoveUpDown(selectedOption.AHCCOptionsdummyVar, "up")
    end, nil, false));

    self.layout:AddInitializer(CreateSettingsButtonInitializer("", L["opt_btn_down"],function()
        selectedOption.AHCCOptionsdummyVar = AHCCCustom:customCategoriesMoveUpDown(selectedOption.AHCCOptionsdummyVar, "down")
    end, nil, false));





    self.layout:AddInitializer(CreateSettingsButtonInitializer(
        "", 
        L["opt_CharacterDelete_btn_name"],
        function() 
            if not selectedOption.AHCCOptionsdummyVar or selectedOption.AHCCOptionsdummyVar == 0 then return end

            StaticPopupDialogs["AHCCOptions_CONFIM_DELETE"] = {
                text =  L["opt_CharacterDelete_confirm_text"],
                button1 = YES,
                button2 = NO,
                OnAccept = function()
                    AHCCCustom:customCategoriesDeleteCategory(selectedOption.AHCCOptionsdummyVar)
                    selectedOption.AHCCOptionsdummyVar = 0
                end,
                timeout = 0,
                whileDead = true,
                hideOnEscape = true,
            }
        
            StaticPopup_Show("AHCCOptions_CONFIM_DELETE")
        end,
        nil,
        false
    ));







end



AHCCDescTemplateMixin = {}

function AHCCDescTemplateMixin:Init(initializer)
	self.text = initializer.data.text
	self.Text:SetText(self.text)
end


