{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      v = "nvim";
      c = "claude";
      lmk = "latexmk -pvc -c";
      idris2 = "rlwrap idris2 -p contrib";
      ls = "ls -A";
      nrs = "darwin-rebuild switch --flake \"$HOME/.config/nix-darwin#mac\""; # update nix config
      nsh = "nix-shell";
    };
    initContent = ''
      export PATH=$HOME/.deno/bin:$PATH
      export PATH=$HOME/.local/bin:$PATH
      export PATH=$HOME/.pack/bin:$PATH
      export PATH=$HOME/.ghcup/bin:$PATH
      export PATH=/opt/homebrew/bin:$PATH
      export NIX_PATH=$HOME/.nix-defexpr/channels:$NIX_PATH

      mkcd() {
          mkdir -p "$1" && cd "$1"
      }
    '';
    prezto = {
      enable = true;
      # prompt.theme = "pure";
      pmodules = [
        "environment"
        "terminal"
        "editor"
        "history"
        "directory"
        "spectrum"
        "utility"
        "completion"
        "syntax-highlighting"
        "history-substring-search"
        "autosuggestions"
        "prompt"
      ];
    };
  };
}
