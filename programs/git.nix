{
  programs.git = {
    enable = true;

    extraConfig = {
      core = {
        editor = "nvim";
      };

      pull.rebase = "false";
    };
  };
}
