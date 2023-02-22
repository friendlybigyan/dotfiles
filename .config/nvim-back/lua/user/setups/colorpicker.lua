local opts = { noremap = true, silent = true }

-- rgba(29, 27, 22, 0.38)
require("color-picker").setup({ -- for changing icons & mappings
	["icons"] = { "", "" },
	-- ["icons"] = { "ﮊ", "" },
	-- ["icons"] = { "", "ﰕ" },
	-- ["icons"] = { "", "" },
	-- ["icons"] = { "", "" },
	-- ["icons"] = { "ﱢ", "" },
	["border"] = "rounded", -- none | single | double | rounded | solid | shadow
	["keymap"] = { -- mapping example:
		["b"] = "<Plug>ColorPickerSlider10Decrease",
		["w"] = "<Plug>ColorPickerSlider10Increase",
		["o"] = "<Plug>ColorPickerChangeOutputType",
		["O"] = "<Plug>ColorPickerChangeColorMode",
		["A"] = "<Plug>ColorPickerApplyColor",
		["e"] = "<Plug>ColorPickerNumericInput",
	},
	["background_highlight_group"] = "Normal", -- default
	["border_highlight_group"] = "FloatBorder", -- default
  ["text_highlight_group"] = "Normal", --default
})

