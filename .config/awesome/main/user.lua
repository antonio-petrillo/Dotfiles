local gears = require("gears")

local themes = {
    "default",       -- 1
    "zenburn",       -- 2
}

local chosen_theme = themes[1]

local _CONSTANTS = {
  modkey    = "Mod4",
  altkey    = "Mod1",
  terminal  = "alacritty",
  browser   = "firefox",
  files     = "nautilus",
  theme_dir = string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), chosen_theme),
}

return _CONSTANTS
