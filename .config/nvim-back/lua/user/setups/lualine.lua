
-- stylua: ignore
local colors = {
  blue   = '#cddbf9',
  cyan   = '#b8dceb',
  black  = '#20202A',
  white  = '#CCCBD9',
  red    = '#ebb9b9',
  violet = '#c497b3',
  grey   = '#44495E',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.red },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.black, bg = colors.black },
  },

  insert = { a = { fg = colors.black, bg = colors.white } },
  visual = { a = { fg = colors.black, bg = colors.blue } },
  replace = { a = { fg = colors.black, bg = colors.violet } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
  },
}

require('lualine').setup {
  options = {
    theme = bubbles_theme,
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '', right = '' }, right_padding = 2 },
    },
    lualine_b = {},
    lualine_c = { 'fileformat' },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
      { 'progress', separator = {left = '', right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions 
= {},
}

