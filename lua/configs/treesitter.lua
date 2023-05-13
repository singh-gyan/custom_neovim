local ts = require("nvim-treesitter.configs")

ts.setup({
  ensure_installed = { "bash", "c", "javascript", "json", "lua", "python", "typescript", "tsx", "css", "rust", "java", "yaml", "markdown", "markdown_inline" }, -- one of "all" or a list of languages
	ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "css" }, -- list of language that will be disabled
	},
	autopairs = {
		enable = true,
	},

	indent = { enable = true, disable = { "python", "css" } },
	incremental_selection = {
  enable = true,
  keymaps = {
    init_selection = "<c-space>",
    node_incremental = "<c-space>",
    scope_incremental = "<c-s>",
    node_decremental = "<m-space>",
  },
	}
})
