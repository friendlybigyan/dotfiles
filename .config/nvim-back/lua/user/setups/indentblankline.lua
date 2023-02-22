vim.cmd([[ let g:indent_blankline_char = '▏' ]])
vim.cmd([[highlight IndentBlanklineIndent1 guifg=#313449 gui=nocombine]])
vim.cmd([[highlight IndentBlankLineContextChar guifg=#63718B gui=nocombine]])
vim.cmd([[highlight IndentBlankLineContextStart guibg=#313449 gui=bold]])

require("indent_blankline").setup({
	show_current_context = true,
	show_current_context_start = true,
	char_highlight_list = {
		"IndentBlanklineIndent1",
	},
})
