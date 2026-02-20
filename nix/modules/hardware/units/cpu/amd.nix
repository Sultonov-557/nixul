{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system =
    {
      hardware.cpu.amd.updateMicrocode = true;
    };
}
