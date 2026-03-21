{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      networking.wireguard.enable = lib.mkIf cfg.enable true;
    };}
