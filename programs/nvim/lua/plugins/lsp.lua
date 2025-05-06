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
          "denols",
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
      require("lspconfig").denols.setup {
        on_attach = function(client, bufnr)
          -- Enable formatting on save for Deno projects
          if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ async = false })
              end,
            })
          end
        end,
        root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc"),
        settings = {
          deno = {
            enable = true,
            lint = true,
            unstable = false,
            suggest = {
              imports = {
                hosts = {
                  ["https://deno.land"] = true,
                },
              },
            },
          },
        },
      }
      require("lspconfig").hls.setup {}
      -- require("lspconfig").lua_ls.setup {}
      require("lspconfig").prismals.setup {}
      require("lspconfig").purescriptls.setup {}
      require("lspconfig").rust_analyzer.setup({
        settings = {
          ["rust-analyzer"] = {
            check = {
              command = "clippy",
            },
            imports = {
              granularity = {
                group = "module",
              },
            },
          }
        },
        on_attach = function(client, bufnr)
          -- Enable formatting on save
          if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ async = false })
              end,
            })
          end
        end,
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
