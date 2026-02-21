{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      programs.gamemode.enable = lib.mkIf cfg.enable true;
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable gamemode";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
