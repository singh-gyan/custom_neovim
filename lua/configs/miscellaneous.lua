require'nvim-lastplace'.setup {
    lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
    lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
    lastplace_open_folds = true
}

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}


local actions = require("telescope.actions")
local telescope_trouble = require("trouble.providers.telescope")
local trouble = require("trouble")

local telescope = require("telescope")

trouble.setup{
 position = "right",
	width = 40
}
telescope.setup {
  defaults = {
    mappings = {
      i = { ["<c-t>"] = telescope_trouble.open_with_trouble },
      n = { ["<c-t>"] = telescope_trouble.open_with_trouble },
    },
  },
}


require'navigator'.setup()
