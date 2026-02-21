{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      zramSwap = lib.mkIf cfg.enable {
        enable = true;
        memoryPercent = 50;
      };

      services.zram-generator = lib.mkIf cfg.enable {
        enable = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable zram";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
