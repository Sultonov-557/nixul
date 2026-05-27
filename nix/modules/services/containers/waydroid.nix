{
  lib,
  pkgs,
  ...
}:
{
  system =
    { cfg, ... }:
    {
      virtualisation.waydroid = lib.mkIf cfg.enable {
        enable = true;
      };

      environment.defaultPackages = with pkgs; [
        iptables
        dnsmasq
        lxc
      ];
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable waydroid";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
