require ('kawa/basic_config')
require ('kawa/setup_plugin')
require('kawa/plugins/colorscheme')
require('kawa/plugins/nvim_web_devicons')
require('kawa/plugins/lualine')
require('kawa/plugins/nvim_cursorline')
require('kawa/plugins/auto_save')
require('kawa/plugins/colorizer')
require('kawa/plugins/gitsigns')
require('kawa/plugins/bufferline')
require('kawa/plugins/indentscope')
require('kawa/plugins/toggleterm')
require('kawa/plugins/nvim_tree')
require("telescope").load_extension "file_browser"

require("telescope").setup{
  pickers = {
		find_files = {
			find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
		},
	},
}

local builtin = require('telescope.builtin')
