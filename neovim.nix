{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
#     	gitsigns-nvim
        (nvim-treesitter.withPlugins (plugins:
		with plugins; [
			tree-sitter-markdown
			tree-sitter-nix
	])) # syntax highlighting
        telescope-nvim # fuzzy finder
        nvim-cmp # autocompletion
        lualine-nvim # statusline
        lazy-nvim # package manager
        mason-nvim # package manager
        nvim-lspconfig
        mason-lspconfig-nvim
    ];
    # ~/.config/nvim/init.luaに文字列が展開される
    # extraLuaConfig = builtins.readFile ./init.lua;
  };
}
