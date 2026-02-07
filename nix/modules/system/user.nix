{ config, pkgs, ... }:
{
  # User Configuration
  users.users.${config.nixul.user} = {
    isNormalUser = true;
    description = config.nixul.user;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    ignoreShellProgramCheck = true;
    shell = pkgs.fish;
  };

}
