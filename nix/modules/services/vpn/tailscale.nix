{ lib, pkgs, ... }:
{
  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [
        tailscale
      ]);

      services.tailscale = lib.mkIf cfg.enable {
        enable = true;
      };
    };}
