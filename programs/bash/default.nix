{ ... }:
{
  programs.bash = {
    enable = true;
    initExtra = ''
      if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
        . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
      fi
      if [ -e '${builtins.getEnv "HOME"}/.nix-profile/etc/profile.d/nix.sh' ]; then
        . '${builtins.getEnv "HOME"}/.nix-profile/etc/profile.d/nix.sh'
      fi

      ${builtins.readFile ./base-16.sh}

      if [ ! -z $BASE16_THEME ]; then
        source ${builtins.fetchTarball {
          url = "https://github.com/fnune/base16-fzf/archive/ef4c386689f18bdc754a830a8e66bc2d46d515ae.tar.gz";
          sha256 = "1hcr9sq3bxnin2b1pn9dzw39ddxsx1a0fr075l62yn9203fvq0hq";
        }}/bash/base16-$BASE16_THEME.config
      fi

      ${import ../git/completion.nix}
      ${import ../tmux/completion.nix}

      [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
      [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

      PATH=$PATH:~/.docker/bin:/opt/homebrew/bin/:~/bin
      NVM_DIR=~/.nvm
      HISTSIZE=10000
      HISTFILESIZE=2000000
      HISTCONTROL=ignoreboth
      HISTIGNORE='ls:ll:ls -alh:pwd:clear:history'
      shopt -s histappend
      shopt -s cmdhist
      shopt -s globstar
      ulimit -S -n 2048

      if [ -f "$HOME/.npmrc" ]; then
        export NPM_TOKEN=$(grep '_authToken=' "$HOME/.npmrc" | cut -d '=' -f2)
      fi
    '';
    shellAliases = {
      cat = "bat";
      fcd = "cd $(fd -t d | fzf)";
      ls = "eza -lag";
      reload = "source ~/.bash_profile";
      rider = "open -na \"Rider.app\" --args";
      uuid = ''uuidgen | tr "[:upper:]" "[:lower:]" | tr -d "\n" | pbcopy'';
      vim = "nvim";
    };
  };
}
