{ lib, ... }:
{
  home =
    { cfg, inputs, ... }:
    let
      settings = import ./settings.nix;
    in
    {
      imports = [
        inputs.dms.homeModules.dank-material-shell
        inputs.dms-plugin-registry.modules.default
      ];

      programs.dank-material-shell = lib.mkIf cfg.enable {
        enable = true;

        settings = settings;

        plugins = {
        };
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable Dank Material Shell";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
