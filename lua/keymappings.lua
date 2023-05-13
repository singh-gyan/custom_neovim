local opts = { silent = true, noremap = true }
local function map(mode, key, value, default)
	local opt = nil
	if default == nil then
		opt = opts
	else
		opt = { silent = true, noremap = false }
	end
	vim.keymap.set(mode, key, value, opt)
end
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "
map("i", "kj", "<ESC>")
map("v", "dd", '"_dd')
map("v", "d", '"_d')

map("n", "<C-s>", ":w<CR>")
map("n", "<C-e>", ":e!<CR>")

map("n", "<S-l>", ":bnext<CR>")
map("n", "<S-h>", ":bprevious<CR>")
map("n", "S", ":HopLineStart<cr>")
map("n", "s", ":HopWord<cr>")
map("n", "<C-t>", ":ToggleTerm<CR>")

map("n", "d", '"_d')
map("n", "dd", '"_dd')
map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-2<CR>==")
map("n", "<A-,>", "A,<ESC>")
map("n", "<A-,>", "A,<ESC>")

map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-h>", "<C-w>h")

map("n", "<C-w>j", "<C-w>j:q<cr>")
map("n", "<C-w>k", "<C-w>k:q<cr>")
map("n", "<C-w>l", "<C-w>l:q<cr>")
map("n", "<C-w>h", "<C-w>h:q<cr>")

map("v", "<A-j>", ":m .+1<CR>==")
map("v", "<A-k>", ":m .-2<CR>==")
map("v", "<A-,>", "A,<ESC>")
map("v", "<A-,>", "A,<ESC>")

map("x", "J", ":move '>+1<CR>gv-gv")
map("x", "K", ":move '<-2<CR>gv-gv")
map("x", "<A-k>", ":move '<-2<CR>gv-gv")
map("x", "<A-j>", ":move '>+1<CR>gv-gv")
