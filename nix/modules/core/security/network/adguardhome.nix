{ lib, ... }:
{
  system =
    { cfg, config, ... }:
    {
      services.adguardhome = lib.mkIf cfg.enable {
        enable = true;
        mutableSettings = true;
        port = 9000;

        settings = {
          http = {
            address = "127.0.0.1:9000";
          };
          dns = {
            port = 53;
            upstream = [
              (if config.services.unbound.enable then "127.0.0.1:5335" else "1.1.1.1")
            ];
          };
        };
      };
      networking.nameservers = lib.mkIf cfg.enable [
        "127.0.0.1"
      ];
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable adguardhome";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
