{ lib, ... }:
{
  metadata = {
    name = "redis";
    description = "Module for `services.databases.redis`.";
    purpose = "Configure `services.databases.redis` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "services"
      "databases"
      "redis"
    ];
  };

  system =
    { cfg, ... }:
    {
      services.redis.servers."" = lib.mkIf cfg.enable {
        enable = true;
        port = 6379;
        bind = "127.0.0.1";
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable redis";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
