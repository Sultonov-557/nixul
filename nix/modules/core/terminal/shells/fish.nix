{ lib, config, ... }:
{
  metadata = {
    name = "fish";
    description = "Module for `core.terminal.shells.fish`.";
    purpose = "Configure `core.terminal.shells.fish` features and defaults.";
    scope = "shared";
    status = "active";
    tags = [
      "core"
      "terminal"
      "shells"
      "fish"
    ];
  };

  system =
    { cfg, ... }:
    {
      programs.fish.enable = lib.mkIf cfg.enable true;
    };

  home =
    { cfg, ... }:
    let
      aliasesAdapter = import ../../../../nixul/universal/aliases/adapters/default.nix { inherit lib; };
      universalAliases = aliasesAdapter.mkAliases config.nixul.aliases;
    in
    {
      programs.fish = lib.mkIf cfg.enable {
        enable = true;
        shellInit = "set -U fish_greeting";
        shellAliases = universalAliases;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable fish";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
