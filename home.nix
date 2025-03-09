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
        ./zsh.nix
        ./direnv.nix
	./git.nix
        ./wezterm.nix
        ./neovim.nix
        ./starship.nix
    ];
}
