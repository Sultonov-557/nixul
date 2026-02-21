{ lib, inputs, ... }:
{
  system =
    { cfg, ... }:
    {
      programs.niri.enable = lib.mkIf cfg.enable true;
    };

  home =
    { cfg, ... }:
    {
      imports = [
        inputs.niri.homeModules.niri
        ./keybinds.nix
        ./settings.nix
      ];

      programs.niri.enable = lib.mkIf cfg.enable true;
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable niri";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
