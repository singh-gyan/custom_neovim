local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "folke/which-key.nvim" },
	{ "nvim-lua/plenary.nvim" },
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional
		},
	},
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	{
		"neovim/nvim-lspconfig",
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.1",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "1.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		-- build = "make install_jsregexp"
	},
	{ "hrsh7th/nvim-cmp" },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opt = true,
	},
	-- { "saadparwaiz1/cmp_luasnip" },
	{ "jose-elias-alvarez/null-ls.nvim" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-nvim-lua" },
	{ "hrsh7th/cmp-cmdline" },
	{ "tzachar/cmp-tabnine",            build = "./install.sh", dependencies = "hrsh7th/nvim-cmp" },
	{ "rafamadriz/friendly-snippets" }, -- a bunch of snippets to use
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
	{ "onsails/lspkind.nvim" },
	{ "windwp/nvim-autopairs" },
	{ "windwp/nvim-ts-autotag" },
	{ "lewis6991/gitsigns.nvim" },
	{ "akinsho/bufferline.nvim",                    version = "*", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
	},
	{
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		config = function()
			require("hop").setup()
		end,
	},
	{
		"ray-x/navigator.lua",
		event = "BufEnter",
		lazy = true,
		dependencies = {
			{ "ray-x/guihua.lua",     build = "cd lua/fzy && make" },
			{ "neovim/nvim-lspconfig" },
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		-- after = "nvim-treesitter",
		-- dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
	{ "RRethy/nvim-treesitter-textsubjects" },
	--Colors schemes
	-- {
	-- 	"navarasu/onedark.nvim",
	-- })
	{ "olimorris/onedarkpro.nvim" },
	{ "folke/tokyonight.nvim" },
	{ "catppuccin/nvim" },
	{
		"projekt0n/github-nvim-theme",
		config = function()
			require("github-theme").setup({
				options = {
					inverse = {
						search = true,
						visual = true,
					},
				},
			})
		end,
	},
	{ "rose-pine/neovim" },
	--Development Plugins
	{ "nvim-treesitter/playground" },

	--Additional Plugins
	{
		"tpope/vim-surround",
	},
	{ "famiu/bufdelete.nvim" },
	{ "ethanholz/nvim-lastplace" },
	{ "terryma/vim-multiple-cursors" },
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		lazy = true,
		module = "persistence",
		config = function()
			require("persistence").setup({
				dir = vim.fn.expand(vim.fn.stdpath("config") .. "/session/"),
				options = { "buffers", "curdir", "tabpages", "winsize" },
			})
		end,
	},
	{
		"APZelos/blamer.nvim",
	},
	{ "mbbill/undotree" },
	{ "theprimeagen/harpoon" },
	{ "gbprod/yanky.nvim" },
	{ "christoomey/vim-tmux-navigator" },
	{ "lukas-reineke/indent-blankline.nvim" },
	{ "RRethy/vim-illuminate" },
	{
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").config)
		end,
	},
	{ "nvim-telescope/telescope-project.nvim", dependencies = { "nvim-telescope/telescope-file-browser.nvim" } },
	{ "mfussenegger/nvim-treehopper" },
	{ "kevinhwang91/nvim-ufo",                 dependencies = "kevinhwang91/promise-async" },
	{
		"nvim-pack/nvim-spectre",
		cmd = "Spectre",
		lazy = true,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			local context = require("treesitter-context")
			context.setup({ max_lines = 2 })
			vim.keymap.set("n", "[c", function()
				context.go_to_context()
			end, { silent = true })
		end,
	},
	--Experimenting with the packages
	-- TODO Move essential to additional plugins
	{ "m4xshen/hardtime.nvim" },
	-- {
	-- 	"SmiteshP/nvim-navic",
	-- 	dependencies = "neovim/nvim-lspconfig",
	-- },
	{ "chentoast/marks.nvim" },
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
	},
	{
		"nvim-telescope/telescope-frecency.nvim",
		config = function()
			require("telescope").load_extension("frecency")
		end,
		dependencies = { "kkharji/sqlite.lua" },
	},
	-- { "m-demare/hlargs.nvim" },
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		dependencies = { { "nvim-lua/plenary.nvim" } },
		cmd = "Neorg",
	},
})
