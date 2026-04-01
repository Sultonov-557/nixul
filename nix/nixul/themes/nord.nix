{
  system =
    { pkgs, ... }:
    {
      nixul.theme = {
        colors.scheme = "nord";

        wallpaper = ../../assets/public/wallpapers/nord.png;

        cursor = {
          package = pkgs.bibata-cursors;
          name = "Bibata-Modern-Classic";
          size = 24;
        };

        opacity = {
          applications = 0.7;
          terminal = 0.7;
          desktop = 0.7;
          popups = 0.7;
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
      programs.nixvim.colorschemes.nord = {
        enable = true;
        settings.disable_background = true;
      };
    };
}
