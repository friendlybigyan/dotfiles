vim.opt.termguicolors = true
vim.cmd [[
let g:indent_blankline_char = '▏'
highlight IndentBlanklineContextStart guibg=#3b4252
highlight IndentBlanklineContextChar guifg=#d8dee9
" highlight IndentBlanklineIndent1 guifg=#4c566a gui=nocombine
]]

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
  space_char_blankline = " ",
  char_highlight_list = {
    "IndentBlanklineIndent1",
  },

  show_current_context = true,
  show_current_context_start = true,
}
