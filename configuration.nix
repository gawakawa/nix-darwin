{ pkgs, self, nixpkgs, ... }:
{
    # List packages installed in system profile. To search by name, run:
    # $ nix-env -qaP | grep wget
    environment.systemPackages = with pkgs; [
        vscode
        docker
        utm
        tree
        rlwrap
        awscli2
        sqlite
        slack
        discord
        warp-terminal
        texliveFull
    ];

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # Auto upgrade nix package and the daemon service.
    services.nix-daemon.enable = true;
    nix.package = pkgs.nix;

    # Necessary for using flakes on this system.
    nix = {
        settings = {
            auto-optimise-store = true;
            experimental-features = "nix-command flakes";
        };
        # garbage collection
        gc = {
            automatic = true;
            interval = {
                Day = 7;
            };
            options = "--delete-older-than 7d";
        };
    };

    # Create /etc/zshrc that loads the nix-darwin environment.
    programs.zsh.enable = true;

    # Set Git commit hash for darwin-version.
    system.configurationRevision = self.rev or self.dirtyRev or null;

    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    system.stateVersion = 4;

    # The platform the configuration will be used on.
    nixpkgs.hostPlatform = "aarch64-darwin";
}