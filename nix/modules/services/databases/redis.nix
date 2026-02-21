{ lib, ... }:
{
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
