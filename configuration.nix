{ pkgs, self, nixpkgs, ... }:
{
    # List packages installed in system profile. To search by name, run:
    # $ nix-env -qaP | grep wget
    environment.systemPackages = with pkgs; [
        awscli2
        colima
        discord
        docker
        docker-compose
        docker-credential-helpers
        fd
        gh
        gitmoji-cli
        google-chrome
        google-cloud-sdk
        httpie
        nushell
        postman
        qemu
        rlwrap
        rustup
        slack
        starship
        tree
        utm
        zoom-us
    ];

    homebrew = {
        enable = true;
        onActivation.cleanup = "uninstall";

        taps = [];
        brews = [
            "ghcup"
            "gnu-time"
            "mas"
        ];
        casks = [
            "claude"
            "cursor"
            "logi-options+"
            "notion"
        ];
        masApps = {
            "LINE" = 539883307;
            "Goodnotes 6" = 1444383602;
            "Kindle" = 302584613;
        };
    };

    fonts = {
        packages = with pkgs; [
            fira-code
            fira-code-symbols
        ];
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # Auto upgrade nix package and the daemon service.
    services.nix-daemon.enable = true;
    nix.package = pkgs.nix;

    # Necessary for using flakes on this system.
    nix = {
        settings = {
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

        optimise.automatic = true;
    };

    # Create /etc/zshrc that loads the nix-darwin environment.
    programs.zsh.enable = true;

    system = {
        # Set Git commit hash for darwin-version.
        configurationRevision = self.rev or self.dirtyRev or null;

        # Used for backwards compatibility, please read the changelog before changing.
        # $ darwin-rebuild changelog
        stateVersion = 4;
    };

    # The platform the configuration will be used on.
    nixpkgs.hostPlatform = "aarch64-darwin";
}
