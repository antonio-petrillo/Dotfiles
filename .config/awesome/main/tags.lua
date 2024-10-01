local awful = require("awful")
local layouts = require("main.layouts")

local _M = {}

function _M.get ()
  local tags = {}

  local tagpairs = {
--  names  = { "term", "net", "edit", "place", 5, 6, 7, 8, 9 },
    names  = { "dev", "web", "term", "chat"},
    layouts = {layouts[1], layouts[3], layouts[3], layouts[3] }
  }

  awful.screen.connect_for_each_screen(function(s)
    tags[s] = awful.tag(tagpairs.names, s, tagpairs.layouts)
  end)

  return tags
end

return setmetatable(
  {},
  { __call = function(_, ...) return _M.get(...) end }
)
