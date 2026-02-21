{ lib, ... }:
{
  home =
    { cfg, ... }:
    {
      programs.direnv = lib.mkIf cfg.enable {
        enable = true;
        nix-direnv.enable = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable direnv";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
