{ config, ... }:
{
  home-manager.users.${config.nixul.primaryUser} = {
    programs.btop = {
      enable = true;
      settings = {
        theme_background = false;
        vim_keys = true;
      };
    };
  };
}
