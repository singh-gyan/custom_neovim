local default_opts = { noremap = true, silent = true }
local keymap = function(mode, from, to, opts)
	if not opts then
		opts = default_opts
	end
	vim.keymap.set(mode, from, to, opts)
end
local nkeymap = function(from, to, opts)
	keymap("n", from, to, opts)
end
local hop_ok, hop = pcall(require, "hop")
if not hop_ok then
	return
end
if hop_ok then
	local directions = require("hop.hint").HintDirection
	local modes = { "n", "o", "v" }
	local opts = { remap = true, silent = true }
	keymap(modes, "f", function()
		hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
	end, opts)

	keymap(modes, "F", function()
		hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
	end, opts)

	keymap(modes, "t", function()
		hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
	end, opts)

	keymap(modes, "T", function()
		hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
	end, opts)
end
