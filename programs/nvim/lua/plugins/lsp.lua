return {
  {
    "williamboman/mason.nvim",
    priority = 1000,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = {
          "purescriptls",
        },
        automatic_installation = true,
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("lspconfig").hls.setup {}
      require("lspconfig").idris2_lsp.setup {}
      require("lspconfig").lua_ls.setup {}
      require("lspconfig").prismals.setup {}
      require("lspconfig").purescriptls.setup {}
      require("lspconfig").rust_analyzer.setup {}
      require("lspconfig").ts_ls.setup {}
    end,
  },
}
--   "williamboman/mason.nvim",
--   "williamboman/mason-lspconfig.nvim",
--   "neovim/nvim-lspconfig",
--
--   config = function()
--     require("mason").setup()
--     require("mason-lspconfig").setup {
--       ensure_installed = {
--         "purescriptls",
--       },
--       automatic_installation = true,
--     }
--     require("lspconfig").hls.setup {}
--     require("lspconfig").idris2_lsp.setup {}
--     require("lspconfig").lua_ls.setup {}
--     require("lspconfig").prismals.setup {}
--     require("lspconfig").purescriptls.setup {}
--     require("lspconfig").rust_analyzer.setup {}
--     require("lspconfig").ts_ls.setup {}
--   end,
-- }
--
