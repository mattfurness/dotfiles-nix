{ ... }:
{
  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ./tmux.conf;
    newSession = true;
    terminal = "screen-256color";
  };
}
