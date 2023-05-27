require("plenary")
local actions = require("telescope.actions")
local telescope_trouble = require("trouble.providers.telescope")
local trouble = require("trouble")

local telescope = require("telescope")

trouble.setup({
	position = "right",
	width = 40,
})
telescope.setup({
	defaults = {
		mappings = {
			i = { ["<c-t>"] = telescope_trouble.open_with_trouble },
			n = { ["<c-t>"] = telescope_trouble.open_with_trouble },
		},
	},
})
