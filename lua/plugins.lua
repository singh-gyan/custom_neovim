local fn = vim.fn
---- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end
--
---- Autocommand that reloads neovim whenever you save the plugins.lua file
--
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])
--
---- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end
--
---- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])
return packer.startup(function(use)
	use({ "folke/which-key.nvim" })
	use({ "nvim-lua/plenary.nvim" })
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional
		},
	})
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})
	use({
		"neovim/nvim-lspconfig",
	})
	use({
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
	})
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "L3MON4D3/LuaSnip" })
	use("hrsh7th/nvim-cmp")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use({ "saadparwaiz1/cmp_luasnip" })
	use({ "jose-elias-alvarez/null-ls.nvim" })
	use({ "hrsh7th/cmp-buffer" }) -- buffer completions
	use({ "hrsh7th/cmp-path" })  -- path completions
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })
	use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
	use({ "onsails/lspkind.nvim" })
	use({ "windwp/nvim-autopairs" })
	use({ "windwp/nvim-ts-autotag" })
	use({ "lewis6991/gitsigns.nvim" })
	use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
	})
	use({
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		config = function()
			require("hop").setup()
		end,
	})
	use({
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
		requires = "nvim-treesitter/nvim-treesitter",
	})
	use({ "RRethy/nvim-treesitter-textsubjects" })
	--Colors schemes
	use({ "navarasu/onedark.nvim" })
	use("folke/tokyonight.nvim")
	use({ "catppuccin/nvim", as = "cat" })
	use({
		"projekt0n/github-nvim-theme",
		config = function()
			require("github-theme").setup({
				-- ...
			})
		end,
	})
	use({ "rose-pine/neovim", as = "rose-pine" })
	--Additional Plugins
	use({
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig",
		config = function()
			require("nvim-navic").setup()
		end,
	})
	use({
		"tpope/vim-surround",
	})
	use("famiu/bufdelete.nvim")
	use("ethanholz/nvim-lastplace")
	use({ "terryma/vim-multiple-cursors" })
	use({
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		module = "persistence",
		config = function()
			require("persistence").setup({
				dir = vim.fn.expand(vim.fn.stdpath("config") .. "/session/"),
				options = { "buffers", "curdir", "tabpages", "winsize" },
			})
		end,
	})
	use({
		"APZelos/blamer.nvim",
	})
	use({ "mbbill/undotree" })
	use({ "theprimeagen/harpoon" })
	use({ "christoomey/vim-tmux-navigator" })
	use({ "lukas-reineke/indent-blankline.nvim" })
	use({ "RRethy/vim-illuminate" })
	use({
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").config)
		end,
	})
	use({ "nvim-telescope/telescope-project.nvim", requires = { "nvim-telescope/telescope-file-browser.nvim" } })
	--Experimenting with the packages
	use({
		"nvim-telescope/telescope-frecency.nvim",
		config = function()
			require("telescope").load_extension("frecency")
		end,
		requires = { "kkharji/sqlite.lua" },
	})
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run =
		"cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})
	use({ "m-demare/hlargs.nvim" })
	use({
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			local context = require("treesitter-context")
			context.setup({ max_lines = 2 })
			vim.keymap.set("n", "[c", function()
				context.go_to_context()
			end, { silent = true })
		end,
	})
	use({
		"ray-x/navigator.lua",
		requires = {
			{ "ray-x/guihua.lua",     run = "cd lua/fzy && make" },
			{ "neovim/nvim-lspconfig" },
		},
	})
	use("gbprod/yanky.nvim")
	use({
		"nvim-neorg/neorg",
		run = ":Neorg sync-parsers",
		requires = "nvim-lua/plenary.nvim",
	})
end)
