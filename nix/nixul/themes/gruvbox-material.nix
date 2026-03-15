{
  system =
    { pkgs, ... }:
    {
      nixul.theme = {
        colors.scheme = "gruvbox-material-dark-hard";

        wallpaper = ../../assets/public/wallpapers/gruvbox.png;

        cursor = {
          package = pkgs.bibata-cursors;
          name = "Bibata-Modern-Classic";
          size = 24;
        };

        opacity = {
          applications = 0.0;
          terminal = 0.0;
          desktop = 0.0;
          popups = 0.0;
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
      programs.nixvim.colorschemes.gruvbox.enable = true;
    };
}
