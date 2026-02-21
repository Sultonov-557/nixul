{ lib, ... }:
{
  options = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable cursor";
    };
  };

  home =
    { cfg, pkgs, ... }:
    {
      home.packages = lib.mkIf cfg.enable [ pkgs.cursor-cli ];
    };
}
