{ lib, ... }:
{
  imports = [ ./adapters/hyprland.nix ];

  options.nixul.keybinds = lib.mkOption {
    type = lib.types.listOf (
      lib.types.submodule {
        options = {
          keys = lib.mkOption {
            type = lib.types.either (lib.types.listOf lib.types.str) (
              lib.types.listOf (lib.types.listOf lib.types.str)
            );
            description = ''
              Keys can be a single combo (list of strings) or multiple combos
              (list of list of strings).
            '';
          };

          action = lib.mkOption {
            type = lib.types.str;
            description = "Action to perform.";
            default = "spawn";
          };

          cmd = lib.mkOption {
            type = lib.types.str;
            description = "Command to execute.";
          };

          repeat = lib.mkOption {
            type = lib.types.bool;
            description = "Whether the keybind should be repeated.";
            default = false;
          };

          mouse = lib.mkOption {
            type = lib.types.bool;
            description = "Whether the keybind should be bound to mouse.";
            default = false;
          };
        };
      }
    );
    default = [ ];
    description = ''
      Universal keybindings used by different desktop modules.
      Each entry defines keys and a semantic action.
    '';
  };
}
