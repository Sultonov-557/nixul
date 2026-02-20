{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system = _: {
    powerManagement = {
      enable = true;
      cpuFreqGovernor = "schedutil";
    };
  };
}
