local M = {}

local function opt(key, default)
  key = "mellow_" .. key
  if vim.g[key] == nil then
    return default
  end
  if vim.g[key] == 0 then
    return false
  end

  return vim.g[key]
end

local function style(italic, bold)
  if italic and bold then
    return { bold = true, italic = true }
  elseif italic then
    return { italic = true }
  elseif bold then
    return { bold = true }
  else
    return {}
  end
end

M.config = {
  transparent = opt("transparent", false),
  comment_style = style(opt("italic_comments", true), opt("bold_comments", false)),
  keyword_style = style(opt("italic_keywords", false), opt("bold_keywords", false)),
  boolean_style = style(opt("italic_booleans", false), opt("bold_booleans", false)),
  function_style = style(opt("italic_functions", false), opt("bold_functions", false)),
  variable_style = style(opt("italic_variables", false), opt("bold_variables", false)),
  variant = opt("variant", "dark"),
}

return M
