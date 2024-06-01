{ lib, pkgs,  ... }:
{
    home = rec {
        username = "kawa";
        homeDirectory = lib.mkForce "/Users/${username}";
        enableNixpkgsReleaseCheck = true;
        stateVersion = "24.05";
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
        ./direnv.nix
    ];
}