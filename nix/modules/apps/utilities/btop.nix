{ config, ... }: {
  home-manager.users.${config.nixul.user} = { inputs, ... }: {
    programs.btop = {
      enable = true;
      settings = {
        theme_background = false;
        vim_keys = true;
      };
    };
  };
}
