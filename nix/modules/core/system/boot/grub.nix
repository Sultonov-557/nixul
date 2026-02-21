{ lib, pkgs, ... }:
{
  system =
    { cfg, ... }:
    {
      boot = lib.mkIf cfg.enable {
        loader = {
          grub = {
            enable = true;
            useOSProber = true;
            efiSupport = true;
            device = "nodev";
            configurationLimit = 15;
          };
          efi = {
            canTouchEfiVariables = true;
            efiSysMountPoint = "/boot";
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
          default = true;
          description = "Enable grub";
        };
      };
    };
    default = {
      enable = true;
    };
  };
}
