{ lib, pkgs, ... }:
{
  system =
    { cfg, ... }:
    {
      services.printing.drivers = lib.mkIf cfg.enable (with pkgs; [
        hplip
      ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable hplip";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
