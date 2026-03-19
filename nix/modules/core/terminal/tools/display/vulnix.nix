{ lib, pkgs, ... }:
{
  metadata = {
    name = "vulnix";
    description = "Module for `core.terminal.tools.display.vulnix`.";
    purpose = "Configure `core.terminal.tools.display.vulnix` features and defaults.";
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
      home.packages = lib.mkIf cfg.enable (with pkgs; [ vulnix ]);
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
