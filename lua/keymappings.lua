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
map("i", "kj", "<ESC>")

map("n", "<C-s>", ":w<CR>")
map("n", "<C-e>", ":e!<CR>")

map("n", "<S-l>", ":bnext<CR>")
map("n", "<S-h>", ":bprevious<CR>")
map("n", "S", ":HopWordBC<cr>")
map("n", "s", ":HopWordAC<cr>")
map("n", "<C-t>", ":ToggleTerm<CR>")
map({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
map({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
map({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
map({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
map("n", "<c-x>", "<Plug>(YankyCycleForward)")
map("n", "<c-p>", "<Plug>(YankyCycleBackward)")
map("n", "]p", "<Plug>(YankyPutIndentAfterLinewise)")
map("n", "[p", "<Plug>(YankyPutIndentBeforeLinewise)")
map("n", "]P", "<Plug>(YankyPutIndentAfterLinewise)")
map("n", "[P", "<Plug>(YankyPutIndentBeforeLinewise)")
map("n", ">p", "<Plug>(YankyPutIndentAfterShiftRight)")
map("n", "<p", "<Plug>(YankyPutIndentAfterShiftLeft)")
map("n", ">P", "<Plug>(YankyPutIndentBeforeShiftRight)")
map("n", "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)")
map("n", "=p", "<Plug>(YankyPutAfterFilter)")
map("n", "=P", "<Plug>(YankyPutBeforeFilter)")

map({ "n", "v" }, "D", '"_D')
map({ "n", "v" }, "d", '"_d')
map({ "n", "v" }, "dd", '"_dd')
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

map("n", "<C-Up>", ":resize +2<CR>")
map("n", "<C-Down>", ":resize -2<CR>")
map("n", "<C-Left>", ":vertical resize +2<CR>")
map("n", "<C-Right>", ":vertical resize -2<CR>")

map("n", "<space>ff", "<Nop>")
map("v", "<space>ff", "<Nop>")

map("v", "<A-j>", ":m .+1<CR>==")
map("v", "<A-k>", ":m .-2<CR>==")
map("v", "<A-,>", "A,<ESC>")
map("v", "<A-,>", "A,<ESC>")

map("x", "J", ":move '>+1<CR>gv-gv")
map("x", "K", ":move '<-2<CR>gv-gv")
map("x", "<A-k>", ":move '<-2<CR>gv-gv")
map("x", "<A-j>", ":move '>+1<CR>gv-gv")
