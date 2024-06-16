{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
        nvim-treesitter.withAllGrammars # syntax highlighting
        telescope-nvim # fuzzy finder
        nvim-cmp # autocompletion
        lualine-nvim # statusline
        lazy-nvim # package manager
        mason-nvim # package manager
        nvim-lspconfig
        mason-lspconfig-nvim
        gitsigns-nvim
    ];
  };
}