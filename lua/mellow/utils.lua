local M = {}

M.highlight = function(highlights)
  local highlight_cmds = {}
  for idx = 1, #highlights do
    local highlight = highlights[idx]
    highlight_cmds[idx] = string.format(
      "highlight %s guifg=%s guibg=%s gui=%s guisp=%s",
      highlight.hg,
      highlight.fg or "NONE",
      highlight.bg or "NONE",
      highlight.gui or "NONE",
      highlight.guisp or "NONE"
    )
  end
  vim.cmd(table.concat(highlight_cmds, "\n"))
end

return M
