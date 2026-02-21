{ lib, ... }:
{
  home =
    { cfg, ... }:
    {
      programs.gh = lib.mkIf cfg.enable {
        enable = true;
        gitCredentialHelper = {
          enable = true;
        };
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable github";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
