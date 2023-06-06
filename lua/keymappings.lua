local opt = { silent = true, noremap = true }
local function map(mode, key, value, desc)
	if not desc == nil then
		opt.des = desc
	end
	vim.keymap.set(mode, key, value, opt)
end
local cwd = vim.api.nvim_call_function("getcwd", {})

function RemoveLineBreaks()
	local register_content = vim.fn.getreg(vim.v.register, 1)
	local cleaned_content = vim.fn.substitute(register_content, "^\\n\\|\\n$", "", "")
	vim.fn.setreg(vim.v.register, cleaned_content)
end

map("", "<Space>", "<Nop>")
map("i", "kj", "<ESC>")
map("i", "jk", "<ESC>")
map("n", "j", "gj")
map("n", "k", "gk")
map("n", "<C-u>", "<C-u>zz", "Half up and centre screen")
map("n", "<C-d>", "<C-d>zz", "Half down and centre screen")
map("n", "<C-f>", "<C-f>zz", "Full up and centre screen")
map("n", "<C-b>", "<C-b>zz", "Full down and centre screen")

map("n", "<C-s>", ":w<CR>")
map("n", "<C-e>", ":e!<CR>")
map("n", "<A-a>v", "ggVG<CR>")
map("n", "<A-a>y", "ggVGy<CR>")
map("n", "<A-a>d", "ggVGd<CR>")
map("n", "<A-a>x", "ggVGx<CR>")

map("n", "`", "m")
map("n", "m", "`")
local function toUpperCase(char)
	return string.upper(char)
end

-- PERF: Improve this for better performance
---------------------------
-- local letters = "abcdefghijklmnopqrstuvwxyz"
-- for i = 1, #letters do
-- 	local char = letters:sub(i, i)
-- 	local mapping = "m" .. char
-- 	local cmd = "`" .. toUpperCase(char)
-- 	vim.api.nvim_set_keymap("n", mapping, cmd, opts)
-- end
-- for i = 1, #letters do
-- 	local char = letters:sub(i, i)
-- 	local mapping = "`" .. char
-- 	local cmd = "m" .. toUpperCase(char)
-- 	vim.api.nvim_set_keymap("n", mapping, cmd, opts)
-- end
----------------------------
map("n", "<S-l>", ":bnext<CR>")
map("n", "<S-h>", ":bprevious<CR>")
map("n", "<A-l>", ":BufferLineMoveNext<CR>")
map("n", "<A-h>", ":BufferLineMovePrev<CR>")
map("n", "S", ":HopWordBC<cr>")
map("n", "s", ":HopWordAC<cr>")
map({ "v", "o", "x" }, "m", '<Cmd>lua require("tsht").nodes()<CR>')
map("n", "<C-t>", ":ToggleTerm<CR>")
map("n", ";m", ":lua require('harpoon.mark').add_file()<cr>")
map("n", ";t", ":lua require('harpoon.ui').toggle_quick_menu()<cr>")
map("n", ";a", ":lua require('harpoon.ui').nav_file(1)<cr>")
map("n", ";s", ":lua require('harpoon.ui').nav_file(2)<cr>")
map("n", ";d", ":lua require('harpoon.ui').nav_file(3)<cr>")
map("n", ";f", ":lua require('harpoon.ui').nav_file(4)<cr>")
map("n", ";g", ":lua require('harpoon.ui').nav_file(5)<cr>")
map("n", ";l", ":lua require('harpoon.ui').nav_next()<cr>")
map("n", ";h", ":lua require('harpoon.ui').nav_prev()<cr>")
map("n", "`l", ":MarksListBuf<cr>")
map("n", "`L", ":MarksListAll<cr>")
map("n", "`m", ":MarksToggleSigns<cr>")
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
map("n", "<A-1>", ":ToggleTerm  dir=" .. cwd .. " direction=tab<cr>")
map("n", "<A-2>", ":ToggleTerm  dir=" .. cwd .. " direction=horizontal<cr>")
map("n", "<A-3>", ":ToggleTerm  dir=" .. cwd .. " direction=float<cr>")
map("n", "<A-4>", ":ToggleTerm  dir=" .. cwd .. " direction=vertical<cr>")
map("n", "<Leader>p", ":lua RemoveLineBreaks()<CR>p")
map("n", "<Leader>P", ":lua RemoveLineBreaks()<CR>P")
map("n", "<Leader>,,", ":luafile ./lua/configs/logger.lua<cr>")
map("n", "zR", require("ufo").openAllFolds)
map("n", "zM", require("ufo").closeAllFolds)
map("n", "zk", function()
	require("ufo").goPreviousStartFold()
end, "Prev Fold")
map("n", "zj", function()
	require("ufo").goNextClosedFold()
end)
map("n", "zK", function()
	local winid = require("ufo").peekFoldedLinesUnderCursor()
	if not winid then
		-- choose one of coc.nvim and nvim lsp
		vim.lsp.buf.hover()
	end
end, "Fold Preview")

map({ "n", "v" }, "D", '"_D')
map({ "n", "v" }, "d", '"_d')
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

map("n", "<C-Up>", ":resize +2<CR>")
map("n", "<C-Down>", ":resize -2<CR>")
map("n", "<C-Left>", ":vertical resize +2<CR>")
map("n", "<C-Right>", ":vertical resize -2<CR>")

map("v", "<A-j>", ":m .+1<CR>==")
map("v", "<A-k>", ":m .-2<CR>==")
map("v", "<A-,>", "A,<ESC>")
map("v", "<A-,>", "A,<ESC>")

map("x", "J", ":move '>+1<CR>gv-gv")
map("x", "K", ":move '<-2<CR>gv-gv")
map("x", "<A-k>", ":move '<-2<CR>gv-gv")
map("x", "<A-j>", ":move '>+1<CR>gv-gv")
