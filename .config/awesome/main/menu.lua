local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup.keys").widget
local user = require("main.user")

local beautiful = require("beautiful")

local menu = {}

menu.awesome = {
  { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
  { "restart", awesome.restart },
  { "quit",    function() awesome.quit() end },
}

menu.app = {
  { "emacs",    function() awful.spawn("emacsclient -c -a \"emacs\"") end },
  { "browser",  function() awful.spawn(user.browser) end },
  { "terminal", function() awful.spawn(user.terminal) end },
  { "files",    function() awful.spawn(user.files) end },
}

menu.power = {
  { "shutdown", function() awful.spawn("poweroff") end },
  { "restart",  function() awful.spawn("restart") end },
  { "lock",     function() awful.spawn("i3lock -e -t -f -k -i /usr/share/backgrounds/f40/default/f40-01-night.png") end },
}

return {
    { "app",     menu.app,     beautiful.awesome_icon },
    { "awesome", menu.awesome, beautiful.awesome_icon },
    { "power",   menu.power,   beautiful.awesome_icon },
}
