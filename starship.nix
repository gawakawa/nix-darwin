{
    programs.starship = {
        enable = true;
        # Configuration written to ~/.config/starship.toml
        settings = {
            add_newline = false;

            character = {
                success_symbol = "[λ](bold green)";
                error_symbol = "[λ](bold red)";
            };

        # package.disabled = true;
        };
    };
}