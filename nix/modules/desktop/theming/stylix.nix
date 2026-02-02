{ inputs, pkgs, config, ... }: {

  imports = [ inputs.stylix.nixosModules.stylix ];

  home-manager.users.${config.nixul.user} = {
    stylix.targets = { nixvim = { enable = false; }; };
  };

  stylix = {
    enable = true;

    base16Scheme = {
      scheme = "nixul";
      author = "https://github.com/Sultonov-557/nixul";
      base00 = "#1e1e2e"; # base
      base01 = "#181825"; # mantle
      base02 = "#313244"; # surface0
      base03 = "#45475a"; # surface1
      base04 = "#585b70"; # surface2
      base05 = "#cdd6f4"; # text
      base06 = "#f5e0dc"; # rosewater
      base07 = "#b4befe"; # lavender
      base08 = "#f38ba8"; # red
      base09 = "#fab387"; # peach
      base0A = "#f9e2af"; # yellow
      base0B = "#a6e3a1"; # green
      base0C = "#94e2d5"; # teal
      base0D = "#89b4fa"; # blue
      base0E = "#cba6f7"; # mauve
      base0F = "#f2cdcd"; # flamingo
    };
    image = ../../../assets/wallpaper.png;

    polarity = "dark";

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
}
