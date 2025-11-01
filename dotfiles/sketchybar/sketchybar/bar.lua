local colors = require("colors").sections.bar

-- Equivalent to the --bar domain
sbar.bar {
  topmost = "window",
  position = "top",
  height = 40,
  color = colors.bg,
  y_offset = 0,
  padding_right = 6,
  padding_left = 6,
  border_color = colors.border,
  border_width = 3,
  blur_radius = 40,
  margin = 0,
  corner_radius = 0,
  shadow = true,
}
