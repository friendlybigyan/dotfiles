vim.g.code_action_menu_show_details = true
vim.g.code_action_menu_show_diff = true
vim.g.code_action_menu_show_action_kind = true
vim.g.code_action_menu_window_border = 'rounded'
require('packer').use({
  'weilbith/nvim-code-action-menu',
  cmd = 'CodeActionMenu',
})
