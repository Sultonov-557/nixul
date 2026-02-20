{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system =
    {
      hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
      };
    };
}
