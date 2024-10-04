local gears = require("gears")
local awful = require("awful")
local user = require("main.user")

return gears.table.join(
    awful.key({ user.modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ user.modkey, "Shift"   }, "q",      function (c)
        local num_clients = #awful.screen.focused().selected_tag:clients()
        if num_clients > 1 then
          c:kill()
        end
    end,
              {description = "close (leave last open)", group = "client"}),
    awful.key({ user.altkey,           }, "F4",      function (c) c:kill() end,
              {description = "close", group = "client"}),
    awful.key({ user.modkey, "Shift" }, "f",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),

    awful.key({ user.modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),

    awful.key({ user.modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),

    awful.key({ user.modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ user.modkey,           }, "s",      function (c) c.sticky = not c.sticky            end,
              {description = "toggle sticky", group = "client"}),

    awful.key({ user.modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ user.modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),
    -- awful.key({ user.modkey, "Control" }, "m",
    --     function (c)
    --         c.maximized_vertical = not c.maximized_vertical
    --         c:raise()
    --     end ,
    --     {description = "(un)maximize vertically", group = "client"}),
    awful.key({ user.modkey, "Shift"   }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = "(un)maximize horizontally", group = "client"})
)
