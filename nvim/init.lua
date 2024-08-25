require ('kawa/basic_config')
require ('kawa/setup_plugin')
require ('kawa/plugins/colorscheme')
require ('kawa/plugins/nvim_tree')
-- 私は、leaderはSpaceキーを当てています。下の割当だと、Spaceキーとeを同時押しすることで、ファイルツリーが表示されます。leaderキーの設定方法は後述します。
-- api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', {silent=true})

require("telescope").load_extension "file_browser"
vim.api.nvim_set_keymap(
  "n",
  "<space>ff",
  ":Telescope file_browser<CR>",
  { noremap = true }
)

require("telescope").setup{
  pickers = {
		find_files = {
			find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
		},
	},
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>p', builtin.find_files, {})
vim.keymap.set('n', '<leader>f', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require ('kawa/plugins/nvim_web_devicons')
require ('kawa/plugins/lualine')
require ('kawa/plugins/nvim_cursorline')
require ('kawa/plugins/auto_save')
require ('kawa/plugins/colorizer')
require ('kawa/plugins/gitsigns')
require ('kawa/plugins/bufferline')
require ('kawa/plugins/indentscope')
require ('kawa/plugins/toggleterm')

vim.g.mapleader = ' ' -- 半角スペースを設定しています。
vim.keymap.set('i', 'jj', '<ESC>', {silent=true}) -- インサートモードを抜ける
vim.keymap.set('n', ';', ':', {silent=true}) -- シフトを押すことなく、;を入力する。割と便利

vim.keymap.set('n', '<leader>sv', '<C-w>v') -- ウィンドウを垂直方向に分割する
vim.keymap.set('n', '<leader>sh', '<C-w>s') -- ウィンドウを水平に分割する
vim.keymap.set('n', '<leader>se', '<C-w>=') -- ウィンドウの幅を等分にする
vim.keymap.set('n', '<leader>sx', ':close<CR>') -- 現在、カーソルがいるウィンドウを閉じる
vim.keymap.set('n', '<leader>sw', '<C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>>') -- ウィンドウの幅を少し広げる
vim.keymap.set('n', '<leader>sww', '<C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>>') -- ウィンドウの幅を大きく広げる
vim.keymap.set('n', '<leader>st', '<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><') -- ウィンドウの幅を少し狭める
vim.keymap.set('n', '<leader>stt', '<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><') -- ウィンドウの幅を大きく狭める

-- タブを作成、削除
vim.keymap.set('n', '<leader>to', ':tabnew<CR>')
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>')
vim.keymap.set('n', '<leader>tn', ':tabn<CR>')
vim.keymap.set('n', '<leader>tp', ':tabp<CR>')
-- ウィンドウを移動する
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
-- 単語を' " どちらかで囲う
vim.keymap.set('n', '<leader>aw', 'ciw""<Esc>P')
vim.keymap.set('n', '<leader>aW', "ciw''<Esc>P")