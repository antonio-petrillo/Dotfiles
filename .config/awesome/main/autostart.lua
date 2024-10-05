local awful = require("awful")

awful.spawn.once("setxkbmap -layout us,us -variant ,intl -option grp:ctrls_toggle,ctrl:nocaps")
