local function define_autocmds(definitions)
	for _, entry in ipairs(definitions) do
		local event = entry[1]
		local opts = entry[2]
		if type(opts.group) == "string" and opts.group ~= "" then
			local exists, _ = pcall(vim.api.nvim_get_autocmds, { group = opts.group })
			if not exists then
				vim.api.nvim_create_augroup(opts.group, {})
			end
		end
		vim.api.nvim_create_autocmd(event, opts)
	end
end

local definitions = {
	{
		"TextYankPost",
		{
			group = "_general_settings",
			pattern = "*",
			desc = "Highlight text on yank",
			callback = function()
				require("vim.highlight").on_yank({ higroup = "Search", timeout = 100 })
			end,
		},
	},
	{
		"FileType",
		{
			group = "_hide_dap_repl",
			pattern = "dap-repl",
			command = "set nobuflisted",
		},
	},
	{
		"FileType",
		{
			group = "_filetype_settings",
			pattern = "qf",
			command = "set nobuflisted",
		},
	},
	{
		"FileType",
		{
			group = "_filetype_settings",
			pattern = { "gitcommit", "markdown" },
			command = "setlocal wrap spell",
		},
	},
	{
		"FileType",
		{
			group = "_buffer_mappings",
			pattern = { "qf", "help", "man", "floaterm", "lspinfo", "lsp-installer", "null-ls-info" },
			command = "nnoremap <silent> <buffer> q :close<CR>",
		},
	},
	{
		"VimResized",
		{
			group = "_auto_resize",
			pattern = "*",
			command = "tabdo wincmd =",
		},
	},
	{
		"FileType",
		{
			group = "_filetype_settings",
			pattern = "alpha",
			callback = function()
				vim.cmd([[
            nnoremap <silent> <buffer> q :qa<CR>
            nnoremap <silent> <buffer> <esc> :qa<CR>
            set nobuflisted
          ]])
			end,
		},
	},
	{
		"FileType",
		{
			group = "_filetype_settings",
			pattern = "lir",
			callback = function()
				vim.opt_local.number = false
				vim.opt_local.relativenumber = false
			end,
		},
	},
}

define_autocmds(definitions)
