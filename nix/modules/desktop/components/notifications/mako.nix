{ lib, ... }:
{
  home =
    { cfg, ... }:
    {
      services.mako = lib.mkIf cfg.enable {
        enable = true;

        settings = {
          border-radius = 10;
          border-size = 2;
          width = 350;
          height = 100;
          margin = "10";
          padding = "15";
          default-timeout = 5000;
          anchor = "top-right";
          layer = "overlay";
        };

        extraConfig = ''
          [urgency=high]
          border-color=#FF3B30
          default-timeout=0
        '';
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable mako";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
