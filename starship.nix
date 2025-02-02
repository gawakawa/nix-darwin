{
    programs.starship = {
        enable = true;
        settings = {
            add_newline = true;

            directory = {
                truncation_length = 0;
                truncate_to_repo = false;
                home_symbol = "~";
            };

            time = {
                disabled = false;
                style = "bold yellow";
                format = "🕐$time";
                time_format = "%H:%M";
            };

            cmd_duration = {
                style = "bold red";
                format = "took [$duration](bold yellow) ";
                min_time = 2000;
            };

            character = {
                success_symbol = "[λ](bold green)";
                error_symbol = "[λ](bold red)";
            };

            modules = [
              "directory"
              "git_branch"
              "git_status"
              "cmd_duration"
              "line"
              "time"
              "character"
            ];

            format = "$directory$git_branch$git_status$cmd_duration$fill $time\n$character";

            fill = {
              symbol = "─";
              style = "bold blue";
            };
        };
    };
}