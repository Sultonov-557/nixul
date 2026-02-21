{ lib, ... }:
{
  home =
    { cfg, ... }:
    {
      programs.fastfetch = lib.mkIf cfg.enable {
        enable = true;

        settings = { };
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable fastfetch";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
