{ lib, pkgs,  ... }:
{
    home = rec {
        username = "kawa";
        homeDirectory = lib.mkForce "/Users/${username}";
        enableNixpkgsReleaseCheck = true;
        stateVersion = "23.11";
        packages = with pkgs; [
            curl
            vscode
            idris2
            purescript
        ];
    };
    programs.home-manager.enable = true;

    imports = [
        ./zsh.nix
        ./git.nix
    ];
}