-- inspired(copied) by: https://github.com/streetturtle/awesome-wm-widgets/blob/master/battery-widget/battery.lua
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

local battery = {}

local function worker()

  local capacity = wibox.widget {
    id = "capacity",
    text = "pujaz",
    font = beautiful.font,
    widget = wibox.widget.textbox,
  }

  battery = wibox.widget {
    capacity,
    layout = wibox.layout.fixed.horizontal,
  }

  awful.widget.watch("acpi", 60, function(widget, stdout)
        local charge = string.match(stdout, '.+: .+, (%d?%d?%d)%%,?.*')
        capacity.text = "BAT: " .. charge
  end, capacity)

  return wibox.container.margin(battery, 5, 5)
end

return setmetatable(battery, { __call = function(_, ...) return worker(...) end })
