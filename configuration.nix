{
  pkgs,
  self,
  nixpkgs,
  ...
}:
{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    awscli2
    bat
    claude-code
    direnv
    discord
    fd
    gh
    gitmoji-cli
    google-chrome
    google-cloud-sdk
    httpie
    neofetch
    nixfmt-rfc-style
    qemu
    rlwrap
    slack
    starship
    stylua
    tart
    tree
    treefmt
    utm
  ];

  homebrew = {
    enable = true;
    onActivation.cleanup = "uninstall";

    taps = [ ];
    brews = [
      "gnu-time"
      "mas"
    ];
    casks = [
      "amethyst"
      "claude"
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
      nerd-fonts.fira-code
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

    primaryUser = "iota";
  };

  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = "aarch64-darwin";
  };

  # Define user
  users.users.iota = {
    name = "iota";
    home = "/Users/iota";
  };
}
