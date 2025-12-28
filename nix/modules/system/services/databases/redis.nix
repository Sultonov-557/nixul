{
  lib,
  config,
  ...
}:
let
  cfg = config.modules.system.services.databases.redis;
in
{
  options.modules.system.services.databases.redis = {
    enable = lib.mkEnableOption "redis";
  };

  config = lib.mkIf cfg.enable {
    services.redis.servers."" = {
      enable = true;
      port = 6379;
      bind = "127.0.0.1";
    };
  };
}
