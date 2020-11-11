{ pkgs, ... }:
let
  inherit (pkgs) vscode-extensions;
  inherit (pkgs.vscode-utils) buildVscodeMarketplaceExtension;

  editorconfig.editorconfig = buildVscodeMarketplaceExtension {
    mktplcRef = {
      name = "EditorConfig";
      publisher = "EditorConfig";
      version = "0.16.3";
      sha256 = "1gc1r1df6rr22aakc5ncc57j0zwyfls7dwmxjwg2ygyr66m5zln6";
    };
  };
  ionide.ionide-fsharp = buildVscodeMarketplaceExtension {
    mktplcRef = {
      name = "Ionide-fsharp";
      publisher = "Ionide";
      version = "4.17.0";
      sha256 = "1z1bdrbybnx3i4x461dbzz0a4p5v2rndszm7dwk1sqv6j8fixc4b";
    };
  };
  ms-dotnettools.csharp = buildVscodeMarketplaceExtension {
    mktplcRef = {
      name = "csharp";
      publisher = "ms-dotnettools";
      version = "1.23.6";
      sha256 = "0dc0krp5z8ayk59jhm1n91lldwgr7a8f6al8h5m75kl7q4ib7rlk";
    };
  };
  sbrink.elm = buildVscodeMarketplaceExtension {
    mktplcRef = {
      name = "elm";
      publisher = "sbrink";
      version = "0.26.0";
      sha256 = "0lcjjq710lrarzswidi7yhiyfa96byi9qd146pzjmpxggkj2jmw5";
    };
  };
in
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.Nix
      editorconfig.editorconfig
      ionide.ionide-fsharp
      ms-dotnettools.csharp
      sbrink.elm
      vscodevim.vim
    ];
  };
}
