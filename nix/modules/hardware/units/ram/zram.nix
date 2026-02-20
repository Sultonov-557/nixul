{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system = _: {
    zramSwap = {
      enable = true;
      memoryPercent = 50;
    };

    services.zram-generator = {
      enable = true;
    };
  };
}
