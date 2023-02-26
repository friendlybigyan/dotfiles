require("notify").setup({
  background_colour = "Normal",
  fps = 60,
  icons = {
    DEBUG = "",
    ERROR = "",
    INFO = "",
    TRACE = "✎",
    WARN = ""
  },
  level = 2,
  minimum_width = 30,
  render = "compact",
  stages = "fade_in_slide_out",
  timeout = 3000,
  top_down = true
})
