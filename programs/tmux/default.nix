{ ... }:
{
  programs.tmux = {
    enable = true;
    extraConfig = ''
      unbind C-b
      set-option -g prefix `
      bind ` send-prefix

      # split panes using | and -
      bind | split-window -h
      bind - split-window -v
      unbind '"'
      unbind %

      # Enable mouse mode (tmux 2.1 and above)
      set -g mouse on

      # don't rename windows automatically
      set-option -g allow-rename off

      # Keep window numbers continuous
      set-option -g renumber-windows on

      # Have escape feel normal in vim
      set -sg escape-time 10

      # Make sure to use load a login terminal so rc files are read correctly
      set-option -g default-command "bash -l"

      # Make sure to use true colors for vim
      set-option -ga terminal-overrides ',xterm-256color:Tc'

    '';
    terminal = "screen-256color";
  };
}
