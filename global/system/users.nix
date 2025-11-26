{ config, pkgs, ... }:

{
  users.users.sultonov = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };
}
