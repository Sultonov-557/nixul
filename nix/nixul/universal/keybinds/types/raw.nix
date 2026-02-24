{ lib }:

lib.types.submodule {
  options = {
    hyprland = lib.mkOption {
      type = lib.types.nullOr (lib.types.either lib.types.str (lib.types.listOf lib.types.str));
      default = null;
      description = "Raw Hyprland bind line(s) to append as-is.";
    };

    niri = lib.mkOption {
      type = lib.types.nullOr (
        lib.types.oneOf [
          lib.types.str
          lib.types.attrs
        ]
      );
      default = null;
      description = "Raw Niri binding config to apply as-is (adapter-defined).";
    };
  };
}
