{ config, ... }: {

  home-manager.users.${config.nixul.user} = {
    programs.btop = {
      enable = true;
      settings = {
        theme_background = false;
        vim_keys = true;
      };
    };
  };
}
