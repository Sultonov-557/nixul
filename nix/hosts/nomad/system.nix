{ config, ... }:

{
  imports = [ ./hardware-configuration.nix ../../global/system ];

  networking.hostName = "nomad";

  home-manager.users.${config.nixul.user}.imports = [ ./home.nix ];
}
