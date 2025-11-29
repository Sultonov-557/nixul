{ ... }:

{
  imports = [
    ../../../modules/home/nixvim.nix
  ];

  home.stateVersion = "24.05";

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

}
