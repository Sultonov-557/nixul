{
  lib,
  inputs,
  config,
  ...
}:
let
  adapter = import ../../../../nixul/universal/keybinds/adapters/niri;
in

{
  system =
    { cfg, ... }:
    {
      programs.niri.enable = lib.mkIf cfg.enable true;
    };

  home =
    { cfg, user, ... }:
    {
      imports = [
        inputs.niri.homeModules.niri
        ./settings.nix
      ];

      programs.niri.enable = (lib.mkIf cfg.enable true);
      programs.niri.settings = (adapter.mkSettings config.nixul.users.${user}.keybinds);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable niri";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
