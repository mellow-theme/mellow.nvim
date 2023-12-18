local variants = require("mellow.colors")
local utils = require("mellow.utils")
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
    -- Syntax Groups (descriptions and ordering from `:h w18`)
    { hg = "Comment", fg = c.gray05, gui = cfg.comment_style }, -- any comment
    { hg = "Constant", fg = c.cyan }, -- any constant
    { hg = "String", fg = c.green }, -- a string constant: "this is a string"
    { hg = "Character", fg = c.green }, -- a character constant: 'c', '\n'
    { hg = "Number", fg = c.magenta }, -- a number constant: 234, 0xff
    { hg = "Boolean", fg = c.yellow, cfg.boolean_style }, -- a boolean constant: TRUE, false
    { hg = "Float", fg = c.magenta }, -- a floating point constant: 2.3e10
    { hg = "Identifier", fg = c.fg, cfg.variable_style }, -- any variable name
    { hg = "Function", fg = c.white, gui = cfg.function_style }, -- function name (also: methods for classes)
    { hg = "Statement", fg = c.white }, -- any statement
    { hg = "Conditional", fg = c.blue }, -- if, then, else, endif, switch, etc.
    { hg = "Repeat", fg = c.blue }, -- for, do, while, etc.
    { hg = "Label", fg = c.blue }, -- case, default, etc.
    { hg = "Operator", fg = c.yellow }, -- sizeof", "+", "*", etc.
    { hg = "Keyword", fg = c.blue, gui = cfg.keyword_style }, -- any other keyword
    { hg = "Exception", fg = c.purple }, -- try, catch, throw
    { hg = "PreProc", fg = c.cyan }, -- generic Preprocessor
    { hg = "Include", fg = c.blue }, -- preprocessor #include
    { hg = "Define", fg = c.cyan }, -- preprocessor #define
    { hg = "Macro", fg = c.cyan }, -- same as Define
    { hg = "PreCondit", fg = c.cyan }, -- preprocessor #if, #else, #endif, etc.
    { hg = "Type", fg = c.bright_blue }, -- int, long, char, etc.
    { hg = "StorageClass", fg = c.yellow }, -- static, register, volatile, etc.
    { hg = "Structure", fg = c.yellow }, -- struct, union, enum, etc.
    { hg = "Typedef", fg = c.yellow }, -- A typedef
    { hg = "Special", fg = c.blue }, -- any special symbol
    { hg = "SpecialChar", fg = c.yellow }, -- special character in a constant
    { hg = "Tag", fg = c.yellow }, -- you can use CTRL-] on this
    { hg = "Delimiter" }, -- character that needs attention
    { hg = "SpecialComment", fg = c.gray05 }, -- special things inside a comment
    { hg = "Debug" }, -- debugging statements
    { hg = "Underlined", gui = "underline" }, -- text that stands out, HTML links
    { hg = "Ignore" }, -- left blank, hidden
    { hg = "Error", fg = c.red }, -- any erroneous construct
    { hg = "Todo", fg = c.yellow }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- Highlighting Groups (descriptions and ordering from ` =h highlight-groups`) {{{
    { hg = "ColorColumn", bg = c.gray01 }, -- used for the columns set with 'colorcolumn'
    { hg = "Conceal" }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    { hg = "Cursor", fg = c.black, bg = c.blue }, -- the character under the cursor
    { hg = "CursorIM" }, -- like Cursor, but used when in IME mode
    { hg = "CursorLine", bg = c.gray01 }, -- the screen line that the cursor is in when 'cursorline' is set
    { hg = "Directory", fg = c.blue }, -- directory names (and other special names in listings)
    { hg = "DiffAdd", bg = c.green, fg = c.black }, -- diff mode: Added line
    { hg = "DiffChange", fg = c.yellow, gui = "underline", cterm = "underline" }, -- diff mode: Changed line
    { hg = "DiffDelete", bg = c.red, fg = c.black }, -- diff mode: Deleted line
    { hg = "DiffText", bg = c.yellow, fg = c.black }, -- diff mode: Changed text within a changed line
    { hg = "ErrorMsg", fg = c.red }, -- error messages on the command line
    { hg = "VertSplit", fg = c.gray02 }, -- the column separating vertically split windows
    { hg = "Folded", fg = c.gray04 }, -- line used for closed folds
    { hg = "FoldColumn" }, --' foldcolumn'
    { hg = "SignColumn" }, -- column where signs are displayed
    { hg = "IncSearch", fg = c.bright_yellow, bg = c.gray03 }, --' incsearch' highlighting; also used for the text replaced with ":s///c"
    { hg = "LineNr", fg = c.gray04 }, -- Line number for " =number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    { hg = "CursorLineNr" }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    { hg = "MatchParen", fg = c.yellow, gui = "underline", cterm = "underline" }, -- The character under the cursor or just before it, if it is a paired bracket, and its match.
    { hg = "ModeMsg" }, --' showmode' message (e.g., "-- INSERT --")
    { hg = "MoreMsg" }, -- more-prompt
    { hg = "NonText", fg = c.gray02 }, --'~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
    { hg = "Normal", fg = c.fg, bg = cfg.transparent and c.none or c.bg }, -- normal text
    { hg = "Pmenu", fg = c.white, bg = c.black }, -- Popup menu: normal item.
    { hg = "PmenuSel", fg = c.bright_white, bg = c.gray03 }, -- Popup menu: selected item.
    { hg = "PmenuSbar", bg = c.gray02 }, -- Popup menu: scrollbar.
    { hg = "PmenuThumb", bg = c.gray03 }, -- Popup menu: Thumb of the scrollbar.
    { hg = "Question", fg = c.blue }, -- hit-enter prompt and yes/no questions
    { hg = "QuickFixLine", fg = c.cyan, bg = c.gray02 }, -- Current quickfix item in the quickfix window.
    { hg = "Search", fg = c.yellow, bg = c.black }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    { hg = "SpecialKey", fg = c.special_grey }, -- Meta and special keys listed with " =map", also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.
    { hg = "SpellBad", fg = c.red, gui = "underline" }, -- Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
    { hg = "SpellCap", fg = c.yellow }, -- Word that should start with a capital. This will be combined with the highlighting used otherwise.
    { hg = "SpellLocal", fg = c.yellow }, -- Word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise.
    { hg = "SpellRare", fg = c.yellow }, -- Word that is recognized by the spellchecker as one that is hardly ever used. spell This will be combined with the highlighting used otherwise.
    { hg = "StatusLine", fg = c.white, bg = c.gray01 }, -- status line of current window
    { hg = "StatusLineNC", fg = c.bg_dark }, -- status lines of not-current windows Note = if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    { hg = "StatusLineTerm", fg = c.white, bg = c.gray01 }, -- status line of current :terminal window
    { hg = "StatusLineTermNC", fg = c.gray05 }, -- status line of non-current  =terminal window
    { hg = "TabLine", fg = c.gray05 }, -- tab pages line, not active tab page label
    { hg = "TabLineFill" }, -- tab pages line, where there are no labels
    { hg = "TabLineSel", fg = c.white }, -- tab pages line, active tab page label
    { hg = "Terminal", fg = c.fg, bg = c.black }, -- terminal window (see terminal-size-color)
    { hg = "Title", fg = c.green }, -- titles for output from " =set all", ":autocmd" etc.
    { hg = "Visual", bg = c.gray02 }, -- Visual mode selection
    { hg = "VisualNOS", bg = c.gray02 }, -- Visual mode selection when vim is "Not Owning the Selection". Only X11 Gui's gui-x11 and xterm-clipboard supports this.
    { hg = "WarningMsg", fg = c.yellow }, -- warning messages
    { hg = "WildMenu", fg = c.black, bg = c.blue }, -- current match in 'wildmenu' completion
    { hg = "Winbar", fg = c.white, bg = c.gray01 }, -- Winbar
    { hg = "WinbarNC", fg = c.gray05, bg = c.bg_dark }, -- Winbar non-current windows.

    -- HTML
    { hg = "htmlArg", fg = c.bright_blue, gui = "italic" }, -- attributes
    { hg = "htmlEndTag", fg = c.gray06 }, -- end tag />
    { hg = "htmlTitle", fg = c.gray07 }, -- title tag text
    { hg = "htmlTag", fg = c.gray06 }, -- tag delimiters
    { hg = "htmlTagN", fg = c.gray06 },
    { hg = "htmlTagName", fg = c.cyan }, -- tag text

    -- Markdown
    { hg = "markdownH1", fg = c.bright_blue, gui = "bold" },
    { hg = "markdownH2", fg = c.bright_blue, gui = "bold" },
    { hg = "markdownH3", fg = c.bright_blue, gui = "bold" },
    { hg = "markdownH4", fg = c.bright_blue, gui = "bold" },
    { hg = "markdownH5", fg = c.bright_blue, gui = "bold" },
    { hg = "markdownH6", fg = c.bright_blue, gui = "bold" },
    { hg = "markdownHeadingDelimiter", fg = c.gray05 },
    { hg = "markdownHeadingRule", fg = c.gray05 },
    { hg = "markdownId", fg = c.cyan },
    { hg = "markdownIdDeclaration", fg = c.blue },
    { hg = "markdownIdDelimiter", fg = c.cyan },
    { hg = "markdownLinkDelimiter", fg = c.gray05 },
    { hg = "markdownLinkText", fg = c.blue, gui = "italic" },
    { hg = "markdownListMarker", fg = c.gray05 },
    { hg = "markdownOrderedListMarker", fg = c.gray05 },
    { hg = "markdownRule", fg = c.gray05 },
    { hg = "markdownUrl", fg = c.green, bg = c.none },
    { hg = "markdownBlockquote", fg = c.gray07 },
    { hg = "markdownBold", fg = c.fg, bg = c.none, gui = "bold" },
    { hg = "markdownItalic", fg = c.fg, bg = c.none, gui = "italic" },
    { hg = "markdownCode", fg = c.yellow },
    { hg = "markdownCodeBlock", fg = c.yellow },
    { hg = "markdownCodeDelimiter", fg = c.gray05 },

    -- Tree sitter
    { hg = "@boolean", fg = c.yellow, gui = cfg.boolean_style },
    { hg = "@constructor", fg = c.gray06 },
    { hg = "@constant.builtin", fg = c.yellow },
    { hg = "@keyword.function", fg = c.cyan, gui = cfg.function_style },
    { hg = "@namespace", fg = c.cyan, gui = "italic" },
    { hg = "@parameter", fg = c.magenta },
    { hg = "@property", fg = c.gray07 },
    { hg = "@punctuation", fg = c.gray06 },
    { hg = "@punctuation.delimiter", fg = c.gray06 },
    { hg = "@punctuation.bracket", fg = c.gray06 },
    { hg = "@string.documentation", fg = c.green, gui = cfg.comment_style },
    { hg = "@string.regex", fg = c.blue },
    { hg = "@string.escape", fg = c.magenta },
    { hg = "@symbol", fg = c.yellow },
    { hg = "@tag", fg = c.cyan },
    { hg = "@tag.attribute", fg = c.bright_blue, gui = "italic" },
    { hg = "@tag.delimiter", fg = c.gray06 },
    { hg = "@type.builtin", fg = c.magenta },
    { hg = "@variable", fg = c.fg, gui = cfg.variable_style },
    { hg = "@variable.builtin", fg = c.blue, gui = cfg.variable_style },
    { hg = "@variable.parameter", fg = c.magenta, gui = cfg.variable_style },
    -- Tree sitter language specific overrides
    { hg = "@constructor.javascript", fg = c.cyan },
    { hg = "@keyword.clojure", fg = c.bright_cyan, gui = cfg.keyword_style },

    -- LSP Semantic Token Groups
    { hg = "@lsp.type.boolean", link = "@boolean" },
    { hg = "@lsp.type.builtinType", link = "@type.builtin" },
    { hg = "@lsp.type.comment", link = "@comment" },
    { hg = "@lsp.type.enum", link = "@type" },
    { hg = "@lsp.type.enumMember", link = "@constant" },
    { hg = "@lsp.type.escapeSequence", link = "@string.escape" },
    { hg = "@lsp.type.formatSpecifier", link = "@punctuation.special" },
    { hg = "@lsp.type.interface", fg = c.blue },
    { hg = "@lsp.type.keyword", link = "@keyword" },
    { hg = "@lsp.type.namespace", link = "@namespace" },
    { hg = "@lsp.type.number", link = "@number" },
    { hg = "@lsp.type.operator", link = "@operator" },
    { hg = "@lsp.type.parameter", link = "@parameter" },
    { hg = "@lsp.type.property", link = "@property" },
    { hg = "@lsp.type.selfKeyword", link = "@variable.builtin" },
    { hg = "@lsp.type.string.rust", link = "@string" },
    { hg = "@lsp.type.typeAlias", link = "@type.definition" },
    { hg = "@lsp.type.unresolvedReference", undercurl = true, sp = c.error },
    { hg = "@lsp.type.variable", link = {} }, -- use treesitter styles for regular variables
    { hg = "@lsp.typemod.class.defaultLibrary", link = "@type.builtin" },
    { hg = "@lsp.typemod.enum.defaultLibrary", link = "@type.builtin" },
    { hg = "@lsp.typemod.enumMember.defaultLibrary", link = "@constant.builtin" },
    { hg = "@lsp.typemod.function.defaultLibrary", link = "@function.builtin" },
    { hg = "@lsp.typemod.keyword.async", link = "@keyword.coroutine" },
    { hg = "@lsp.typemod.macro.defaultLibrary", link = "@function.builtin" },
    { hg = "@lsp.typemod.method.defaultLibrary", link = "@function.builtin" },
    { hg = "@lsp.typemod.operator.injected", link = "@operator" },
    { hg = "@lsp.typemod.string.injected", link = "@string" },
    { hg = "@lsp.typemod.type.defaultLibrary", fg = c.blue },
    { hg = "@lsp.typemod.variable.defaultLibrary", link = "@variable.builtin" },
    { hg = "@lsp.typemod.variable.injected", link = "@variable" },

    -- Diagnostics
    { hg = "DiagnosticError", fg = c.red },
    { hg = "DiagnosticWarn", fg = c.yellow },
    { hg = "DiagnosticInfo", fg = c.blue },
    { hg = "DiagnosticHint", fg = c.cyan },
    { hg = "DiagnosticUnderlineError", fg = c.red, gui = "underline" },
    { hg = "DiagnosticUnderlineWarn", fg = c.yellow, gui = "underline" },
    { hg = "DiagnosticUnderlineInfo", fg = c.blue, gui = "underline" },
    { hg = "DiagnosticUnderlineHint", fg = c.cyan, gui = "underline" },

    -- Neovim's built-in language server client
    { hg = "LspReferenceWrite", fg = c.blue, gui = "underline" },
    { hg = "LspReferenceText", fg = c.blue, gui = "underline" },
    { hg = "LspReferenceRead", fg = c.blue, gui = "underline" },
    { hg = "LspSignatureActiveParameter", fg = c.yellow, gui = "bold" },

    -- GitSigns
    { hg = "GitSignsAdd", fg = c.green },
    { hg = "GitSignsChange", fg = c.yellow },
    { hg = "GitSignsDelete", fg = c.red },

    -- Diff
    { hg = "diffAdded", fg = c.bright_green },
    { hg = "diffRemoved", fg = c.bright_red },
    { hg = "diffChanged", fg = c.bright_yellow },
    { hg = "diffOldFile", fg = c.gray04 },
    { hg = "diffNewFile", fg = c.white },
    { hg = "diffFile", fg = c.gray05 },
    { hg = "diffLine", fg = c.cyan },
    { hg = "diffIndexLine", fg = c.magenta },

    -- Hop
    { hg = "HopNextKey", fg = c.bright_yellow },
    { hg = "HopNextKey1", fg = c.bright_blue },
    { hg = "HopNextKey2", fg = c.bright_cyan },
    { hg = "HopUnmatched", fg = c.gray04 },
    { hg = "HopCursor", fg = c.bright_cyan },
    { hg = "HopPreview", fg = c.bright_blue },

    -- Cmp
    { hg = "CmpItemAbbrDeprecated", fg = c.gray06, gui = "strikethrough" },
    { hg = "CmpItemAbbrMatch", fg = c.blue, gui = "bold" },
    { hg = "CmpItemAbbrMatchFuzzy", fg = c.blue, gui = "bold" },
    { hg = "CmpItemMenu", fg = c.gray05 },
    { hg = "CmpItemKindText", fg = c.gray06 },
    { hg = "CmpItemKindFunction", fg = c.cyan },
    { hg = "CmpItemKindVariable", fg = c.bright_white },
    { hg = "CmpItemKindEnum", fg = c.green },
    { hg = "CmpItemKindSnippet", fg = c.yellow },

    -- Navic
    { hg = "NavicIconsFile", fg = c.fg, bg = c.none },
    { hg = "NavicIconsModule", fg = c.yellow, bg = c.none },
    { hg = "NavicIconsNamespace", fg = c.fg, bg = c.none },
    { hg = "NavicIconsPackage", fg = c.fg, bg = c.none },
    { hg = "NavicIconsClass", fg = c.cyan, bg = c.none },
    { hg = "NavicIconsMethod", fg = c.blue, bg = c.none },
    { hg = "NavicIconsProperty", fg = c.green, bg = c.none },
    { hg = "NavicIconsField", fg = c.green, bg = c.none },
    { hg = "NavicIconsConstructor", fg = c.cyan, bg = c.none },
    { hg = "NavicIconsEnum", fg = c.cyan, bg = c.none },
    { hg = "NavicIconsInterface", fg = c.cyan, bg = c.none },
    { hg = "NavicIconsFunction", fg = c.blue, bg = c.none },
    { hg = "NavicIconsVariable", fg = c.magenta, bg = c.none },
    { hg = "NavicIconsConstant", fg = c.magenta, bg = c.none },
    { hg = "NavicIconsString", fg = c.green, bg = c.none },
    { hg = "NavicIconsNumber", fg = c.cyan, bg = c.none },
    { hg = "NavicIconsBoolean", fg = c.yellow, bg = c.none },
    { hg = "NavicIconsArray", fg = c.gray06, bg = c.none },
    { hg = "NavicIconsObject", fg = c.gray06, bg = c.none },
    { hg = "NavicIconsKey", fg = c.blue, bg = c.none },
    { hg = "NavicIconsKeyword", fg = c.blue, bg = c.none },
    { hg = "NavicIconsNull", fg = c.cyan, bg = c.none },
    { hg = "NavicIconsEnumMember", fg = c.green, bg = c.none },
    { hg = "NavicIconsStruct", fg = c.cyan, bg = c.none },
    { hg = "NavicIconsEvent", fg = c.cyan, bg = c.none },
    { hg = "NavicIconsOperator", fg = c.fg, bg = c.none },
    { hg = "NavicIconsTypeParameter", fg = c.green, bg = c.none },
    { hg = "NavicText", fg = c.white, bg = c.none },
    { hg = "NavicSeparator", fg = c.gray06, bg = c.none },

    -- Notify
    { hg = "NotifyBackground", fg = c.white, bg = c.bg },
    { hg = "NotifyERRORBorder", fg = c.red, bg = cfg.transparent and c.none or c.bg },
    { hg = "NotifyWARNBorder", fg = c.yellow, bg = cfg.transparent and c.none or c.bg },
    { hg = "NotifyINFOBorder", fg = c.blue, bg = cfg.transparent and c.none or c.bg },
    { hg = "NotifyDEBUGBorder", fg = c.gray06, bg = cfg.transparent and c.none or c.bg },
    { hg = "NotifyTRACEBorder", fg = c.cyan, bg = cfg.transparent and c.none or c.bg },
    { hg = "NotifyERRORIcon", fg = c.bright_red },
    { hg = "NotifyWARNIcon", fg = c.bright_yellow },
    { hg = "NotifyINFOIcon", fg = c.bright_blue },
    { hg = "NotifyDEBUGIcon", fg = c.gray05 },
    { hg = "NotifyTRACEIcon", fg = c.bright_cyan },
    { hg = "NotifyERRORTitle", fg = c.bright_red },
    { hg = "NotifyWARNTitle", fg = c.bright_yellow },
    { hg = "NotifyINFOTitle", fg = c.bright_blue },
    { hg = "NotifyDEBUGTitle", fg = c.gray05 },
    { hg = "NotifyTRACETitle", fg = c.bright_cyan },
    { hg = "NotifyERRORBody", fg = c.white, bg = cfg.transparent and c.none or c.bg },
    { hg = "NotifyWARNBody", fg = c.white, bg = cfg.transparent and c.none or c.bg },
    { hg = "NotifyINFOBody", fg = c.white, bg = cfg.transparent and c.none or c.bg },
    { hg = "NotifyDEBUGBody", fg = c.white, bg = cfg.transparent and c.none or c.bg },
    { hg = "NotifyTRACEBody", fg = c.white, bg = cfg.transparent and c.none or c.bg },
    vim.print("Mellow.nvim has moved to mellow-theme/mellow.nvim")
  }

  utils.highlight(highlights)
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
