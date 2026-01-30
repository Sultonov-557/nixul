{ config, ... }: {
  home-manager.users.${config.nixul.user} = { pkgs, ... }: {
    services.easyeffects.enable = true;

    home.packages = with pkgs; [ pavucontrol pulsemixer ];
  };
}
