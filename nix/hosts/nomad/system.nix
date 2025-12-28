{ user, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../global/system
  ];

  networking.hostName = "nomad";

  home-manager.users.${user}.imports = [ ./home.nix ];
}
