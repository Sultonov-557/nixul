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
    };}
