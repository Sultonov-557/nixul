{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system =
    {
      networking.wireguard.enable = true;
    };
}
