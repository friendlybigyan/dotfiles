vim.opt.termguicolors = true
vim.cmd [[
let g:indent_blankline_char = '▏'
highlight IndentBlanklineSpaceCharBlankline guifg=#3b4252 gui=nocombine
highlight IndentBlanklineSpaceChar guifg=#3b4252 gui=nocombine
highlight IndentBlanklineChar guifg=#3b4252 gui=nocombine
highlight IndentBlanklineContextStart guibg=#3b4252 gui=nocombine
highlight IndentBlanklineContextChar guifg=#d8dee9 gui=nocombine
highlight IndentBlanklineContextSpaceChar gui=nocombine 
]]

vim.opt.list = true
vim.opt.listchars:append "space:•"
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
}
