{
  meta = {
    scope = "user";
    hm = true;
    system = false;
  };

  home =
    { pkgs, ... }:
    {
      home.packages = [
        pkgs.cliphist
        pkgs.wl-clipboard
      ];

      services.cliphist.enable = true;
    };
}
