local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- NVIM MODIFICATIONS
-- Move current line / block with Alt-j/k ala vscode.
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
vim.keymap.set("c", "W", ":w !sudo tee % > /dev/null<CR>")
-- Move current line / block with Alt-j/k ala vscode.

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
-- vim.keymap.set("n", "<C-k>", "<C-w>k")
-- vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-- Move current line / block with Alt-j/k a la vscode.
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("n", "<A-Up>", "<C-\\><C-N><C-w>k")
vim.keymap.set("x", "<A-j>", ":m '>+1<CR>gv-gv")
vim.keymap.set("x", "<A-k>", ":m '<-2<CR>gv-gv")

-- Tabs dont unselect the selection
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Clear selections
vim.keymap.set("n", "<leader>l", ":noh<CR>")
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

--Mason
vim.keymap.set("n", "<leader>m", "<CMD>Mason<CR>")

--Sayonara
vim.keymap.set("n", "<leader>cc", "<CMD>w | Sayonara<CR>")

-- Comments
-- In /setups/comments.nvim

-- HighlightColor
-- Use :HighlightColorToggle/HighlightColorOn/HighlightColorOff on the cmd itself

-- Bufferline
-- vim.keymap.set("n", "<S-l>", "<CMD>BufferLineCycleNext<CR>")
-- vim.keymap.set("n", "<S-h>", "<CMD>BufferLineCyclePrev<CR>")
-- vim.keymap.set("n", "<C-l>", "<CMD>BufferLineMoveNext<CR>")
-- vim.keymap.set("n", "<C-h>", "<CMD>BufferLineMovePrev<CR>")

-- Cokeline
vim.keymap.set("n", "<S-h>", "<Plug>(cokeline-focus-prev)<CR>")
vim.keymap.set("n", "<S-l>", "<Plug>(cokeline-focus-next)<CR>")
-- vim.keymap.set("n", "<S-h>", "<Plug>(cokeline-switch-prev)<CR>")
-- vim.keymap.set("n", "<C-l>", "<Plug>(cokeline-switch-next)<CR>")

for i = 1, 9 do
  vim.keymap.set("n", ("<A-%s>"):format(i), ("<Plug>(cokeline-focus-%s)"):format(i), { silent = true })
  vim.keymap.set("n", ("<Leader>%s"):format(i), ("<Plug>(cokeline-switch-%s)"):format(i), { silent = true })
end
-- BetterEscape
-- In /setups/betterescape.lua

-- Surround.nvim
-- Using the defaults

--Telescope
vim.keymap.set("n", "<leader>fr", "<CMD>Telescope oldfiles<CR>")
vim.keymap.set("n", "<leader>lg", "<CMD>Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>ss", "<CMD>Telescope spell_suggest<CR>")
vim.keymap.set("n", "<leader>ff", "<CMD>Telescope fd<CR>")
-- Telescope shortcuts are in setups/Telescope

-- Dressing.nvim
-- in /-- In /setups/dressing.lua

-- Colorpicker
vim.keymap.set("n", "<leader>co", "<cmd>PickColor<cr>", opts)

-- Iconpicker
vim.keymap.set("n", "<leader>i", "<cmd>IconPickerNormal nerd_font<cr>", opts)

-- LSP KEYMAPS
vim.keymap.set("n", "<C-<>", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "<C->>", vim.diagnostic.goto_next, opts)
-- More on /setup/nvimlsp

-- Goto Preview
vim.keymap.set("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { noremap = true })
vim.keymap.set("n", "gP", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", { noremap = true })

-- Symbols Outlines
vim.keymap.set("n", "<leader><leader>", "<cmd>SymbolsOutline<cr>", opts)

-- Nvim Tree
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)
