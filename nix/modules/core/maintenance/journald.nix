{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      services.journald.extraConfig = lib.mkIf cfg.enable ''
        SystemMaxUse=1G
        SystemKeepFree=2G
        RuntimeMaxUse=256M
        MaxRetentionSec=30day
        Compress=yes
        Seal=yes
      '';
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable journald";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
