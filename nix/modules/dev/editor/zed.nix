{ config, ... }:
{
  home-manager.users.${config.nixul.primaryUser} = {
    programs.zed-editor = {
      enable = true;
    };
  };
}
