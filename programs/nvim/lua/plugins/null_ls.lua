return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local null_ls = require("null-ls")

    vim.filetype.add({
      extension = {
        purs = "purescript"
      }
    })

    null_ls.setup {
      sources = {
        null_ls.builtins.code_actions.eslint,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.purs_tidy,
      },
    }
  end,
}

