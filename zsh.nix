{ pkgs, ... }: 
{
    programs.zsh = {
        enable = true;
        shellAliases = {
            v="nvim";
            lmk = "latexmk -pvc -c";
            updatedb = "sudo /usr/libexec/locate.updatedb";
            oj-bundle = "oj-bundle -I $HOME/kyopro/atcoder/cpp/mylib";
            gpp = "g++ -std=c++23 -O2 -Wall -Wextra -Wshadow -g";
            idris2 = "rlwrap idris2 -p contrib";
            oj-t = "fourmolu -i Main.hs && oj t -c 'stack Main.hs'"; # oj test for Haskell
            ls = "ls -A";
            update = "darwin-rebuild switch --flake \".#mac\" --impure"; # update nix config
            nsh = "nix-shell";
            new = "cargo compete new";
            test = "cargo compete test";
            submit = "cargo compete submit";
        };
        initExtra = ''
            export PATH=$HOME/.pack/bin:$PATH
            export NIX_PATH=$HOME/.nix-defexpr/channels:$NIX_PATH

            mkcd() {
                mkdir -p "$1" && cd "$1"
            }
        '';
        prezto = {
            enable = true;
            prompt.theme = "pure";
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