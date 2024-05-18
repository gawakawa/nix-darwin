{ lib, ... }:
{
    home = rec {
        username = "kawa";
        homeDirectory = lib.mkForce "/Users/${username}";
        enableNixpkgsReleaseCheck = true;
        stateVersion = "23.11";
    };
    programs.home-manager.enable = true;

    imports = [
        ./zsh.nix
    ];
}