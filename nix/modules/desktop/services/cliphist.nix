{ config, ... }: {
  home-manager.users.${config.nixul.user} = { pkgs, ... }: {
    home.packages = with pkgs; [ cliphist wl-clipboard ];

    services.cliphist.enable = true;
  };
}
