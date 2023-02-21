local M = {}

M.icons = {
	Class = " ",
	Color = " ",
	Constant = " ",
	Constructor = " ",
	Enum = "了 ",
	EnumMember = " ",
	Field = " ",
	File = " ",
	Folder = " ",
	Function = " ",
	Interface = "ﰮ ",
	Keyword = " ",
	Method = "ƒ ",
	Module = " ",
	Property = " ",
	Snippet = "﬌ ",
	Struct = " ",
	Text = " ",
	Unit = " ",
	Value = " ",
	Variable = " ",
}

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
	virtual_text = {
		prefix = " ", -- Could be '●', '▎', 'x'
	},
	signs = true,
	underline = false,
	update_in_insert = true,
	severity_sort = true,
})
--
-- vim.api.nvim_create_autocmd("CursorHold", {
-- 	buffer = bufnr,
-- 	callback = function()
-- 		local opts = {
-- 			focusable = false,
-- 			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
-- 			border = "rounded",
-- 			source = "always",
-- 			prefix = " ",
-- 			scope = "line",
-- 		}
-- 		vim.diagnostic.open_float(nil, opts)
-- 	end,
-- })

vim.cmd([[
highlight! DiagnosticLineNrError guibg=#B7435E guifg=#cc9b9d gui=bold
highlight! DiagnosticLineNrWarn guibg=#D88B72 guifg=#E8CCA7 gui=bold
highlight! DiagnosticLineNrInfo guibg=#6E7EBF guifg=#B8C9EA gui=bold
highlight! DiagnosticLineNrHint guibg=#414560 guifg=#63718B gui=bold

sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint

hi DiagnosticError  guifg=#cc9b9d gui=bold
hi DiagnosticWarn  guifg=#E8CCA7 gui=bold
hi DiagnosticInfo  guifg=#B8C9EA gui=bold
hi DiagnosticHint  guifg=#63718B gui=bold

hi NormalFloat guibg=NONE
hi Title guibg=NONE guifg=#cc9b9d
hi FloatBorder guibg=NONE
hi BufferTabpageFill guibg=NONE
hi TabLineFill guibg=NONE
hi TabLine guibg=NONE
hi TelescopeNormal guibg=NONE guifg=NONE
hi TelescopeBorder guibg=NONE guifg=NONE
]])
-- vim.highlight.create("WhichKeyFloat", { guibg = "None" }, false)
-- vim.highlight.create("VertSplit", { guibg = "#16161e", guifg = "#16161e" }, false)

function M.setup()
	local kinds = vim.lsp.protocol.CompletionItemKind
	for i, kind in ipairs(kinds) do
		kinds[i] = M.icons[kind] or kind
	end
end

return M
