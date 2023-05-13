local options = {
	wrap = true,
	linebreak = true,
	breakindent = true,
	relativenumber = true,
	backup = false,
	clipboard = "unnamedplus",
	completeopt = { "menuone", "noselect" },
	conceallevel = 0,
	fileencoding = "utf-8", -- the encoding written to a file
	hlsearch = true,
	mouse = "a",
	showtabline = 2,
	smartcase = true, -- smart case
	smartindent = true,
	timeoutlen = 600, -- time to wait for a mapped sequence to complete (in milliseconds)
	updatetime = 300, -- faster completion (4000ms default)
	shiftwidth = 2, -- the number of spaces inserted for each indentation
	tabstop = 2, -- insert 2 spaces for a tab
	numberwidth = 4, -- set number column width to 2 {default 4}
	cmdheight = 1, -- more space in the neovim command line for displaying messages
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	scrolloff = 5, -- minimal number of screen lines to keep above and below the cursor
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
vim.cmd("colorscheme catppuccin-macchiato")
