{ config, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  networking.hostName = "vanguard";

  home-manager.users.${config.nixul.user}.imports = [ ./home.nix ];
}
