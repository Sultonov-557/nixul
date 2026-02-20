{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system = _: {
    hardware.cpu.amd.updateMicrocode = true;
  };
}
