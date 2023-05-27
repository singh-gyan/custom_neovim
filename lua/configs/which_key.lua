local status_ok, which_key = pcall(require, "which-key")

if not status_ok then
	return
end
--local which_key = require('which-key')
local setup = {
	plugins = {
		marks = true,    -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true,   -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true,   -- default bindings on <c-w>
			nav = true,       -- misc bindings to work with windows
			z = true,         -- bindings for folds, spelling and others prefixed with z
			g = true,         -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+",    -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded",     -- none, single, double, shadow
		position = "bottom",    -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 },                                            -- min and max height of the columns
		width = { min = 20, max = 50 },                                            -- min and max width of the columns
		spacing = 3,                                                               -- spacing between columns
		align = "left",                                                            -- align columns left, center or right
	},
	ignore_missing = true,                                                       -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true,                                                            -- show help message on the command line when the popup is visible
	triggers = "auto",                                                           -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n",    -- NORMAL mode
	prefix = "<leader>",
	buffer = nil,  -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
}

local mappings = {
	["/"] = { ":noh<CR>", "highlight" },
	["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	["x"] = { "<cmd>Bdelete<cr>", "Close Buffer" },
	["f"] = {
		"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		"Find files",
	},
	["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },

	b = {
		name = "Buffers",
		j = { "<cmd>BufferLinePick<cr>", "Jump" },
		f = { "<cmd>Telescope buffers<cr>", "Find" },
		g = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Find" },
		b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
		n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
		e = {
			"<cmd>BufferLinePickClose<cr>",
			"Pick which buffer to close",
		},
		h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
		l = {
			"<cmd>BufferLineCloseRight<cr>",
			"Close all to the right",
		},
		D = {
			"<cmd>BufferLineSortByDirectory<cr>",
			"Sort by directory",
		},
		L = {
			"<cmd>BufferLineSortByExtension<cr>",
			"Sort by language",
		},
	},
	g = {
		name = "Git",
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		d = {
			"<cmd>Gitsigns diffthis HEAD<cr>",
			"Diff",
		},
	},
	["h"] = {
		name = "Harpoon",
		m = { ":lua require('harpoon.mark').add_file()<cr>", "Mark file" },
		t = { ":lua require('harpoon.ui').toggle_quick_menu()<cr>", "Toggle UI" },
		a = { ":lua require('harpoon.ui').nav_file(1)<cr>", "Goto mark 1" },
		s = { ":lua require('harpoon.ui').nav_file(2)<cr>", "Goto mark 2" },
		d = { ":lua require('harpoon.ui').nav_file(3)<cr>", "Goto mark 3" },
		f = { ":lua require('harpoon.ui').nav_file(4)<cr>", "Goto mark 4" },
		g = { ":lua require('harpoon.ui').nav_file(5)<cr>", "Goto mark 5" },
		q = { ":lua require('harpoon.ui').nav_file(6)<cr>", "Goto mark 6" },
		w = { ":lua require('harpoon.ui').nav_file(7)<cr>", "Goto mark 7" },
		e = { ":lua require('harpoon.ui').nav_file(8)<cr>", "Goto mark 8" },
		r = { ":lua require('harpoon.ui').nav_file(9)<cr>", "Goto mark 9" },
		l = { ":lua require('harpoon.ui').nav_next()<cr>", "Next file" },
		h = { ":lua require('harpoon.ui').nav_prev()<cr>", "Prev file" },
	},
	l = {
		name = "+Lsp",
		s = { "<cmd>:LspSymbols<cr>", "Symbols" },
		i = { "<cmd>:LspInfo<cr>", "Symbols" },
		k = { "<cmd>:LspKeymaps<cr>", "keymaps" },
		m = { "<cmd>:Mason<cr>", "Mason" },
	},
	n = {
		name = "+Neorg",
		n = { "<cmd>Neorg index<cr>", "Index" },
		r = { "<cmd>Neorg return<cr>", "Return" },
		p = { "<cmd>Neorg workspace personal<cr>", "Personal" },
		w = { "<cmd>Neorg workspace work<cr>", "Work" },
	},
	L = { "<cmd>Lazy<cr>", "Lazy" },
	["s"] = {
		name = "+Search",
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		B = { "<cmd>Telescope builtin<cr>", "Builtins" },
		C = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		e = { "<cmd>Telescope file_browser<cr>", "File Browse" },
		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		R = { "<cmd>Telescope registers<cr>", "Registers" },
		t = { "<cmd>TodoTelescope<cr>", "Registers" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		c = { "<cmd>Telescope commands<cr>", "Commands" },
		g = { "<cmd>Telescope live_grep<cr>", "Grep" },
		f = {
			"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
			"Find files",
		},
		s = { "<cmd>Telescope resume<cr>", "Resume Search" },
		w = {
			"<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand('<cword>') })<cr>",
			"Search Word Under Cursor",
		},
		y = { "<cmd>Telescope yank_history<cr>", "YankHistory" },
	},
	["S"] = {
		name = "+Session",
		c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
		l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
		Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
	},
	["T"] = {
		name = "+Trouble",
		r = { "<cmd>Trouble lsp_references<cr>", "References" },
		f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
		d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
		q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
		l = { "<cmd>Trouble loclist<cr>", "LocationList" },
		w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
	},
	["t"] = {
		name = "+Tresitter",
		h = {
			function()
				require("tsht").nodes()
			end,
			"hop",
		},
	},
	u = { "<cmd>UndotreeToggle<cr>", "UndoTree" },
	z = { "<cmd>echo expand('%:p')<cr>", "FilePath" },
}

which_key.setup(setup)
which_key.register(mappings, opts)
