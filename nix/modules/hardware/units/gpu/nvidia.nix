{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system =
    {
      services.xserver.videoDrivers = [ "nvidia" ];

      hardware.nvidia = {
        modesetting.enable = true;
        powerManagement.enable = false;
        open = false;
        nvidiaSettings = true;
      };

    };
}
