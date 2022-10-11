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

## Preview

### Terminal
![Screenshot 2022-03-28 at 2 25 58 PM](https://user-images.githubusercontent.com/1040966/160364806-458a5dad-5f2a-4a78-885b-a041d5ec5010.png)

### Markdown
![Screenshot 2022-03-28 at 2 08 06 PM](https://user-images.githubusercontent.com/1040966/160364881-94c94648-8761-4310-aa7f-a6d6b4c09f09.png)

### Rust
![Screenshot 2022-03-28 at 2 20 33 PM](https://user-images.githubusercontent.com/1040966/160364965-fd1342fb-392d-40e7-ab6c-224eae939f70.png)

### HTML
![Screenshot 2022-03-28 at 2 23 42 PM](https://user-images.githubusercontent.com/1040966/160365047-bbf15000-233a-497a-9755-9ca93e4aaaed.png)

### JavaScript
![Screenshot 2022-03-28 at 2 23 15 PM](https://user-images.githubusercontent.com/1040966/160365120-6fa24c8d-4c95-4fd9-83fc-095445b6f291.png)

### JSX
![Screenshot 2022-03-28 at 2 21 08 PM](https://user-images.githubusercontent.com/1040966/160365247-726c1804-df28-4fe3-bb1d-9f972a2890d8.png)

### Lua
![Screenshot 2022-03-28 at 2 12 40 PM](https://user-images.githubusercontent.com/1040966/160365410-5adabe98-660b-4a12-909e-88c5f5ff080c.png)


## Extras

- alacritty color theme: `extras/alacritty/mellow.yaml`
- kitty color theme: `extras/kitty/mellow.conf`
- iterm color theme: `extras/iterm/mellow.itermcolors`
