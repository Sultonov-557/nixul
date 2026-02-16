{ pkgs, config, ... }:
{
  home-manager.users.${config.nixul.user} = {
    home.packages = with pkgs; [
      cliphist
      wl-clipboard
    ];

    services.cliphist.enable = true;
  };
}
