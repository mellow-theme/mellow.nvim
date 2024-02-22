local variants = require("mellow.colors")
local cfg = require("mellow.config").config
local c = variants[cfg.variant]
local M = {}

local set_terminal_colors = function()
  vim.g.terminal_color_0 = c.black
  vim.g.terminal_color_1 = c.red
  vim.g.terminal_color_2 = c.green
  vim.g.terminal_color_3 = c.yellow
  vim.g.terminal_color_4 = c.blue
  vim.g.terminal_color_5 = c.magenta
  vim.g.terminal_color_6 = c.cyan
  vim.g.terminal_color_7 = c.white
  vim.g.terminal_color_8 = c.bright_black
  vim.g.terminal_color_9 = c.bright_red
  vim.g.terminal_color_10 = c.bright_green
  vim.g.terminal_color_11 = c.bright_yellow
  vim.g.terminal_color_12 = c.bright_blue
  vim.g.terminal_color_13 = c.bright_magenta
  vim.g.terminal_color_14 = c.bright_cyan
  vim.g.terminal_color_15 = c.bright_white
  vim.g.terminal_color_background = c.bg
  vim.g.terminal_color_foreground = c.fg
end

local set_groups = function()
  local highlights = {
    ["Comment"] = { fg = c.gray05, style = cfg.comment_style }, -- any comment
    ["Constant"] = { fg = c.cyan }, -- any constant
    ["String"] = { fg = c.green }, -- a string constant: "this is a string"
    ["Character"] = { fg = c.green }, -- a character constant: 'c', '\n'
    ["Number"] = { fg = c.magenta }, -- a number constant: 234, 0xff
    ["Boolean"] = { fg = c.yellow, style = cfg.boolean_style }, -- a boolean constant: TRUE, false
    ["Float"] = { fg = c.magenta }, -- a floating point constant: 2.3e10
    ["Identifier"] = { fg = c.fg, style = cfg.variable_style }, -- any variable name
    ["Function"] = { fg = c.white, style = cfg.function_style }, -- function name (also: methods for classes)
    ["Statement"] = { fg = c.white }, -- any statement
    ["Conditional"] = { fg = c.blue }, -- if, then, else, endif, switch, etc.
    ["Repeat"] = { fg = c.blue }, -- for, do, while, etc.
    ["Label"] = { fg = c.blue }, -- case, default, etc.
    ["Operator"] = { fg = c.yellow }, -- sizeof", "+", "*", etc.
    ["Keyword"] = { fg = c.blue, style = cfg.keyword_style }, -- any other keyword
    ["Exception"] = { fg = c.purple }, -- try, catch, throw
    ["PreProc"] = { fg = c.cyan }, -- generic Preprocessor
    ["Include"] = { fg = c.blue }, -- preprocessor #include
    ["Define"] = { fg = c.cyan }, -- preprocessor #define
    ["Macro"] = { fg = c.cyan }, -- same as Define
    ["PreCondit"] = { fg = c.cyan }, -- preprocessor #if, #else, #endif, etc.
    ["Type"] = { fg = c.bright_blue }, -- int, long, char, etc.
    ["StorageClass"] = { fg = c.yellow }, -- static, register, volatile, etc.
    ["Structure"] = { fg = c.yellow }, -- struct, union, enum, etc.
    ["Typedef"] = { fg = c.yellow }, -- A typedef
    ["Special"] = { fg = c.blue }, -- any special symbol
    ["SpecialChar"] = { fg = c.yellow }, -- special character in a constant
    ["Tag"] = { fg = c.yellow }, -- you can use CTRL-] on this
    ["SpecialComment"] = { fg = c.gray05 }, -- special things inside a comment
    ["Debug"] = { fg = c.yellow }, -- debugging statements
    ["Underlined"] = { underline = true }, -- text that stands out, HTML links
    ["Error"] = { fg = c.red }, -- any erroneous construct
    ["Todo"] = { fg = c.yellow }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- Highlighting Groups (descriptions and ordering from ` =h highlight-groups`) {{{
    ["ColorColumn"] = { bg = c.gray01 }, -- used for the columns set with 'colorcolumn'
    ["Conceal"] = { fg = c.gray01 }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    ["Cursor"] = { fg = c.black, bg = c.fg }, -- the character under the cursor
    ["lCursor"] = { fg = c.black, bg = c.fg }, -- the character under the cursor
    ["CursorIM"] = { fg = c.black, bg = c.fg }, -- the character under the cursor
    ["CursorLine"] = { bg = c.gray01 }, -- the screen line that the cursor is in when 'cursorline' is set
    ["Directory"] = { fg = c.blue }, -- directory names (and other special names in listings)
    ["DiffAdd"] = { bg = c.green, fg = c.black }, -- diff mode: Added line
    ["DiffChange"] = { fg = c.yellow, underline = true }, -- diff mode: Changed line
    ["DiffDelete"] = { bg = c.red, fg = c.black }, -- diff mode: Deleted line
    ["DiffText"] = { bg = c.yellow, fg = c.black }, -- diff mode: Changed text within a changed line
    ["ErrorMsg"] = { fg = c.red }, -- error messages on the command line
    ["VertSplit"] = { fg = c.gray02 }, -- the column separating vertically split windows
    ["WinSeparator"] = { fg = c.gray02 }, -- the column separating vertically split windows
    ["Folded"] = { fg = c.gray04 }, -- line used for closed folds
    ["FoldColumn"] = { bg = cfg.transparent and c.none or c.bg, fg = c.gray05 }, -- column where folds are displayed
    ["SignColumn"] = { bg = cfg.transparent and c.none or c.bg, fg = c.gray05 }, -- column where signs are displayed
    ["IncSearch"] = { fg = c.black, bg = c.yellow }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    ["CurSearch"] = { fg = c.black, bg = c.yellow }, -- 'cursearch' highlighting; also used for the text replaced with ":s///c"
    ["LineNr"] = { fg = c.gray04 }, -- Line number for " =number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    ["CursorLineNr"] = { fg = c.gray06 }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    ["MatchParen"] = { fg = c.yellow, underline = true }, -- The character under the cursor or just before it, if it is a paired bracket, and its match.
    ["ModeMsg"] = { fg = c.gray03, bold = true }, --' showmode' message (e.g., "-- INSERT --")
    ["MoreMsg"] = { fg = c.bright_magenta }, -- more-prompt
    ["NonText"] = { fg = c.gray02 }, --'~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
    ["Normal"] = { fg = c.fg, bg = cfg.transparent and c.none or c.bg }, -- normal text
    ["NormalNC"] = { fg = c.fg, bg = cfg.transparent and c.none or c.bg_dark }, -- normal text
    ["NormalFloat"] = { fg = c.white, bg = c.gray00 }, -- Normal text in floating windows.
    ["FloatBorder"] = { fg = c.gray03, bg = c.bg }, -- Border of floating windows.
    ["Pmenu"] = { fg = c.white, bg = c.black }, -- Popup menu: normal item.
    ["PmenuSel"] = { fg = c.bright_white, bg = c.gray03 }, -- Popup menu: selected item.
    ["PmenuSbar"] = { bg = c.gray02 }, -- Popup menu: scrollbar.
    ["PmenuThumb"] = { bg = c.gray03 }, -- Popup menu: Thumb of the scrollbar.
    ["Question"] = { fg = c.blue }, -- hit-enter prompt and yes/no questions
    ["QuickFixLine"] = { fg = c.cyan, bg = c.gray02 }, -- Current quickfix item in the quickfix window.
    ["Search"] = { fg = c.bright_yellow, bg = c.black }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    ["SpecialKey"] = { fg = c.special_grey }, -- Meta and special keys listed with " =map", also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.
    ["SpellBad"] = { fg = c.red, underline = true }, -- Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
    ["SpellCap"] = { fg = c.yellow }, -- Word that should start with a capital. This will be combined with the highlighting used otherwise.
    ["SpellLocal"] = { fg = c.yellow }, -- Word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise.
    ["SpellRare"] = { fg = c.yellow }, -- Word that is recognized by the spellchecker as one that is hardly ever used. spell This will be combined with the highlighting used otherwise.
    ["StatusLine"] = { fg = c.white, bg = c.gray01 }, -- status line of current window
    ["StatusLineNC"] = { fg = c.bg_dark }, -- status lines of not-current windows Note = if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    ["StatusLineTerm"] = { fg = c.white, bg = c.gray01 }, -- status line of current :terminal window
    ["StatusLineTermNC"] = { fg = c.gray05 }, -- status line of non-current  =terminal window
    ["TabLine"] = { fg = c.gray05 }, -- tab pages line, not active tab page label
    ["TabLineFill"] = { bg = c.black }, -- tab pages line, where there are no labels
    ["TabLineSel"] = { fg = c.white }, -- tab pages line, active tab page label
    ["Terminal"] = { fg = c.fg, bg = c.black }, -- terminal window (see terminal-size-color)
    ["Title"] = { fg = c.green }, -- titles for output from " =set all", ":autocmd" etc.
    ["Visual"] = { bg = c.gray02 }, -- Visual mode selection
    ["VisualNOS"] = { bg = c.gray02 }, -- Visual mode selection when vim is "Not Owning the Selection". Only X11 Gui's gui-x11 and xterm-clipboard supports this.
    ["WarningMsg"] = { fg = c.yellow }, -- warning messages
    ["WildMenu"] = { fg = c.black, bg = c.blue }, -- current match in 'wildmenu' completion
    ["Winbar"] = { fg = c.white, bg = c.gray01 }, -- Winbar
    ["WinbarNC"] = { fg = c.gray05, bg = c.bg_dark }, -- Winbar non-current windows.

    -- HTML
    ["htmlArg"] = { fg = c.bright_blue, italic = true }, -- attributes
    ["htmlEndTag"] = { fg = c.gray06 }, -- end tag />
    ["htmlTitle"] = { fg = c.gray07 }, -- title tag text
    ["htmlTag"] = { fg = c.gray06 }, -- tag delimiters
    ["htmlTagN"] = { fg = c.gray06 },
    ["htmlTagName"] = { fg = c.cyan }, -- tag text

    -- Markdown
    ["markdownH1"] = { fg = c.bright_blue, bold = true },
    ["markdownH2"] = { fg = c.bright_blue, bold = true },
    ["markdownH3"] = { fg = c.bright_blue, bold = true },
    ["markdownH4"] = { fg = c.bright_blue, bold = true },
    ["markdownH5"] = { fg = c.bright_blue, bold = true },
    ["markdownH6"] = { fg = c.bright_blue, bold = true },
    ["markdownHeadingDelimiter"] = { fg = c.gray05 },
    ["markdownHeadingRule"] = { fg = c.gray05 },
    ["markdownId"] = { fg = c.cyan },
    ["markdownIdDeclaration"] = { fg = c.blue },
    ["markdownIdDelimiter"] = { fg = c.cyan },
    ["markdownLinkDelimiter"] = { fg = c.gray05 },
    ["markdownLinkText"] = { fg = c.blue, italic = true },
    ["markdownListMarker"] = { fg = c.gray05 },
    ["markdownOrderedListMarker"] = { fg = c.gray05 },
    ["markdownRule"] = { fg = c.gray05 },
    ["markdownUrl"] = { fg = c.green, bg = c.none },
    ["markdownBlockquote"] = { fg = c.gray07 },
    ["markdownBold"] = { fg = c.fg, bg = c.none, bold = true },
    ["markdownItalic"] = { fg = c.fg, bg = c.none, italic = true },
    ["markdownCode"] = { fg = c.yellow },
    ["markdownCodeBlock"] = { fg = c.yellow },
    ["markdownCodeDelimiter"] = { fg = c.gray05 },

    -- Tree sitter
    ["@boolean"] = { fg = c.yellow, style = cfg.boolean_style },
    ["@constructor"] = { fg = c.gray06 },
    ["@constant.builtin"] = { fg = c.yellow },
    ["@keyword.function"] = { fg = c.cyan, style = cfg.function_style },
    ["@namespace"] = { fg = c.cyan, italic = true },
    ["@parameter"] = { fg = c.magenta },
    ["@property"] = { fg = c.gray07 },
    ["@punctuation"] = { fg = c.gray06 },
    ["@punctuation.delimiter"] = { fg = c.gray06 },
    ["@punctuation.bracket"] = { fg = c.gray06 },
    ["@punctuation.special"] = { fg = c.gray06 },
    ["@string.documentation"] = { fg = c.green, style = cfg.comment_style },
    ["@string.regex"] = { fg = c.blue },
    ["@string.escape"] = { fg = c.magenta },
    ["@symbol"] = { fg = c.yellow },
    ["@tag"] = { fg = c.cyan },
    ["@tag.attribute"] = { fg = c.bright_blue, italic = true },
    ["@tag.delimiter"] = { fg = c.gray06 },
    ["@type.builtin"] = { fg = c.magenta },
    ["@variable"] = { fg = c.fg, style = cfg.variable_style },
    ["@variable.builtin"] = { fg = c.blue, style = cfg.variable_style },
    ["@variable.parameter"] = { fg = c.magenta, style = cfg.variable_style },
    -- Tree sitter language specific overrides
    ["@constructor.javascript"] = { fg = c.cyan },
    ["@keyword.clojure"] = { fg = c.bright_cyan, style = cfg.keyword_style },

    -- LSP Semantic Token Groups
    ["@lsp.type.boolean"] = { link = "@boolean" },
    ["@lsp.type.builtinType"] = { link = "@type.builtin" },
    ["@lsp.type.comment"] = { link = "@comment" },
    ["@lsp.type.enum"] = { link = "@type" },
    ["@lsp.type.enumMember"] = { link = "@constant" },
    ["@lsp.type.escapeSequence"] = { link = "@string.escape" },
    ["@lsp.type.formatSpecifier"] = { link = "@punctuation.special" },
    ["@lsp.type.interface"] = { fg = c.blue },
    ["@lsp.type.keyword"] = { link = "@keyword" },
    ["@lsp.type.namespace"] = { link = "@namespace" },
    ["@lsp.type.number"] = { link = "@number" },
    ["@lsp.type.operator"] = { link = "@operator" },
    ["@lsp.type.parameter"] = { link = "@parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },
    ["@lsp.type.string.rust"] = { link = "@string" },
    ["@lsp.type.typeAlias"] = { link = "@type.definition" },
    ["@lsp.type.unresolvedReference"] = { undercurl = true, sp = c.error },
    ["@lsp.typemod.class.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.enum.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
    ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.keyword.async"] = { link = "@keyword.coroutine" },
    ["@lsp.typemod.macro.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.operator.injected"] = { link = "@operator" },
    ["@lsp.typemod.string.injected"] = { link = "@string" },
    ["@lsp.typemod.type.defaultLibrary"] = { fg = c.blue },
    ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
    ["@lsp.typemod.variable.injected"] = { link = "@variable" },

    ["@markup.heading"] = { fg = c.gray06, bold = true },
    ["@markup.heading.1"] = { fg = c.gray06, bold = true, italic = true },
    ["@markup.heading.1.marker"] = { link = "@comment" },
    ["@markup.heading.2"] = { fg = c.gray06, bold = true, italic = true },
    ["@markup.heading.2.marker"] = { link = "@comment" },
    ["@markup.heading.3"] = { fg = c.gray06, bold = true, italic = true },
    ["@markup.heading.3.marker"] = { link = "@comment" },
    ["@markup.heading.4"] = { fg = c.gray06, bold = true, italic = true },
    ["@markup.heading.4.marker"] = { link = "@comment" },
    ["@markup.heading.5"] = { fg = c.gray06, bold = true, italic = true },
    ["@markup.heading.5.marker"] = { link = "@comment" },
    ["@markup.heading.6"] = { fg = c.gray06, bold = true, italic = true },
    ["@markup.heading.6.marker"] = { link = "@comment" },
    ["@markup.link"] = { fg = c.gray06 },
    ["@markup.link.label"] = { fg = c.cyan },
    ["@markup.link.url"] = { fg = c.blue },
    ["@markup.list"] = { fg = c.gray05, bold = true },
    ["@markup.list.checked"] = { fg = c.gray05 },
    ["@markup.list.unchecked"] = { fg = c.gray05 },
    ["@markup.raw.block"] = { fg = c.gray05 },
    ["@markup.raw.delimiter"] = { fg = c.gray05 },
    ["@markup.quote"] = { fg = c.gray06 },
    ["@markup.strikethrough"] = { fg = c.gray04, strikethrough = true },

    -- Diagnostics
    ["DiagnosticOk"] = { fg = c.green },
    ["DiagnosticError"] = { fg = c.red },
    ["DiagnosticWarn"] = { fg = c.yellow },
    ["DiagnosticInfo"] = { fg = c.blue },
    ["DiagnosticHint"] = { fg = c.cyan },
    ["DiagnosticUnderlineError"] = { fg = c.red, underline = true },
    ["DiagnosticUnderlineWarn"] = { fg = c.yellow, underline = true },
    ["DiagnosticUnderlineInfo"] = { fg = c.blue, underline = true },
    ["DiagnosticUnderlineHint"] = { fg = c.cyan, underline = true },

    -- Neovim's built-in language server client
    ["LspReferenceWrite"] = { fg = c.blue, underline = true },
    ["LspReferenceText"] = { fg = c.blue, underline = true },
    ["LspReferenceRead"] = { fg = c.blue, underline = true },
    ["LspSignatureActiveParameter"] = { fg = c.yellow, bold = true },

    -- GitSigns
    ["GitSignsAdd"] = { fg = c.green },
    ["GitSignsChange"] = { fg = c.yellow },
    ["GitSignsDelete"] = { fg = c.red },

    -- Diff
    ["diffAdded"] = { fg = c.bright_green },
    ["diffRemoved"] = { fg = c.bright_red },
    ["diffChanged"] = { fg = c.bright_yellow },
    ["diffOldFile"] = { fg = c.gray04 },
    ["diffNewFile"] = { fg = c.white },
    ["diffFile"] = { fg = c.gray05 },
    ["diffLine"] = { fg = c.cyan },
    ["diffIndexLine"] = { fg = c.magenta },

    -- Hop
    ["HopNextKey"] = { fg = c.bright_yellow },
    ["HopNextKey1"] = { fg = c.bright_blue },
    ["HopNextKey2"] = { fg = c.bright_cyan },
    ["HopUnmatched"] = { fg = c.gray04 },
    ["HopCursor"] = { fg = c.bright_cyan },
    ["HopPreview"] = { fg = c.bright_blue },

    -- Cmp
    ["CmpItemAbbrDeprecated"] = { fg = c.gray06, strikethrough = true },
    ["CmpItemAbbrMatch"] = { fg = c.blue, bold = true },
    ["CmpItemAbbrMatchFuzzy"] = { fg = c.blue, bold = true },
    ["CmpItemMenu"] = { fg = c.gray05 },
    ["CmpItemKindText"] = { fg = c.gray06 },
    ["CmpItemKindFunction"] = { fg = c.cyan },
    ["CmpItemKindVariable"] = { fg = c.bright_white },
    ["CmpItemKindEnum"] = { fg = c.green },
    ["CmpItemKindSnippet"] = { fg = c.yellow },

    -- Navic
    ["NavicIconsFile"] = { fg = c.fg, bg = c.none },
    ["NavicIconsModule"] = { fg = c.yellow, bg = c.none },
    ["NavicIconsNamespace"] = { fg = c.fg, bg = c.none },
    ["NavicIconsPackage"] = { fg = c.fg, bg = c.none },
    ["NavicIconsClass"] = { fg = c.cyan, bg = c.none },
    ["NavicIconsMethod"] = { fg = c.blue, bg = c.none },
    ["NavicIconsProperty"] = { fg = c.green, bg = c.none },
    ["NavicIconsField"] = { fg = c.green, bg = c.none },
    ["NavicIconsConstructor"] = { fg = c.cyan, bg = c.none },
    ["NavicIconsEnum"] = { fg = c.cyan, bg = c.none },
    ["NavicIconsInterface"] = { fg = c.cyan, bg = c.none },
    ["NavicIconsFunction"] = { fg = c.blue, bg = c.none },
    ["NavicIconsVariable"] = { fg = c.magenta, bg = c.none },
    ["NavicIconsConstant"] = { fg = c.magenta, bg = c.none },
    ["NavicIconsString"] = { fg = c.green, bg = c.none },
    ["NavicIconsNumber"] = { fg = c.cyan, bg = c.none },
    ["NavicIconsBoolean"] = { fg = c.yellow, bg = c.none },
    ["NavicIconsArray"] = { fg = c.gray06, bg = c.none },
    ["NavicIconsObject"] = { fg = c.gray06, bg = c.none },
    ["NavicIconsKey"] = { fg = c.blue, bg = c.none },
    ["NavicIconsKeyword"] = { fg = c.blue, bg = c.none },
    ["NavicIconsNull"] = { fg = c.cyan, bg = c.none },
    ["NavicIconsEnumMember"] = { fg = c.green, bg = c.none },
    ["NavicIconsStruct"] = { fg = c.cyan, bg = c.none },
    ["NavicIconsEvent"] = { fg = c.cyan, bg = c.none },
    ["NavicIconsOperator"] = { fg = c.fg, bg = c.none },
    ["NavicIconsTypeParameter"] = { fg = c.green, bg = c.none },
    ["NavicText"] = { fg = c.white, bg = c.none },
    ["NavicSeparator"] = { fg = c.gray06, bg = c.none },

    -- Notify
    ["NotifyBackground"] = { fg = c.white, bg = c.bg },
    ["NotifyERRORBorder"] = { fg = c.red, bg = cfg.transparent and c.none or c.bg },
    ["NotifyWARNBorder"] = { fg = c.yellow, bg = cfg.transparent and c.none or c.bg },
    ["NotifyINFOBorder"] = { fg = c.blue, bg = cfg.transparent and c.none or c.bg },
    ["NotifyDEBUGBorder"] = { fg = c.gray06, bg = cfg.transparent and c.none or c.bg },
    ["NotifyTRACEBorder"] = { fg = c.cyan, bg = cfg.transparent and c.none or c.bg },
    ["NotifyERRORIcon"] = { fg = c.bright_red },
    ["NotifyWARNIcon"] = { fg = c.bright_yellow },
    ["NotifyINFOIcon"] = { fg = c.bright_blue },
    ["NotifyDEBUGIcon"] = { fg = c.gray05 },
    ["NotifyTRACEIcon"] = { fg = c.bright_cyan },
    ["NotifyERRORTitle"] = { fg = c.bright_red },
    ["NotifyWARNTitle"] = { fg = c.bright_yellow },
    ["NotifyINFOTitle"] = { fg = c.bright_blue },
    ["NotifyDEBUGTitle"] = { fg = c.gray05 },
    ["NotifyTRACETitle"] = { fg = c.bright_cyan },
    ["NotifyERRORBody"] = { fg = c.white, bg = cfg.transparent and c.none or c.bg },
    ["NotifyWARNBody"] = { fg = c.white, bg = cfg.transparent and c.none or c.bg },
    ["NotifyINFOBody"] = { fg = c.white, bg = cfg.transparent and c.none or c.bg },
    ["NotifyDEBUGBody"] = { fg = c.white, bg = cfg.transparent and c.none or c.bg },
    ["NotifyTRACEBody"] = { fg = c.white, bg = cfg.transparent and c.none or c.bg },

    -- NeoTree
    ["NeoTreeFloatBorder"] = { fg = c.gray03, bg = c.bg },
    ["NeoTreeFloatTitle"] = { fg = c.gray05, bg = c.gray07 },
    ["NeoTreeTitleBar"] = { fg = c.gray05, bg = c.gray01 },

    -- Telescope
    ["TelescopeBorder"] = { fg = c.bg, bg = c.bg },
    ["TelescopeNormal"] = { fg = c.fg, bg = c.bg },
    ["TelescopePreviewTitle"] = { fg = c.black, bg = c.green, bold = true },
    ["TelescopeResultsTitle"] = { fg = c.bg, bg = c.bg },
    ["TelescopePromptTitle"] = { fg = c.black, bg = c.cyan, bold = true },
    ["TelescopePromptBorder"] = { fg = c.gray01, bg = c.gray01 },
    ["TelescopePromptNormal"] = { fg = c.gray06, bg = c.gray01 },
    ["TelescopePromptCounter"] = { fg = c.gray04, bg = c.gray01 },
    ["TelescopeMatching"] = { fg = c.yellow, underline = true },
  }

  for name, val in pairs(highlights) do
    if val.style then
      if type(val.style) == "table" then
        val = vim.tbl_extend("force", val, val.style)
      end
      val.style = nil
    end
    vim.api.nvim_set_hl(0, name, val)
  end
end

M.colorscheme = function()
  vim.api.nvim_command("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.api.nvim_command("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "mellow"

  set_terminal_colors()
  set_groups()
end

return M
