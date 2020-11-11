{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      ale
      base16-vim
      editorconfig-vim
      fugitive
      fzf-vim
      fzfWrapper
      nerdtree
      ReplaceWithRegister
      targets-vim
      vim-airline
      vim-airline-themes
      vim-better-whitespace
      vim-commentary
      vim-polyglot
      vim-repeat
      vim-surround
      vim-unimpaired
    ];
    extraConfig = builtins.readFile ./vimrc;
  };
}
