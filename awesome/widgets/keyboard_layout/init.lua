local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")

local keyboard_widget = function ()
   local kb_widget = wibox.widget {
	  kb_layout = "us",
	  {
		 id = "kb",
		 markup = "us",
		 halign = "center",
		 valign = "center",
		 widget = wibox.widget.textbox
	  },
	  margin = 4,
	  widget = wibox.container.margin,
	  toggle = function(self)
		 if self.kb_layout == "us" then
			self.kb_layout = "us-intl"
			self:get_children_by_id('kb')[1]:set_markup("us-intl")
			awful.spawn.with_shell("setxkbmap us -variant intl -option ctrl:nocaps")
		 else
			self.kb_layout = "us"
			self:get_children_by_id('kb')[1]:set_markup("us")
			awful.spawn.with_shell("setxkbmap us -option ctrl:nocaps")
		 end
	  end
   }

   kb_widget:buttons(gears.table.join(
						kb_widget:buttons(),
						awful.button({}, 1, nil, function () kb_widget:toggle() end)
   ))

   return kb_widget
end

return keyboard_widget
