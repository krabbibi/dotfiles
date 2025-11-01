local settings = require "settings"

local minute = sbar.add("item", "widgets.calendar", {
  icon = {
    font = {
      size = 6.0,
    },
    string = "􀀁",
    padding_left = 10,
    padding_right = 6,
  },
  label = {
    font = {
      family = settings.font.numbers,
    },
    padding_left = 0,
    padding_right = 10,
  },
  background = {
    corner_radius = 6,
    height = 30,
    border_color = 0xff000000,
    border_width = 3,
    padding_top = 7,
    padding_bottom = 7,
    color = 0xffb39df3,
    shadow = {
      drawing = true,
      angle = 40,
      distance = 5,
    },
  },
  position = "right",
  update_freq = 30,
  click_script = "open -a 'Calendar'",
  padding_left = 0,
  margin_right = 12,
})

-- english date
minute:subscribe({ "forced", "routine", "system_woke" }, function(_)
  minute:set { label = os.date "%H:%M" }
end)
