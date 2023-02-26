local get_hex = require("cokeline/utils").get_hex
local mappings = require("cokeline/mappings")

local comments_fg = get_hex("Comment", "fg")
local errors_fg = "#B7435E"
local warnings_fg = "#d1ba97"

local bg = "#2e3440"
local red = "#cc9b9d"
local yellow = "#E8CCA7"
-- local green = "#a3ccad"

require("cokeline").setup({
	default_hl = {
		fg = function(buffer)
			return buffer.is_focused and get_hex("Normal", "fg") or get_hex("Comment", "fg")
		end,
		bg = function(buffer)
			if buffer.is_focused then
				return get_hex("ColorColumn", "bg")
			else
				return get_hex("Normal", "bg")
			end
		end,
	},
	components = {
		{
			text = " ",
			bg = get_hex("Normal", "bg"),
		},
		{
			text = "",
			-- fg = get_hex("ColorColumn", "bg"),
			fg = function(buffer)
				if buffer.is_focused then
					return get_hex("ColorColumn", "bg")
				else
					return bg
				end
			end,
			bg = get_hex("Normal", "bg"),
		},
		{
			text = function(buffer)
				return (mappings.is_picking_focus() or mappings.is_picking_close()) and buffer.pick_letter .. " "
					or buffer.devicon.icon
			end,
			fg = function(buffer)
				return (mappings.is_picking_focus() and yellow)
					or (mappings.is_picking_close() and red)
					or buffer.devicon.color
			end,
			style = function(_)
				return (mappings.is_picking_focus() or mappings.is_picking_close()) and "italic,bold" or nil
			end,
			truncation = { priority = 1 },
			-- bg = "#ebb9b9",
		},
		{
			text = " ",
			-- bg = "#ebb9b9",
		},
		{
			text = function(buffer)
				return buffer.filename .. "  "
			end,
			style = function(buffer)
				return ((buffer.is_focused and buffer.diagnostics.errors ~= 0) and "bold,underline")
					or (buffer.is_focused and "bold")
					or (buffer.diagnostics.errors ~= 0 and "underline")
					or nil
			end,

			bg = function(buffer)
				if buffer.is_focused then
					return get_hex("ColorColumn", "bg")
				else
					return get_hex("Normal", "bg")
				end
			end,
			-- fg = "#313449",
			-- bg = "#ebb9b9",
		},
		{
			text = function(buffer)
				return (buffer.diagnostics.errors ~= 0 and "  " .. buffer.diagnostics.errors)
					or (buffer.diagnostics.warnings ~= 0 and "  " .. buffer.diagnostics.warnings)
					or ""
			end,
			fg = function(buffer)
				return (buffer.diagnostics.errors ~= 0 and errors_fg)
					or (buffer.diagnostics.warnings ~= 0 and warnings_fg)
					or nil
			end,
			truncation = { priority = 1 },
		},
		{
			text = function(buffer)
				return buffer.is_modified and "   " or "  "
			end,
			fg = function(buffer)
				return buffer.is_modified and yellow or nil
			end,
			delete_buffer_on_left_click = true,
			truncation = { priority = 1 },
		},
		{
			text = "",
			fg = function(buffer)
				if buffer.is_focused then
					return get_hex("ColorColumn", "bg")
				else
					return bg
				end
			end,
			bg = get_hex("Normal", "bg"),
			-- fg = "#ebb9b9",
		},
	},
})
