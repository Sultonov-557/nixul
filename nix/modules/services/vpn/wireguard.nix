{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system = _: {
    networking.wireguard.enable = true;
  };
}
