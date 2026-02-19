{ config, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  home-manager.users.${config.nixul.primaryUser}.imports = [ ./home.nix ];
}
