{ lib, ... }:
{
  home =
    { cfg, inputs, ... }:
    {
      imports = [ inputs.zen-browser.homeModules.default ];

      programs.zen-browser = lib.mkIf cfg.enable {
        enable = true;

        profiles.default = {
          id = 0;
          isDefault = true;
          name = "Default";

          sine = {
            enable = true;
            mods = [ "Nebula" ];
          };
        };
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable zen-browser";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
