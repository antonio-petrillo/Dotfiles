local awful     = require("awful")
local beautiful = require("beautiful")

local _M = {}

-- reading
-- https://awesomewm.org/apidoc/libraries/awful.rules.html

function _M.get(clientkeys, clientbuttons)
  local rules = {

    -- All clients will match this rule.
    { rule = { },
      properties = {
        border_width = beautiful.border_width,
        border_color = beautiful.border_normal,
        focus     = awful.client.focus.filter,
        raise     = true,
        keys      = clientkeys,
        buttons   = clientbuttons,
        screen    = awful.screen.preferred,
        placement = awful.placement.no_overlap+awful.placement.no_offscreen
      }
    },

    -- Floating clients.
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
          "pinentry",
        },
        class = {
          "Arandr",
          "Blueman-manager",
          "Gpick",
          "Kruler",
          "MessageWin",  -- kalarm.
          "Sxiv",
          "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
          "Wpa_gui",
          "veromix",
          "xtightvncviewer"},

        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {
          "Event Tester",  -- xev.
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "ConfigManager",  -- Thunderbird's about:config.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      },
      properties = {
        floating = true
      }
    },

    -- Add titlebars to normal clients and dialogs
    { rule_any = {
        type = { "normal", "dialog" }
      },
      properties = {
        titlebars_enabled = false
      }
    },

    { rule = { class = "firefox" },
      properties = { tag = "web" } },

    { rule = { class = "emacs-gtk_x11" },
      properties = { tag = "main" } },
    { rule = { class = "Emacs-gtk+x11" },
      properties = { tag = "main" } },
    { rule = { class = "dev.zed.Zed" },
      properties = { tag = "main" } },

    { rule = { class = "org.gnome.Nautilus" },
      properties = { tag = "app" } },
    { rule = { class = "Bitwarden" },
      properties = { tag = "app" } },
    { rule = { class = "bitwarden" },
      properties = { tag = "app" } },
    { rule = { class = "steam" },
      properties = { tag = "app" } },
    { rule = { class = "steamwebhelper" },
      properties = { tag = "app" } },
    { rule = { class = "ktouch" },
      properties = { tag = "app" } },

    { rule = { class = "teams-for-linux" },
      properties = { tag = "chat" } },

    { rule = { class = "Alacritty" },
      properties = { tag = "term" } },

  }

  return rules
end

return setmetatable(
  {},
  { __call = function(_, ...) return _M.get(...) end }
)
