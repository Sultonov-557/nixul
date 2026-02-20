{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system =
    { ... }:
    {
      services.avahi = {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
      };
    };
}
