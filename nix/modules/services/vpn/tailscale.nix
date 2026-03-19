{ lib, pkgs, ... }:
{
  metadata = {
    name = "tailscale";
    description = "Module for `services.vpn.tailscale`.";
    purpose = "Configure `services.vpn.tailscale` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "services"
      "vpn"
      "tailscale"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [
        tailscale
      ]);

      services.tailscale = lib.mkIf cfg.enable {
        enable = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable tailscale";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
