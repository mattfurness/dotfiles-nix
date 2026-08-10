{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    withRuby = false;
    withPython3 = false;
    plugins = with pkgs.vimPlugins; [
      ReplaceWithRegister
      ale
      base16-vim
      editorconfig-vim
      vim-fugitive
      fzf-vim
      fzf-wrapper
      nerdtree
      targets-vim
      vim-abolish
      vim-airline
      vim-airline-themes
      vim-better-whitespace
      vim-commentary
      vim-gh-line
      vim-polyglot
      vim-repeat
      vim-surround
      vim-unimpaired
      vim-visual-multi
    ];
    extraConfig = builtins.readFile ./vimrc;
  };
}
