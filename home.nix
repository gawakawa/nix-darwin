{ config, lib, pkgs,  ... }:
{
    home = rec {
        username = "kawa";
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
        ./zsh.nix
        ./git.nix
        ./direnv.nix
        ./wezterm.nix
        ./neovim.nix
        ./starship.nix
    ];
}
