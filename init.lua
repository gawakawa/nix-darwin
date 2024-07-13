# require('gitsigns').setup()

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true, -- シンタックスハイライトを有効にする
  },
  parser_install_dir = "~/.local/share/nvim/parser",
}

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed
    }
  end
end

require'lualine'.setup {
  sections = {
    lualine_b = { {'diff', source = diff_source}, },
  }
}


require('lualine').setup()

require('telescope').setup()

require('lazy').setup()

require('mason').setup()
