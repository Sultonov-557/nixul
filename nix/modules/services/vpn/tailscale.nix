{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        tailscale
      ];

      services.tailscale = {
        enable = true;
      };
    };
}
