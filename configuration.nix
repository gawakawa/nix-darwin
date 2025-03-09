{ pkgs, self, nixpkgs, ... }:
{
    # List packages installed in system profile. To search by name, run:
    # $ nix-env -qaP | grep wget
    environment.systemPackages = with pkgs; [
        awscli2
        colima
        direnv
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
            "visual-studio-code"
            "wezterm"
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

    # Necessary for using flakes on this system.
    nix = {
        enable = false;
        package = pkgs.nix;
        settings = {
            experimental-features = "nix-command flakes";
        };
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

    nixpkgs = {
        config.allowUnfree = true;
        hostPlatform = "aarch64-darwin";
    };
}
