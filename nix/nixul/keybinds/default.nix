{ lib, ... }:

let
  argsModule = import ./types/args.nix { inherit lib; };
  rawType = import ./types/raw.nix { inherit lib; };
  keybindSubmodule = import ./types/keybind.nix {
    inherit
      lib
      argsModule
      rawType
      ;
  };
in
{
  imports = [
    ./adapters/hyprland
  ];

  options.nixul.keybinds = lib.mkOption {
    type = lib.types.listOf keybindSubmodule;
    default = [ ];
    description = "Universal keybindings (semantic actions + per-target escape hatches).";
  };
}
