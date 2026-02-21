{ lib, ... }:
{
  home =
    { cfg, ... }:
    {
      programs.ssh = lib.mkIf cfg.enable {
        enable = true;
        enableDefaultConfig = false;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable ssh";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
