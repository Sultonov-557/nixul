{ config, ... }:
{
  home-manager.users.${config.nixul.primaryUser} = {
    programs.gh = {
      enable = true;
      gitCredentialHelper = {
        enable = true;
      };
    };
  };
}
