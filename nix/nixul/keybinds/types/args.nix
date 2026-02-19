{ lib }:

lib.types.submodule {
  options = {
    cmd = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = "Command to execute.";
    };
    direction = lib.mkOption {
      type = lib.types.nullOr (
        lib.types.enum [
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
      type = lib.types.nullOr lib.types.int;
      default = null;
      description = "Optional amount/step (pixels/percent/etc depending on adapter).";
    };
    workspace = lib.mkOption {
      type = lib.types.nullOr (
        lib.types.oneOf [
          lib.types.int
          lib.types.string
        ]
      );
      default = null;
      description = "Workspace target (number or string).";
    };
  };
}
