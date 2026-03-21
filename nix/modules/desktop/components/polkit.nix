{ lib, pkgs, ... }:
{
  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable [ pkgs.lxqt.lxqt-policykit ];
    };}
