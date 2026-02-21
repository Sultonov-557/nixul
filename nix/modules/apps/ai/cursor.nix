{ lib, ... }:
{

  home =
    { cfg, pkgs, ... }:
    {
      home.packages = lib.mkIf cfg.enable [ pkgs.cursor-cli ];
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable cursor";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
