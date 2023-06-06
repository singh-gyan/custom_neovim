vim.cmd("set undodir=~/.config/nvim/undo_cache")
local options = {
	undofile = true,
	wrap = true,
	linebreak = true,
	breakindent = true,
	relativenumber = true,
	number = true,
	backup = false,
	clipboard = "unnamedplus",
	completeopt = { "menuone", "noselect" },
	conceallevel = 0,
	fileencoding = "utf-8", -- the encoding written to a file
	hlsearch = true,
	mouse = "a",
	showtabline = 2,
	smartcase = true, -- smart case
	ignorecase = true,
	smartindent = true,
	swapfile = false,   -- creates a swapfile
	timeoutlen = 700,   -- time to wait for a mapped sequence to complete (in milliseconds)
	updatetime = 100,   -- faster completion (4000ms default)
	shiftwidth = 2,     -- the number of spaces inserted for each indentation
	tabstop = 2,        -- insert 2 spaces for a tab
	numberwidth = 4,    -- set number column width to 2 {default 4}
	cmdheight = 1,      -- more space in the neovim command line for displaying messages
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	scrolloff = 9,      -- minimal number of screen lines to keep above and below the cursor
	showmode = false,   -- we don't need to see things like -- INSERT -- anymore
	cursorline = true,
	splitbelow = true,  -- force all horizontal splits to go below current window
	splitright = true,  -- force all vertical splits to go to the right of current window
	termguicolors = true,
	background = "dark",
	whichwrap = "bs<>[]hl", -- which "horizontal" keys are allowed to travel to prev/next line
	--Fold options - Disable when not using nvim-ufo
	foldcolumn = "1",
	fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]],
	foldlevel = 99,
	foldlevelstart = 99,
	foldenable = true,
	laststatus = 3,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
-- vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
vim.cmd("colorscheme tokyonight-moon")
