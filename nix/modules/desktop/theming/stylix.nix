{ lib, inputs, ... }:
{
  system =
    { cfg, ... }:
    {
      imports = [ inputs.stylix.nixosModules.stylix ];
      stylix.enable = lib.mkIf cfg.enable true;
    };

  home =
    { cfg, ... }:
    {
      imports = [ inputs.stylix.homeModules.stylix ];
      stylix.targets.nixvim.enable = lib.mkIf cfg.enable false;
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable stylix";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
