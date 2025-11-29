{ ... }:

{
  imports = [
    ../../../modules/home/nixvim
  ];

  home.stateVersion = "24.05";

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

}
