require("navigator").setup({
	mason = true,
	lsp = {
		format_on_save = { enable = { "lua", "go" }, disable = { "javascript", "typescript" } },
		tsserver = {
			filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
		},
	},
})
