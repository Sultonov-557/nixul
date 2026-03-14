{ lib, ... }:
{
  home =
    { cfg, ... }:
    {
      programs.bat = lib.mkIf cfg.enable {
        enable = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable bat";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
