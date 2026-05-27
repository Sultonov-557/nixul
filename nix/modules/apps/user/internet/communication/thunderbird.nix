{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      programs.thunderbird = lib.mkIf cfg.enable {
        enable = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable thunderbird";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
