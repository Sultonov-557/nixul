{
  system =
    { pkgs, ... }:
    {
      nixul.theme = {
        colors.scheme = "catppuccin-mocha";

        wallpaper = ../../assets/public/wallpapers/catppuccin.png;

        cursor = {
          package = pkgs.bibata-cursors;
          name = "Bibata-Modern-Classic";
          size = 24;
        };

        opacity = {
          applications = 0.9;
          terminal = 0.8;
          desktop = 1.0;
          popups = 0.9;
        };

        icons = {
          package = pkgs.papirus-icon-theme;
          name = "Papirus-Dark";
        };

        fonts = {
          monospace = {
            package = pkgs.jetbrains-mono;
            name = "JetBrains Mono";
          };
          sansSerif = {
            package = pkgs.inter;
            name = "Inter";
          };
          serif = {
            package = pkgs.inter;
            name = "Inter";
          };
        };
      };
    };

  home =
    { ... }:
    {
      programs.nixvim.colorschemes.catppuccin.enable = true;
      programs.nixvim.colorschemes.catppuccin.settings.flavour = "mocha";
    };
}
