{ lib, pkgs, ... }:
{
  system =
    { cfg, nixul, ... }:
    {
      boot = lib.mkIf cfg.enable {
        loader = {
          grub = {
            enable = true;
            useOSProber = true;
            efiSupport = true;
            devices = [ "nodev" ];
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
    };}
