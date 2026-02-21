{ lib, pkgs, ... }:
{
  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [ qmk ]);
      hardware.keyboard.qmk = lib.mkIf cfg.enable {
        enable = true;
        keychronSupport = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable qmk";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
