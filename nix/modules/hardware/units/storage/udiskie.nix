{
  meta = {
    scope = "user";
    system = false;
    hm = true;
  };

  home =
    { ... }:
    {
      services.udiskie = {
        enable = true;
        automount = true;
        notify = true;
        tray = "never";
      };
    };
}
