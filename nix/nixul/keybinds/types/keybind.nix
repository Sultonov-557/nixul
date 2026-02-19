{
  lib,
  argsModule,
  rawType,
}:

lib.types.submodule ({
  options = {
    keys = lib.mkOption {
      type = lib.types.listOf (lib.types.listOf lib.types.str);

      description = ''
        Keys can be a single combo (list of strings) or multiple combos
        (list of list of strings).
        Convention: last token is the main key, earlier tokens are modifiers.
      '';
      example = [
        "SUPER"
        "Return"
      ];
    };

    action = lib.mkOption {
      type = lib.types.enum [
        "spawn"
        "close"
        "fullscreen"
        "float"
        "focus"
        "resize"
        "movewindow"
        "workspace"
        "movetoworkspace"
        # Future-proof: add more without breaking schemas
      ];
      default = "spawn";
      description = "Semantic action (adapters translate it for each compositor).";
    };

    args = lib.mkOption {
      type = lib.types.nullOr argsModule;
      default = null;
      description = "Action-specific arguments (shape depends on action).";
    };

    repeat = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Repeat/hold behavior (adapter decides exact mapping).";
    };

    mouse = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Mouse binding (adapter decides exact mapping).";
    };

    raw = lib.mkOption {
      type = rawType;
      default = {
        hyprland = null;
        niri = null;
      };
      description = "Escape hatch for target-specific bindings.";
    };
  };
})
