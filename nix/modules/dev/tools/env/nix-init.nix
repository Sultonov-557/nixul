{ lib, ... }:
{
  home =
    { cfg, ... }:
    {
      programs.nix-init = lib.mkIf cfg.enable {
        enable = true;
      };
    };
  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable nix-init";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
