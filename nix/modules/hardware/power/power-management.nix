{
  meta = {
    scope = "host";
    system = false;
    hm = true;
  };

  home =
    {
      powerManagement = {
        enable = true;
        cpuFreqGovernor = "schedutil";
      };
    };
}
