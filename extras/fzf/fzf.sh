# Mellow theme for fzf (and zoxide)
#
# This script sets up the fzf command-line fuzzy finder with a custom mellow
# theme. It configures various options for fzf, including colors, multi
# selection, and preview functionality.
#
# Usage:
#
# 1. Source this script in your shell configuration file (e.g., .bashrc,
#    .zshrc) copy / paste the content into your shell config file.

export FZF_DEFAULT_OPTS="
  --multi
  --border=top
  --color=bg+:#1B1B1D
  --color=bg:-1
  --color=border:#2A2A2D
  --color=gutter:-1
  --color=header:#90B99F
  --color=hl+:#EA83A5
  --color=hl:#EA83A5:bold
  --color=info:#F5A191
  --color=marker:#F0C5A9
  --color=pointer:#ACA1CF
  --color=preview-scrollbar:#57575F
  --color=prompt:#E29ECA
  --color=query:#ACA1CF:bold
  --color=scrollbar:#57575F
  --color=spinner:#F0C5A9:bold
  --highlight-line
  --info=inline-right
  --layout=reverse
  --pointer='█'
  --scrollbar='▌'
  "

# Use the mellow FZF options above for zoxide's interactive mode: zi.
# If you don't use zoxide, you can remove this block.
export _ZO_FZF_OPTS="
  $FZF_DEFAULT_OPTS
  --height=50%
  --preview 'ls --color=always {2..}'
  --preview-window=down,border-top
  --bind 'ctrl-b:preview-up,ctrl-f:preview-down'
  --bind 'ctrl-/:change-preview-window(right|hidden|)'"
