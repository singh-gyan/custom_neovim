local terminal = require("toggleterm")
terminal.setup({
	active = true,
	on_config_done = nil,
	-- size can be a number or function which is passed the current terminal
	size = 20,
	open_mapping = [[<c-t>]],
	hide_numbers = true, -- hide the number column in toggleterm buffers
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,    -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
	start_in_insert = true,
	insert_mappings = true, -- whether or not the open mapping applies in insert mode
	persist_size = false,
	-- direction = 'vertical' | 'horizontal' | 'window' | 'float',
	direction = "tab",
	close_on_exit = true, -- close the terminal window when the process exits
	shell = vim.o.shell, -- change the default shell
	-- This field is only relevant if direction is set to 'float'
	float_opts = {
		-- The border key is *almost* the same as 'nvim_win_open'
		-- see :h nvim_win_open for details on borders however
		-- the 'curved' border is a custom border type
		-- not natively supported but implemented in this plugin.
		-- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
		border = "curved",
		-- width = <value>,
		-- height = <value>,
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
	-- Add executables on the config.lua
	-- { exec, keymap, name}
	-- lvim.builtin.terminal.execs = {{}} to overwrite
	-- lvim.builtin.terminal.execs[#lvim.builtin.terminal.execs+1] = {"gdb", "tg", "GNU Debugger"}
	-- TODO: pls add mappings in which key and refactor this
	execs = {
		{ vim.o.shell, "<A-1>", "Horizontal Terminal", "horizontal", 0.3 },
		{ vim.o.shell, "<A-2>", "Vertical Terminal",   "vertical",   0.4 },
		{ vim.o.shell, "<A-3>", "Float Terminal",      "float",      nil },
	},
})

function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	-- vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
	-- vim.api.nvim_buf_set_keymap(0, "t", "kj", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<A-1>", [[<C-t>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<A-2>", [[<C-t>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<A-3>", [[<C-t>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<A-4>", [[<C-t>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end
