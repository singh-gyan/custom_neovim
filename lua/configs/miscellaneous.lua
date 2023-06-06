require("nvim-lastplace").setup({
	lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
	lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
	lastplace_open_folds = true,
})

require("indent_blankline").setup({
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
})

require("yanky").setup({
	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
})

-- require("hlargs").setup()
require("todo-comments").setup({
	signs = true,     -- show icons in the signs column
	sign_priority = 8, -- sign priority
	-- keywords recognized as todo comments
	keywords = {
		FIX = {
			icon = " ",                           -- icon used for the sign, and in search results
			color = "error",                         -- can be a hex color, or a named color (see below)
			alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
			-- signs = false, -- configure signs for some keywords individually
		},
		TODO = { icon = " ", color = "info" },
		HACK = { icon = " ", color = "warning" },
		WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
		PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
		NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
		TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
	},
	gui_style = {
		fg = "NONE",        -- The gui style to use for the fg highlight group.
		bg = "BOLD",        -- The gui style to use for the bg highlight group.
	},
	merge_keywords = true, -- when true, custom keywords will be merged with the defaults
	-- highlighting of the line containing the todo comment
	-- * before: highlights before the keyword (typically comment characters)
	-- * keyword: highlights of the keyword
	-- * after: highlights after the keyword (todo text)
	highlight = {
		multiline = true,              -- enable multine todo comments
		multiline_pattern = "^.",      -- lua pattern to match the next multiline from the start of the matched keyword
		multiline_context = 10,        -- extra lines that will be re-evaluated when changing a line
		before = "",                   -- "fg" or "bg" or empty
		keyword = "wide",              -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
		after = "fg",                  -- "fg" or "bg" or empty
		pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
		comments_only = true,          -- uses treesitter to match keywords in comments only
		max_line_len = 400,            -- ignore lines longer than this
		exclude = {},                  -- list of file types to exclude highlighting
	},
	-- list of named colors where we try to extract the guifg from the
	-- list of highlight groups or use the hex color if hl not found as a fallback
	colors = {
		error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
		warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
		info = { "DiagnosticInfo", "#2563EB" },
		hint = { "DiagnosticHint", "#10B981" },
		default = { "Identifier", "#7C3AED" },
		test = { "Identifier", "#FF00FF" },
	},
	search = {
		command = "rg",
		args = {
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
		},
		-- regex that will be used to match keywords.
		-- don't replace the (KEYWORDS) placeholder
		pattern = [[\b(KEYWORDS):]], -- ripgrep regex
		-- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
	},
})

require("hardtime").setup({
	max_time = 1000,
	max_count = 2,
	disable_mouse = false,
	hint = true,
	allow_different_key = false,
	resetting_keys = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "c", "d" },
	restricted_keys = { "h", "j", "k", "l", "gk", "gj", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>" },
	hint_keys = { "k", "j", "^", "$", "a", "x", "i", "d", "y", "c", "l" },
	disabled_keys = { "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>" },
	disabled_filetypes = {
		"qf",
		"netrw",
		"NvimTree",
		"lazy",
		"mason",
		"undotree",
		"trouble",
		"packer",
		"lsp",
		"guihua",
		"Spectre"
	},
})

require("ufo").setup({
	provider_selector = function(bufnr, filetype, buftype)
		return { "treesitter", "indent" }
	end,
	open_fold_hl_timeout = 100,
})

local key_maps = {
	set = "`",
	set_next = "`,",
	next = "mn",
	preview = "m:",
	set_bookmark0 = "`0",
	prev = false, -- pass false to disable only this default mapping
}
require("marks").setup({
	mappings = {
		set = "`",
		set_next = "`,",
		next = "mn",
		prev = "mp",
		preview = "m:",
		set_bookmark0 = "`0",
	},
})

-- local function overrideMapping(default, key1, key2)
-- 	for i = 0, 9 do
-- 		local map = default .. i
-- 		mappings[map] = key1 .. key2
-- 	end
-- end
