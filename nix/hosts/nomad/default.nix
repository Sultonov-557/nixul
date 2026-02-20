{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../users/sultonov
  ];

  nixul.host = {
    name = "nomad";
    timezone = "Asia/Tashkent";

    modules = {
      core.system = {
        boot.grub.enable = true;
        nix.nix.enable = true;
        identity.user.enable = true;
      };
    };
  };

}
