{
  meta = {
    scope = "user";
    system = false;
    hm = true;
  };

  home =
    { ... }:
    {
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
