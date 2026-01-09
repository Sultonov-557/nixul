{
  services.blueman.enable = true;
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    graphics = {
      enable = true;
      enable32Bit = true;
    };
    brillo.enable = true;
  };
}
