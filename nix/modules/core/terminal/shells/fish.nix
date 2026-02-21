{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      programs.fish.enable = lib.mkIf cfg.enable true;
    };

  home =
    { cfg, ... }:
    {
      programs.fish = lib.mkIf cfg.enable {
        enable = true;
        shellInit = "set -U fish_greeting";
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
