{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      powerManagement = lib.mkIf cfg.enable {
        enable = true;
        cpuFreqGovernor = "schedutil";
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable power-management";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
