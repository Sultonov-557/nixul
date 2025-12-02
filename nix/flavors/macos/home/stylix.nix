{ inputs, ... }:
{
  imports = [ inputs.stylix.homeModules.stylix ];

  stylix = {
    enable = true;
    image = ../assets/wallpaper-light.jpg;
    polarity = "dark";

    targets = {
      gtk.enable = false;
      qt.enable = false;
      rofi.enable = false;
      neovim.enable = false;
      nixvim.enable = false;
      spicetify.enable = false;
    };
  };
}
