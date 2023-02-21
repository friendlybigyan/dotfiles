-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- Set up cmp.
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

-- vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)
-- vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	-- vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	-- vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
	-- vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	-- vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	-- vim.keymap.set("n", "<leader>wl", function()
	-- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	-- end, bufopts)
	--
	vim.keymap.set("n", "gd", "<CMD>Telescope lsp_definitions<CR>", bufopts)
	vim.keymap.set("n", "gi", "<CMD>Telescope lsp_implementations<CR>", bufopts)
	vim.keymap.set("n", "gr", "<CMD>Telescope lsp_references<CR>", bufopts)
	vim.keymap.set("n", "gD", "<CMD>Telescope lsp_type_definitions<CR>", bufopts)
	vim.keymap.set("n", "<leader>sy", "<CMD>Telescope lsp_document_symbols<CR>", bufopts)

	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "<C-k>", "<CMD>lua vim.diagnostic.open_float({border='rounded'})<CR>", bufopts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<leader>ca", "<CMD>CodeActionMenu<CR>", bufopts)
	vim.keymap.set("n", "<leader>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)
end

require("lspconfig").lua_ls.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
require("lspconfig").cssls.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
require("lspconfig").eslint.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
