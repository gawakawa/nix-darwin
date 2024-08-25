-- Plugin Maneger を自動でダウンロードする
local jetpackfile = vim.fn.stdpath('data') .. '/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
local jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"
if vim.fn.filereadable(jetpackfile) == 0 then
  vim.fn.system(string.format('curl -fsSLo %s --create-dirs %s', jetpackfile, jetpackurl))
end

-- vim-jetpack で入れ込むプラグインをここに記載していく
vim.cmd('packadd vim-jetpack')

require('jetpack.paq') {
  -- ここの中に、プラグインを追記していきます。
  {'tani/vim-jetpack', opt = 1}, -- bootstrap
  'navarasu/onedark.nvim', -- color scheme
  {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}, -- プラグインを読み込んだ後にコマンドを実行します。
  {'nvim-tree/nvim-tree.lua', -- file explorer
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
  },
  'nvim-lua/plenary.nvim',
  {'nvim-telescope/telescope.nvim', tag = '0.1.0' }, -- search files
  "nvim-telescope/telescope-file-browser.nvim",
  'nvim-tree/nvim-web-devicons', -- file icon
  {
    'nvim-lualine/lualine.nvim', -- status line
    requires = 'kyazdani42/nvim-web-devicons'
  },
  {'neoclide/coc.nvim', branch='release'}, -- auto completion
  'yamatsum/nvim-cursorline', -- underline same words
  'pechorin/any-jump.vim', -- jump to called object
  {
    'numToStr/Comment.nvim',  -- comment in normal mode with gcc
    config = function() require('Comment').setup() end
  },
  'norcalli/nvim-colorizer.lua', -- colorize color code
  'dinhhuy258/git.nvim', -- git
  'lewis6991/gitsigns.nvim', -- git manage
  'windwp/nvim-ts-autotag', -- auto close tag
  'pocco81/auto-save.nvim', -- auto save
  'akinsho/bufferline.nvim', -- buffer line
  'windwp/nvim-autopairs', -- auto close parentheses
  'echasnovski/mini.indentscope', -- indent scope
  'akinsho/toggleterm.nvim', -- open terminal
}