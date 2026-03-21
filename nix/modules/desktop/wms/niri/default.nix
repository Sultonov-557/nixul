{
  lib,
  inputs,
  config,
  ...
}:
let
  adapter = import ../../../lib/keybinds-niri.nix { inherit lib; };
in
{

  system =
    { cfg, ... }:
    {
      programs.niri.enable = lib.mkIf cfg.enable true;
    };

  home =
    { cfg, user, nixul, ... }:
    {
      imports = [
        inputs.niri.homeModules.niri
        ./settings.nix
      ];

      programs.niri.enable = (lib.mkIf cfg.enable true);
      programs.niri.settings.binds = (adapter.mkSettings nixul.users.${user}.keybinds);
    };
}
