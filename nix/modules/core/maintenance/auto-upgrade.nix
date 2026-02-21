{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      system.autoUpgrade = lib.mkIf cfg.enable {
        enable = true;
        dates = "daily";
        upgrade = false;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable auto-upgrade";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
