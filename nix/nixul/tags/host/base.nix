{
  nixul.host.modules = {
    core.system = {
      boot.grub.enable = true;
      nix.nix.enable = true;
      identity.user.enable = true;
    };
  };
}
