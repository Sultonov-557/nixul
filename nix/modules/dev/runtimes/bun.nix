{ pkgs, config, ... }: {

  home-manager.users.${config.nixul.user} = {
    programs.bun = { enable = true; };

    home.packages = with pkgs; [ bun ];
  };
}
