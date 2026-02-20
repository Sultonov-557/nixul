{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system =
    {
      hardware.cpu.intel.updateMicrocode = true;
    };
}
