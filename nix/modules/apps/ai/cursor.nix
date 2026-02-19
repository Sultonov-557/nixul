{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.cursor-cli ];
    };
}
