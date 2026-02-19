{ lib, ... }:

let
  t = lib.types;

  argsModule = t.submodule {
    options = {
      cmd = lib.mkOption {
        type = t.nullOr t.str;
        default = null;
        description = "Command to execute.";
      };
      direction = lib.mkOption {
        type = t.nullOr (
          t.enum [
            "l"
            "r"
            "u"
            "d"
          ]
        );
        default = null;
        description = "Direction (l/r/u/d).";
      };
      amount = lib.mkOption {
        type = t.nullOr t.int;
        default = null;
        description = "Optional amount/step (pixels/percent/etc depending on adapter).";
      };
      workspace = lib.mkOption {
        type = t.nullOr (
          t.oneOf [
            t.int
            t.str
          ]
        );
        default = null;
        description = "Workspace target (number or string).";
      };
    };
  };

  # Escape hatches: allow target-specific raw expressions
  rawType = t.submodule {
    options = {
      hyprland = lib.mkOption {
        # allow either a single bind line or multiple
        type = t.nullOr (t.either t.str (t.listOf t.str));
        default = null;
        description = "Raw Hyprland bind line(s) to append as-is.";
      };

      niri = lib.mkOption {
        # niri config is often structured; let it be attrset or string
        type = t.nullOr (
          t.oneOf [
            t.str
            t.attrs
          ]
        );
        default = null;
        description = "Raw Niri binding config to apply as-is (adapter-defined).";
      };
    };
  };

  keybindSubmodule = t.submodule ({
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
        type = t.enum [
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

      # Action-specific args (union of shapes), plus optional raw per-target overrides
      args = lib.mkOption {
        type = t.nullOr argsModule;
        default = null;
        description = "Action-specific arguments (shape depends on action).";
      };

      repeat = lib.mkOption {
        type = t.bool;
        default = false;
        description = "Repeat/hold behavior (adapter decides exact mapping).";
      };

      mouse = lib.mkOption {
        type = t.bool;
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
  });
in
{
  # TODO: add more adapters
  imports = [
    ./adapters/hyprland.nix
  ];

  options.nixul.keybinds = lib.mkOption {
    type = t.listOf keybindSubmodule;
    default = [ ];
    description = "Universal keybindings (semantic actions + per-target escape hatches).";
  };
}
