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
    };
  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable (with pkgs; [
        tailscale
      ]);
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
