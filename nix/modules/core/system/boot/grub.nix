{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system =
    { pkgs, ... }:
    {
      boot = {
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
}
