local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")
local telescope_trouble = require("trouble.providers.telescope")

telescope.setup({
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		hidden = true,
		file_ignore_patterns = {
			"node_modules",
			"build",
			"dist",
			"yarn.lock",
		},
		mappings = {
			i = {
				-- ["<C-n>"] = actions.cycle_history_next,
				-- ["<C-p>"] = actions.cycle_history_prev,

				-- ["<C-j>"] = actions.move_selection_next,
				-- ["<C-k>"] = actions.move_selection_previous,

				["<C-j>"] = actions.toggle_selection + actions.move_selection_worse,
				["<C-k>"] = actions.toggle_selection + actions.move_selection_better,

				["<C-c>"] = actions.close,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,

				-- ["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				-- ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				-- ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-l>"] = actions.complete_tag,
				["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
				["<C-t>"] = telescope_trouble.open_with_trouble,
				-- Press Ctrl+F to toggle between fuzzy finding and regex search
				-- ["<C-f>"] = actions.toggle_fuzzy,
				-- Press Ctrl+R to toggle between fuzzy finding and regex search
				-- ["<C-r>"] = actions.toggle_regex,
			},

			n = {
				["<esc>"] = actions.close,
				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

				["j"] = actions.move_selection_next,
				["k"] = actions.move_selection_previous,
				["H"] = actions.move_to_top,
				["M"] = actions.move_to_middle,
				["L"] = actions.move_to_bottom,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["gg"] = actions.move_to_top,
				["G"] = actions.move_to_bottom,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["J"] = actions.cycle_history_next,
				["K"] = actions.cycle_history_prev,

				["<c-t>"] = telescope_trouble.open_with_trouble,
				["?"] = actions.which_key,
			},
		},
	},
	pickers = {
		find_files = {
			-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
			find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
			-- find_command = {'rg', '--files', '--hidden', '-g', '!.git', '-g', '!node_modules', '-g', '.gitignore'}
		},
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
	},
	extensions = {
		-- Your extension configuration goes here:
		-- extension_name = {
		--   extension_config_key = value,
		-- }
		-- please take a look at the readme of the extension you want to configure
		file_browser = {
			find_command = { "rg", "--files", "--hidden", "--no-ignore-vcs", "-g", "!.git" }, -- Add any additional options or filters here
		},
	},
})
require("telescope").load_extension("project")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("noice")
require("telescope").load_extension("frecency")
require("telescope").load_extension("yank_history")
-- require("telescope").load_extension("fzy")
