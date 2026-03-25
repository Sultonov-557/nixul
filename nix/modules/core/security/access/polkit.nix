{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      security.polkit.enable = lib.mkIf cfg.enable true;
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable polkit";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
