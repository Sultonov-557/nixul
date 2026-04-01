{
  system =
    { pkgs, ... }:
    {
      nixul.theme = {
        colors.scheme = "everforest";

        wallpaper = ../../assets/public/wallpapers/everforest.png;

        cursor = {
          package = pkgs.bibata-cursors;
          name = "Bibata-Modern-Classic";
          size = 24;
        };

        opacity = {
          applications = 0.5;
          terminal = 0.5;
          desktop = 0.5;
          popups = 0.5;
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
      programs.nixvim.colorschemes.everforest = {
        enable = true;
        settings.transparent_background = 1;
      };
    };
}
