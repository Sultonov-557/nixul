{
  lib,
  ...
}:
{
  system =
    { cfg, ... }:
    {
      virtualisation.podman = lib.mkIf cfg.enable {
        enable = true;
      };

    };}
