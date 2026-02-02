{ inputs, pkgs, config, ... }: {

  imports = [ inputs.stylix.nixosModules.stylix ];

  home-manager.users.${config.nixul.user} = {
    stylix.targets = { nixvim = { enable = false; }; };
  };

  stylix = {
    enable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark.yaml";

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
