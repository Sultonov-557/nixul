{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../users/sultonov
  ];

  # TODO: remove later
  boot.loader.grub.devices = [ "nodev" ];

  nixul = {
    host = {
      name = "nomad";
      timezone = "Asia/Tashkent";
    };
  };
}
