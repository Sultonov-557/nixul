{ lib, ... }:
{
  home =
    { cfg, ... }:
    {
      programs.khal = lib.mkIf cfg.enable {
        enable = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable khal";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
