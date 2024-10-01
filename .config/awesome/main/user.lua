local gears = require("gears")

local _CONSTANTS = {
  modkey    = "Mod4",
  terminal  = "alacritty",
  browser   = "firefox",
  files     = "nautilus",
  theme_dir = gears.filesystem.get_themes_dir() .. "default/theme.lua",
}

return _CONSTANTS
