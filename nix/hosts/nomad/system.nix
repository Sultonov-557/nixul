{ config, ... }:

{
  imports = [ ./hardware-configuration.nix ../../modules/system ];

  networking.hostName = "nomad";

  home-manager.users.${config.nixul.user}.imports = [ ./home.nix ];
}
