{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      imports = [
        ./settings.nix
      ];
      services.glance.enable = lib.mkIf cfg.enable true;
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable glance";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
