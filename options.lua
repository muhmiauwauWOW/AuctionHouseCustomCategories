local AHCC = LibStub("AceAddon-3.0"):GetAddon("AHCC")
local L = LibStub("AceLocale-3.0"):GetLocale("AHCC")

 local Config = {
   globals = {
      title = L["Settings/title"]
   },
   options = {
      {
         type = "checkbox",
         variable = "fastBrowse",
         default = false,
         name = L["Settings/fastBrowse.name"],
         tooltip = L["Settings/fastBrowse.tooltip"]
      }
   }
}


function AHCC:initOptions()
   local lib = LibStub:GetLibrary("SettingsLib")
   lib.createSettings(self, AHCCDB, Config)
end

