{
  meta = {
    scope = "host";
    system = true;
    hm = true;
  };

  system =
    { pkgs, ... }:
    {
      stylix = {
        base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-hard.yaml";

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
          dark = "${pkgs.papirus-icon-theme}/share/icons/Papirus-Dark";
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

          sizes = {
            applications = 11;
            terminal = 12;
            desktop = 10;
            popups = 10;
          };
        };
      };
    };

  home = _: {
    programs.nixvim.colorschemes.gruvbox.enable = true;
  };
}
