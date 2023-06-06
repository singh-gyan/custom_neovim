local ll = require("lualine")

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = false,
}

local diff = {
	"diff",
	colored = true,
	diff_color = {
		-- Same color values as the general color option can be used here.
		added = "#11d821",                                        -- Changes the diff's added color
		modified = "DiffChange",                                  -- Changes the diff's modified color
		removed = "DiffDelete",                                   -- Changes the diff's removed color you
	},
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = hide_in_width,
}

local mode = {
	"mode",
	icons_enabled = true,
}

local filetype = {
	"filetype",
	icons_enabled = false,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 0,
}

ll.setup({
	options = {
		icons_enabled = true,
		theme = "catppuccin",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			-- sets how often lualine should refresh it's contents (in ms)
			statusline = 300, -- The refresh option sets minimum time that lualine tries
			tabline = 300, -- to maintain between refresh. It's not guarantied if situation
			winbar = 300,
		},
	},
	sections = {
		lualine_a = {
			mode,
		},
		lualine_b = { branch, diff, diagnostics },
		lualine_c = {
			{
				require("noice").api.status.mode.get,
				cond = require("noice").api.status.mode.has,
				-- color = { fg = "ff9e64" },
			},
		},
		lualine_x = { "filetype" },
		lualine_y = {
			-- {
			-- 	require("noice").api.status.command.get,
			-- 	cond = require("noice").api.status.command.has,
			-- 	color = { fg = "ff9e64" },
			-- },
			"progress",
		},
		lualine_z = { location },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = { "nvim-tree", "trouble", "symbols-outline" },
})

require("lualine").refresh()
