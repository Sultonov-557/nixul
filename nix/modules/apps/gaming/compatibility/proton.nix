{ lib, pkgs, ... }:
{
  metadata = {
    name = "proton";
    description = "Module for `apps.gaming.compatibility.proton`.";
    purpose = "Configure `apps.gaming.compatibility.proton` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "apps"
      "gaming"
      "compatibility"
      "proton"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (
        with pkgs;
        [
          protonup-qt
          protontricks
        ]
      );
    };

  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable (
        with pkgs;
        [
          protonup-qt
          protontricks
        ]
      );
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable proton";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
