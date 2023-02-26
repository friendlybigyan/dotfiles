-- To automatically install packer

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- To design the UI that automatically comes up after saving this file
require("packer").init({
  display = {
    open_fn = function()
      local result, win, buf = require("packer.util").float({
        border = {
          { "╭", "FloatBorder" },
          { "─", "FloatBorder" },
          { "╮", "FloatBorder" },
          { "│", "FloatBorder" },
          { "╯", "FloatBorder" },
          { "─", "FloatBorder" },
          { "╰", "FloatBorder" },
          { "│", "FloatBorder" },
        },
      })
      vim.api.nvim_win_set_option(win, "winhighlight", "NormalFloat:Normal")
      return result, win, buf
    end,
  },
})

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")
  use('shaunsingh/nord.nvim')
  use("mhinz/vim-sayonara")
  use("jiangmiao/auto-pairs")
  use("nvim-treesitter/nvim-treesitter")
  use("JoosepAlviste/nvim-ts-context-commentstring")
  use("mrjones2014/nvim-ts-rainbow")
  use("numToStr/Comment.nvim")
  use("nvim-lualine/lualine.nvim")
  use("brenoprata10/nvim-highlight-colors")
  use("noib3/nvim-cokeline")
  use("max397574/better-escape.nvim")
  use("ur4ltz/surround.nvim")
  use("nvim-lua/plenary.nvim")
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  --use("ziontee113/color-picker.nvim")
  use("ziontee113/icon-picker.nvim")
  use("stevearc/dressing.nvim") --> For icon-picker
  use("ethanholz/nvim-lastplace")
  ---- LSP
  use("neovim/nvim-lspconfig")
  --
  --use("folke/lsp-colors.nvim")
  --use("jose-elias-alvarez/null-ls.nvim")
  ---- Make into an IDE --
  use("weilbith/nvim-code-action-menu")
  use("simrat39/symbols-outline.nvim")
  use('nvim-tree/nvim-tree.lua')
  --use("petertriho/nvim-scrollbar")
  use("nvim-telescope/telescope.nvim")
  --use("folke/which-key.nvim")
  --
  ---- COMPLETIONS
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/nvim-cmp")
  use("lukas-reineke/cmp-under-comparator")
  use("SirVer/ultisnips")
  use("quangnguyen30192/cmp-nvim-ultisnips")
  --use("ray-x/cmp-treesitter")
  use("nvim-tree/nvim-web-devicons")
  --
  ---- UI ELEMENTS
  use("folke/noice.nvim")
  use("MunifTanjim/nui.nvim")
  use("rcarriga/nvim-notify")
  use("karb94/neoscroll.nvim")
  use('glepnir/dashboard-nvim')
  use("lukas-reineke/indent-blankline.nvim")
  -- Automatically set up your configuration after cloning packer.nvim
  if packer_bootstrap then
    require("packer").sync()
  end
end)
