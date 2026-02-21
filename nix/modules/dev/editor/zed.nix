{ lib, ... }:
{
  home =
    { cfg, ... }:
    {
      programs.zed-editor = lib.mkIf cfg.enable {
        enable = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable zed";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
