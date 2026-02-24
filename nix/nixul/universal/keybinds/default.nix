{ lib, ... }:

let
  keybindSubmodule = import ./types/keybind.nix;
in
{
  imports = [
    ./adapters/hyprland
    ./adapters/niri
  ];

  options.nixul.keybinds = lib.mkOption {
    type = lib.types.listOf keybindSubmodule;
    default = [ ];
    description = "Universal keybindings (semantic actions + per-target escape hatches).";
  };
}
