{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = (import ./packages/overlays.nix);

  imports = [
    ./modules/bcompare
    ./programs/alacritty.nix
    ./config/apps.nix
    ./programs/bash
    ./programs/bat.nix
    ./programs/bcompare
    ./programs/fzf.nix
    ./programs/git
    ./programs/jq.nix
    ./programs/starship.nix
    ./programs/tmux
    ./programs/vim
  ];

  home.username = builtins.getEnv "USER";
  home.homeDirectory = builtins.getEnv "HOME";

  home.stateVersion = "23.05";
  home.packages = with pkgs; [
    bash-completion
    bashInteractive
    delta
    eza
    fd
    nixpkgs-fmt
    ripgrep
    wget
  ];

  home.file.".config/base16-shell" = {
    source = builtins.fetchTarball {
      url = "https://github.com/chriskempson/base16-shell/archive/ce8e1e540367ea83cc3e01eec7b2a11783b3f9e1.tar.gz";
      sha256 = "1yj36k64zz65lxh28bb5rb5skwlinixxz6qwkwaf845ajvm45j1q";
    };
  };

  home.file.".ideavimrc".text = builtins.readFile ./programs/vim/ideavimrc;

  home.file."Library/Fonts/nerd-fonts" =
    let
      customizedNerdFonts = with pkgs;
        [
          (nerdfonts.override {
            fonts = [ "RobotoMono" ];
          })
        ];
    in
    {
      source = builtins.toPath "${builtins.toString customizedNerdFonts}/share/fonts/truetype/NerdFonts";
      recursive = false;
    };
}
