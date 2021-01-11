{ lib, ... }:
{
  programs.starship = {
    enable = true;
    settings = {
      format = lib.concatStrings [
        "$username"
        "$directory"
        "$nix_shell"
        "$git_branch"
        "$git_state"
        "$git_status"
        "$cmd_duration"
        "$jobs"
        "$line_break"
        "$character"
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
        success_symbol = "[λ](bold green)";
        error_symbol = "[λ](bold red)";
        vicmd_symbol = "❮";
        use_symbol_for_status = true;
      };
    };
  };
}
