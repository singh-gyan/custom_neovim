local neorg = require("neorg")

local root = "~/Neorg/"

neorg.setup({
	load = {
		["core.defaults"] = {}, -- Loads default behaviour
		["core.concealer"] = {}, -- Adds pretty icons to your documents
		["core.dirman"] = {    -- Manages Neorg workspaces
			config = {
				workspaces = {
					personal = root .. "personal",
					work = root .. "work",
				},
				default_workspace = "personal",
			},
		},
	},
})
