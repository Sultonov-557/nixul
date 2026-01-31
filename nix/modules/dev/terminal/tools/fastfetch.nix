{ config, ... }: {

  home-manager.users.${config.nixul.user} = {

    programs.fastfetch = {
      enable = true;

      settings = { };
    };
  };
}
