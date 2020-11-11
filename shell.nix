let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs { };
  home-manager = import sources.home-manager { inherit pkgs; };
in
pkgs.mkShell {
  buildInputs = [
    home-manager.home-manager
    pkgs.niv
  ];

  shellHook = ''
    export NIX_PATH="nixpkgs=${sources.nixpkgs}:home-manager=${sources."home-manager"}"
    export HOME_MANAGER_CONFIG="$HOME/dotfiles/home.nix"
    alias nix-repl="nix repl '<nixpkgs>'"
  '';
}
