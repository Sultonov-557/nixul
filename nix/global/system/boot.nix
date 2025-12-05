{ pkgs, ... }:

{

  boot = {
    loader = {
      grub = {
        enable = true;
        useOSProber = true;
        efiSupport = true;
        device = "nodev";
        sortByModificationTime = true;
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
}
