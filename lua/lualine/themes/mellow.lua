local colors = require("mellow.colors").dark

return {
  normal = {
    a = { fg = colors.bg, bg = colors.cyan, gui = "bold" },
    b = { fg = colors.white, bg = colors.gray02 },
    c = { fg = colors.white, bg = colors.gray01 },
  },
  command = { a = { fg = colors.bg, bg = colors.yellow, gui = "bold" } },
  insert = { a = { fg = colors.bg, bg = colors.blue, gui = "bold" } },
  visual = { a = { fg = colors.bg, bg = colors.magenta, gui = "bold" } },
  terminal = { a = { fg = colors.bg, bg = colors.green, gui = "bold" } },
  replace = { a = { fg = colors.bg, bg = colors.red, gui = "bold" } },
  inactive = {
    a = { fg = colors.gray05, bg = colors.bg_dark, gui = "bold" },
    b = { fg = colors.gray05, bg = colors.bg_dark },
    c = { fg = colors.gray05, bg = colors.bg_dark },
  },
}
