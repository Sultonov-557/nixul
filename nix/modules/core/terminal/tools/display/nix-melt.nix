{ lib, pkgs, ... }:
{
  metadata = {
    name = "nix-melt";
    description = "Module for `core.terminal.tools.display.nix-melt`.";
    purpose = "Configure `core.terminal.tools.display.nix-melt` features and defaults.";
    scope = "home";
    status = "active";
    tags = [
      "core"
      "terminal"
      "tools"
      "display"
    ];
  };

  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable (with pkgs; [ nix-melt ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable nix-melt";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
