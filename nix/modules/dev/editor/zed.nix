{ config, ... }:
{
  home-manager.users.${config.nixul.user} = {
    programs.zed-editor = {
      enable = true;
    };
  };
}
