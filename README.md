# Mellow

A dark mellow colorscheme for neovim.

## Features

- Supports the latest neovim `0.8` features like TreeSitter and LSP.
- Terminal colors inside neovim.

### Plugin Support

- [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [LSP Diagnostics](https://neovim.io/doc/user/lsp.html)
- [Lualine](https://github.com/nvim-lualine/lualine.nvim)
- [Git Signs](https://github.com/lewis6991/gitsigns.nvim)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [WhichKey](https://github.com/liuchengxu/vim-which-key)
- [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

## Requirements

- Neovim >= 0.8.0

## Installation

Install the theme with your preferred package manager:

[vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'kvrohit/mellow.nvim'
```

[packer](https://github.com/wbthomason/packer.nvim)

```lua
use 'kvrohit/mellow.nvim'
```

## Usage

Enable the colorscheme:

```lua
-- Lua
vim.cmd [[colorscheme mellow]]
```

```vim
" Vim Script
colorscheme mellow
```

## Configuration

> Configuration needs to be set **BEFORE** loading the color scheme with `colorscheme mellow`

| Option                  | Default | Description              |
| ----------------------- | ------- | ------------------------ |
| mellow_italic_comments  | `true`  | Make comments italic     |
| mellow_italic_keywords  | `false` | Make keywords italic     |
| mellow_italic_booleans  | `false` | Make booleans italic     |
| mellow_italic_functions | `false` | Make functions italic    |
| mellow_italic_variables | `false` | Make variables italic    |
| mellow_bold_comments    | `false` | Make comments bold       |
| mellow_bold_keywords    | `false` | Make keywords bold       |
| mellow_bold_booleans    | `false` | Make booleans bold       |
| mellow_bold_functions   | `false` | Make functions bold      |
| mellow_bold_variables   | `false` | Make variables bold      |
| mellow_transparent      | `false` | Disable background color |
| mellow_variant          | `dark`  | Colorscheme variant      |

```lua
-- Example config in lua

-- Configure the appearance
vim.g.mellow_italic_functions = true
vim.g.mellow_bold_functions = true

-- Load the colorscheme
vim.cmd [[colorscheme mellow]]
```

```vim
" Example config in vim script

" Configure the appearance
let g:mellow_italic_functions = 1
let g:mellow_bold_functions = 1

" Load the colorscheme
colorscheme mellow
```

## Extras

- alacritty color theme: `extras/alacritty/mellow.yaml`
- kitty color theme: `extras/kitty/mellow.conf`
