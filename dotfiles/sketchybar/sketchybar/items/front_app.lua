local colors = require("colors").sections
local icon_map = require "helpers.icon_map"

sbar.add("item", "e_bracket.padding", {
  position = "e",
  background = {
    drawing = false,
  },
  width = 12,
})
local front_app = sbar.add("item", "front_app", {
  position = "e",
  display = "active",
  icon = {
    padding_left = 18,
    font = "sketchybar-app-font:Regular:14.0",
    string = "app",
    padding_right = 7,
    color = 0xff000000,
  },
  label = {
    pading_left = 7,
    padding_right = 18,
    color = 0xff000000,
  },
  background = {
    corner_radius = 8,
    border_color = 0xff000000,
    border_width = 3,
    padding_top = 7,
    padding_bottom = 7,
    color = 0xffb39df3,
  },
  updates = true,
})

sbar.add("bracket", { "/front\\_app/" }, {
  background = {
    color = colors.bracket.bg,
    height = 34,
    border_color = colors.bracket.border,
    corner_radius = 9999,
  },
})

front_app:subscribe("front_app_switched", function(env)
  local app = env.INFO
  front_app:set {
    icon = {
      string = (icon_map[app] or icon_map["default"]),
    },
    label = {
      string = env.INFO,
    },
  }
end)
