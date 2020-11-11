{ ... }:
{
  programs.starship = {
    enable = true;
    settings = {
      prompt_order = [
        "username"
        "directory"
        "nix_shell"
        "git_branch"
        "git_state"
        "git_status"
        "cmd_duration"
        "jobs"
        "line_break"
        "character"
      ];

      git_status = {
        ahead = "↑";
        behind = "↓";
        diverged = "⤮ ";
        staged = "✮";
        modified = " ";
        untracked = "";
      };

      nix_shell = {
        symbol = " ";
        impure_msg = "";
      };

      character = {
        symbol = "λ";
        vicmd_symbol = "❮";
        use_symbol_for_status = true;
      };
    };
  };
}
