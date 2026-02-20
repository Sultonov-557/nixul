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
        mesa
      ];
    };
}
