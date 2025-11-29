{ ... }:

{
  boot = {
    loader = {
      grub2-theme = {
        enable = true;
        theme = "vimix";
        footer = true;
      };
      grub = {
        enable = true;
        useOSProber = true;
        efiSupport = true;
        device = "nodev";
      };
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot";
    };
  };
}
