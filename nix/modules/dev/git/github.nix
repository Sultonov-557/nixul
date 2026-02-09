{ config, ... }:
{
  home-manager.users.${config.nixul.user} = {
    programs.gh = {
      enable = true;
      gitCredentialHelper = {
        enable = true;
      };
    };
  };
}
