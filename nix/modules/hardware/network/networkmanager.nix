{ config, ... }:
{
  networking.networkmanager.enable = true;
  networking.hostName = config.nixul.host.name;

}
