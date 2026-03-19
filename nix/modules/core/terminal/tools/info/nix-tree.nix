{ lib, pkgs, ... }:
{
  metadata = {
    name = "nix-tree";
    description = "Module for `core.terminal.tools.info.nix-tree`.";
    purpose = "Configure `core.terminal.tools.info.nix-tree` features and defaults.";
    scope = "home";
    status = "active";
    tags = [
      "core"
      "terminal"
      "tools"
      "info"
    ];
  };

  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable (
        with pkgs;
        [
          nix-tree
        ]
      );
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable nix-tree";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
