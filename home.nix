{ config, lib, pkgs,  ... }:
{
  home = rec {
    username = "iota";
    homeDirectory = lib.mkForce "/Users/${username}";
    enableNixpkgsReleaseCheck = true;
    stateVersion = "24.11";
    packages = with pkgs; [
      curl
      vscode
      idris2
    ];
  };
  programs.home-manager.enable = true;

  imports = [
    ./programs/zsh.nix
    ./programs/direnv.nix
    ./programs/git.nix
    ./programs/wezterm.nix
    ./programs/neovim.nix
    ./programs/starship.nix
  ];
}
