{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system =
    { pkgs, ... }:
    {
      xdg.portal.enable = true;
      xdg.portal.extraPortals = [
        pkgs.xdg-desktop-portal-wlr
        pkgs.xdg-desktop-portal-gtk
      ];
    };
}
