{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.bcompare;
in
{
  options = {
    programs.bcompare = {
      enable = mkEnableOption "Beyond Compare";

      package = mkOption {
        type = types.package;
        default = pkgs.bcompare;
        example = literalExample "pkgs.bcompare";
        description = ''
          Version of Beyond Compare to install
        '';
      };
    };
  };
  config = mkMerge [
    (mkIf cfg.enable {
      home.packages = [ cfg.package ];
    })
  ];
}
