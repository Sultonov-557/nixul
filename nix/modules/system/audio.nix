{ config, pkgs, ... }:

{
  security.rtkit.enable = true;
  environment.defaultPackages = with pkgs; [
    brightnessctl
    pamixer
    playerctl
  ];

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    wireplumber.enable = true;
  };

  home-manager.users.${config.nixul.user} = {
    services.easyeffects.enable = true;

    home.packages = with pkgs; [
      pavucontrol
      pulsemixer
    ];
  };

}
