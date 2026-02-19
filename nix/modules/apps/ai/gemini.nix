{ config, ... }:
{
  home-manager.users.${config.nixul.primaryUser} = {
    programs.gemini-cli = {
      enable = true;
      settings = { };
    };
  };
}
