{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ../../modules/system ];

  networking.hostName = "nomad";

  environment.defaultPackages = with pkgs; [ acpi ];

  home-manager.users.${config.nixul.user}.imports = [ ./home.nix ];
}
