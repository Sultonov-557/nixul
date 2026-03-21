{ lib, pkgs, ... }:
{
  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [ qmk ]);
      hardware.keyboard.qmk = lib.mkIf cfg.enable {
        enable = true;
        keychronSupport = true;
      };
    };}
