{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      ReplaceWithRegister
      ale
      base16-vim
      editorconfig-vim
      fugitive
      fzf-vim
      fzfWrapper
      nerdtree
      targets-vim
      vim-abolish
      vim-airline
      vim-airline-themes
      vim-better-whitespace
      vim-commentary
      vim-polyglot
      vim-repeat
      vim-surround
      vim-unimpaired
      vim-visual-multi
    ];
    extraConfig = builtins.readFile ./vimrc;
  };
}
