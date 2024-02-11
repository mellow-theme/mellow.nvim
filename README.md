# Mellow

A soothing dark color scheme for neovim.

## Preview

### Terminal (kitty)

![Screenshot of mellow theme terminal](https://user-images.githubusercontent.com/1040966/196249241-173a1636-b74f-4767-b27f-2b3ed02cea26.png)

### JavaScript (JSX)

![Screenshot of mellow theme JS/JSX]("https://user-images.githubusercontent.com/1040966/196249265-d122fee2-b14f-4c80-9678-f949487755d4.png)

### HTML

![Screenshot of mellow theme HTML](https://user-images.githubusercontent.com/1040966/196249274-5846ea9e-cf02-4ec8-9bae-53b900539ee8.png)

### Clojure

![Screenshot of mellow theme Clojure](https://user-images.githubusercontent.com/1040966/196249280-c68a6c20-18b8-4747-9a66-dac28e864457.png)

### Rust

![Screenshot of mellow theme Rust](https://user-images.githubusercontent.com/1040966/196249282-20f2097a-1467-4365-9c99-4f7957e98aec.png)

## Palette

![Background and foreground](https://user-images.githubusercontent.com/1040966/197761645-8864f33c-a287-4bec-b8fa-2f6c3033f380.png)
![Grays](https://user-images.githubusercontent.com/1040966/197760220-e8c71e34-e421-474b-819d-4acd12e126de.png)
![Normal colors](https://user-images.githubusercontent.com/1040966/197760225-9a3e3ff0-7ee0-426f-9646-c4b5e3dc0acc.png)
![Bright colors](https://user-images.githubusercontent.com/1040966/197760222-f2f43028-b3b8-4480-be79-5ec95a330db7.png)

## Features

- Supports neovim versions `0.8` and above.
- Terminal colors inside neovim.
- Color themes for various applications and terminal emulators: [extras](#extras).

### Plugin Support

- [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [LSP Diagnostics](https://neovim.io/doc/user/lsp.html)
- [Lualine](https://github.com/nvim-lualine/lualine.nvim)
- [Git Signs](https://github.com/lewis6991/gitsigns.nvim)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [WhichKey](https://github.com/liuchengxu/vim-which-key)
- [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [hop.nvim](https://github.com/phaazon/hop.nvim)
- [nvim-navic](https://github.com/SmiteshP/nvim-navic)
- [nvim-notify](https://github.com/rcarriga/nvim-notify)

## Requirements

- Neovim >= `0.8.0`

## Installation

Install the theme with your preferred package manager:

[vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'mellow-theme/mellow.nvim'
```

[packer](https://github.com/wbthomason/packer.nvim)

```lua
use("mellow-theme/mellow.nvim")
```

## Usage

```lua
-- Lua
vim.cmd([[colorscheme mellow]])
```

```vim
" Vim Script
colorscheme mellow
```

## Configuration

> Configuration needs to be set **BEFORE** loading the color scheme with `colorscheme mellow`

| Option                    | Default | Description              |
| ------------------------- | ------- | ------------------------ |
| `mellow_italic_comments`  | `true`  | Make comments italic     |
| `mellow_italic_keywords`  | `false` | Make keywords italic     |
| `mellow_italic_booleans`  | `false` | Make booleans italic     |
| `mellow_italic_functions` | `false` | Make functions italic    |
| `mellow_italic_variables` | `false` | Make variables italic    |
| `mellow_bold_comments`    | `false` | Make comments bold       |
| `mellow_bold_keywords`    | `false` | Make keywords bold       |
| `mellow_bold_booleans`    | `false` | Make booleans bold       |
| `mellow_bold_functions`   | `false` | Make functions bold      |
| `mellow_bold_variables`   | `false` | Make variables bold      |
| `mellow_transparent`      | `false` | Disable background color |

```lua
-- Example config in lua

-- Configure the appearance
vim.g.mellow_italic_functions = true
vim.g.mellow_bold_functions = true

-- Load the colorscheme
vim.cmd([[colorscheme mellow]])
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

Color themes for various applications and terminal emulators.

### Terminals

- alacritty - `extras/alacritty/mellow.toml`
- kitty - `extras/kitty/mellow.conf`
- wezterm - `extras/wezterm/colors/mellow.toml`
- iterm2 - `extras/iterm2/mellow.itermcolors`
- terminator - `extras/terminator/mellow.config`
- foot - `extras/foot/mellow.ini`

### Helix

- Included in [helix](https://helix-editor.com/) since `22.12`.

### Visual Studio Code

- Grab it from the [marketplace](https://marketplace.visualstudio.com/items?itemName=kvrohit.mellow-theme).
- (or) Search within VSCode extension page for "Mellow".

### Eclipse

- `extras/eclipse/mellow.xml`

### Delta

- Included in [delta](https://github.com/dandavison/delta) since `23.06`.
  - Download the config [here](https://github.com/dandavison/delta/blob/master/themes.gitconfig).
  - See [https://dandavison.github.io/delta/custom-themes.html](https://dandavison.github.io/delta/custom-themes.html) for setup instructions.

## Credits

- [Pascal](https://pabue.co/) for making a fantastic tool to work with colors: [hue.tools](https://hue.tools/?format=hex)
