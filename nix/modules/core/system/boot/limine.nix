{ lib, pkgs, ... }:
{
  system =
    { cfg, ... }:
    {
      boot = lib.mkIf cfg.enable {
        loader = {
          limine = {
            enable = true;
          };
        };
        kernelPackages = pkgs.linuxPackages_latest;
        kernelModules = [ "uinput" ];
        supportedFilesystems = [ "ntfs" ];
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          description = "Enable limine";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
