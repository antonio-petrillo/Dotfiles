local wezterm = require 'wezterm'
local config = {}

local themes = {
   'Matrix (terminal.sexy)',
   'Man Page (Gogh)',
   'Marrakesh (base16)',
   'Modus-Operandi',
   'Modus-Vivendi'
		 }

config.color_scheme = themes[3]
config.use_dead_keys = true

return config
