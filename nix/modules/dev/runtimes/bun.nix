{ config, ... }: {
  home-manager.users.${config.nixul.user} = { pkgs, ... }: {
    programs.bun = { enable = true; };

    home.packages = with pkgs; [ bun ];
  };
}
