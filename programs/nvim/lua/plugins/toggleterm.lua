return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup{
      open_mapping = [[<c-t>]],
      start_in_insert = true,
    }

    vim.keymap.set("n", "<c-1>", ":1ToggleTerm<CR>")
    vim.keymap.set("n", "<c-2>", ":2ToggleTerm<CR>")
    vim.keymap.set("n", "<c-3>", ":3ToggleTerm<CR>")
    vim.keymap.set("n", "<c-4>", ":4ToggleTerm<CR>")
    vim.keymap.set("n", "<c-5>", ":5ToggleTerm<CR>")
  end,
}

