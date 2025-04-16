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
          "rust_analyzer",
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
      -- Configure diagnostics display
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      -- LSP server setup
      require("lspconfig").denols.setup {}
      require("lspconfig").hls.setup {}
      require("lspconfig").idris2_lsp.setup {}
      -- require("lspconfig").lua_ls.setup {}
      require("lspconfig").prismals.setup {}
      require("lspconfig").purescriptls.setup {}
      require("lspconfig").rust_analyzer.setup({
        settings = {
          ["rust-analyzer"] = {
            check = {
              command = "clippy",
            }
          }
        }
      }) 
      require("lspconfig").terraformls.setup {}
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
