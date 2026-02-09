{ config, ... }:
{
  home-manager.users.${config.nixul.user} = {
    programs.gemini-cli = {
      enable = true;
      settings = { };
    };
  };
}
