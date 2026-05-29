{
  lib,
  ...
}:

{
  system =
    { cfg, ... }:
    {
      services.xserver.displayManager.gdm.enable = lib.mkIf cfg.enable true;
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
