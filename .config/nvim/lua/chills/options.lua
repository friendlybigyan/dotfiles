local cmd = vim.cmd
local opt = vim.opt
local diagnostic = vim.diagnostic
local g = vim.g

opt.hidden = true
opt.ch = 0
opt.pumheight = 9
opt.fileencoding = 'utf-8'
opt.splitbelow = true
opt.list = true
opt.splitright = true
opt.termguicolors = true
opt.conceallevel = 0
opt.showtabline = 3
opt.tabline = ' '
opt.showmode = false
opt.backup = false
opt.number = true
opt.numberwidth = 3
opt.ruler = false
opt.writebackup = false
opt.updatetime = 300
opt.timeoutlen = 500
opt.clipboard = "unnamedplus"
opt.hlsearch = true
opt.ignorecase = true
opt.scrolloff = 0
opt.sidescrolloff = 5
opt.foldenable = false
opt.mouse = "a" -- Mouse support for noobs
opt.cursorline = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 0
opt.autoindent = true
opt.wrap = false
opt.expandtab = true
opt.fillchars:append('eob: ')
opt.listchars:append "space: "
opt.laststatus = 0 -- Global Status
diagnostic.config { signs = false } -- Removing diagnostic column
opt.updatetime = 250
opt.shadafile = "NONE"
opt.shadafile = ""
opt.undofile = true
opt.swapfile = false
opt.shortmess:append "sI"

-- Formatting Code on Save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  callback = function()
    for _, client in ipairs(vim.lsp.get_active_clients()) do
      if client.attached_buffers[vim.api.nvim_get_current_buf()] then
        vim.lsp.buf.format()
        return
      else
        return
      end
    end
  end
})

-- Disabling some built in plugins
local builtins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "matchparen",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "logipat",
  "matchit",
  "tutor",
  "rplugin",
  "syntax",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
  "archlinux",
  "fzf",
  "tutor_mode_plugin",
  "sleuth",
  "vimgrep"
}

for _, plugin in ipairs(builtins) do
  g["loaded_" .. plugin] = 1
end
-- vim.opt.shortmess = "ilmnrx"                        -- flags to shorten vim messages, see :help 'shortmess'
vim.opt.shortmess:append("c") -- don't give |ins-completion-menu| messages
vim.opt.shortmess:append "I" -- don't show the default intro message
vim.opt.iskeyword:append("-") -- hyphenated words recognized by searches
vim.opt.formatoptions:remove({ "c", "r", "o" }) -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
vim.opt.spelllang:append "cjk" -- disable spellchecking for asian characters (VIM algorithm does not support it)
vim.opt.whichwrap:append "<,>,[,],h,l"
-- to remove the ~ in eofs
-- there is an invisible char there
vim.cmd([[
set fillchars+=eob:⠀
]])
