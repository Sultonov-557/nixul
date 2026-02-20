{
  meta = {
    scope = "user";
    system = true;
    hm = false;
  };

  system =
    { config, ... }:
    {
      home-manager.users.${config.nixul.primaryUser} = {
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
    };
}
