local AHCC = LibStub("AceAddon-3.0"):GetAddon("AHCC")
local L = LibStub("AceLocale-3.0"):GetLocale("AHCC")


local AHCCOPT = {}

AHCCOPT.title = "Auction House - Custom Categories"


local defaultConfig = {
   enable = true,
   fastBrowse = false
}

function AHCC:initOptions()
  
   if AHCCDB == nil then
      AHCCDB = defaultConfig
   end

   AHCCOPT:setOptions()

end


 local Options = {
    {
       type = "checkbox",
       variable = "enable",
       name = "Enable Addon", 
       tooltip = "Enable Addon"
    },
    {
      type = "checkbox",
      variable = "fastBrowse",
      name = "Fast Browse", 
      tooltip = "Show Browse Results on Select a Category"
   },
 };


function AHCCOPT:GetDropDownOptions(obj)
   return function()
      local container = Settings.CreateControlTextContainer();
      for v , k in ipairs(obj) do
         container:Add(v - 1, k);
      end
      return container:GetData();
   end
end


 function AHCCOPT:setCheckbox(category, opt)
    local variable, name, tooltip = opt.variable, opt.name, opt.tooltip;
    local setting = Settings.RegisterProxySetting(category, variable, AHCCDB, Settings.VarType.Boolean, name, defaultConfig[opt.variable])
    Settings.CreateCheckBox(category, setting, tooltip);
 end 
 



 --[[
   {
      type = "dropdown",
      variable = "droptest",
      name = "dropdown", 
      tooltip = "dropdown",
      options = {
         "Option A",
         "Option B",
         "Option C"
      } 
 ]]
 function AHCCOPT:setDropDown(category, opt)
   local variable, name, tooltip = opt.variable, opt.name, opt.tooltip;
   local setting = Settings.RegisterProxySetting(category, variable, AHCCDB, Settings.VarType.Number, name, defaultConfig[opt.variable]);
   Settings.CreateDropDown(category, setting, AHCCOPT:GetDropDownOptions(opt.options), tooltip);
end 




function AHCCOPT:generateView() 
   local category, layout = Settings.RegisterVerticalLayoutCategory(AHCCOPT.title);
    
   for k, opt in pairs(Options) do
      if opt.type == "checkbox" then
         AHCCOPT:setCheckbox(category, opt)
      elseif opt.type == "dropdown" then
         AHCCOPT:setDropDown(category, opt)
      elseif opt.type == "slider" then
         --AHCC:setSlider(category, opt)
      end
   end

   Settings.RegisterAddOnCategory(category);
end


 
 function AHCCOPT:setOptions()

   --C_Timer.NewTicker(1, function()
     -- DevTools_Dump(AHCCDB)
   --end)

   AHCCOPT:generateView() 

   -- Please fix this bug blizzard
   -- overwrite SettingsPanel close fucntion in order to aviod error on closing
   function SettingsPanel:ExitWithCommit(skipTransitionBackToOpeningPanel)
      local unrevertable = true;
      self:Commit(unrevertable);
      HideUIPanel(self);
   end

end



