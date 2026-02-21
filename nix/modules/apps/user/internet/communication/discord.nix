{ lib, ... }:
{
  home =
    { cfg, inputs, ... }:
    {
      imports = [ inputs.nixcord.homeModules.nixcord ];

      programs.nixcord = lib.mkIf cfg.enable {
        enable = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable discord (nixcord)";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
