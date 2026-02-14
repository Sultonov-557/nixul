{
  zramSwap = {
    enable = true;
    memoryPercent = 50;
  };

  services.zram-generator = {
    enable = true;
  };
}
