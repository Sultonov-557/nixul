{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system =
    { pkgs, ... }:
    {
      environment.defaultPackages = with pkgs; [ via ];
    };
}
