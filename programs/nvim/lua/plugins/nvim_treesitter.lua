return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "asm",
        "bash",
        "c",
        "cmake",
        "cpp",
        "css",
        "dockerfile",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "go",
        "haskell",
        "http",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "nginx",
        "nix",
        "ocaml",
        "php",
        "prisma",
        "purescript",
        "python",
        "rust",
        "scheme",
        "sql",
        "tsx",
        "typescript",
        "vue",
        "yaml",
      },
      sync_install = false,
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    })
  end,
}
