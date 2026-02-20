{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [ qmk ];
      hardware.keyboard.qmk = {
        enable = true;
        keychronSupport = true;
      };
    };
}
