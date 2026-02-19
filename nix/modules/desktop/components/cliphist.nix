{ pkgs, config, ... }:
{
  home-manager.users.${config.nixul.primaryUser} = {
    home.packages = with pkgs; [
      cliphist
      wl-clipboard
    ];

    services.cliphist.enable = true;
  };
}
