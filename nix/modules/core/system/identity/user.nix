{ config, pkgs, ... }:
{
  users.users.${config.nixul.primaryUser} = {
    isNormalUser = true;
    description = config.nixul.primaryUser;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    ignoreShellProgramCheck = true;
    shell = pkgs.fish;
  };

}
