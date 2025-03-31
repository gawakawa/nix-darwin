{ config, pkgs, lib, ... }: 
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;
    
    plugins = with pkgs.vimPlugins; [
      lazy-nvim
    ];
    
    extraConfig = ''
      " nvim設定ディレクトリを指定
      let g:nvim_config_dir = "${config.home.homeDirectory}/.config/nix-darwin/programs/nvim"
      
      " runtimepathを設定
      let &runtimepath.=','.g:nvim_config_dir
      
      " init.luaをsource
      lua require("config.lazy")
    '';
  };
  
  # neovim の設定ファイルへのシンボリックリンクを作成
  home.activation.linkNvimConfig = lib.hm.dag.entryAfter ["writeBoundary"] ''
    if [ -d ${config.home.homeDirectory}/.config/nvim ]; then
      $DRY_RUN_CMD rm -rf ${config.home.homeDirectory}/.config/nvim
    fi
    $DRY_RUN_CMD mkdir -p ${config.home.homeDirectory}/.config
    $DRY_RUN_CMD ln -sf ${config.home.homeDirectory}/.config/nix-darwin/programs/nvim ${config.home.homeDirectory}/.config/nvim
  '';
}
