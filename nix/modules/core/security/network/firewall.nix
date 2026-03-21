{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      networking.firewall = lib.mkIf cfg.enable {
        enable = true;
        allowedTCPPorts = [
          22
          80
          443
        ];
        allowedUDPPorts = [ ];
      };
    };}
