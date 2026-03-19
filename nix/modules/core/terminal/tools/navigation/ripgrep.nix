{ lib, pkgs, ... }:
{
  metadata = {
    name = "ripgrep";
    description = "Module for `core.terminal.tools.navigation.ripgrep`.";
    purpose = "Configure `core.terminal.tools.navigation.ripgrep` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "core"
      "terminal"
      "tools"
      "navigation"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [ ripgrep ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable ripgrep";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
