{ config, ... }:
{

  home-manager.users.${config.nixul.user} = {
    programs.mpv = {
      enable = true;
      config = {
        hwdec = "auto";
        vo = "gpu";
        profile = "gpu-hq";
        save-position-on-quit = true;
      };
    };
  };
}
