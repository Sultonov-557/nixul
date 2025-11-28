{
  config,

  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../global/system
  ];

  networking.hostName = "nixos";

  # Hardware-specific configurations
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.uinput.enable = true;
  hardware.enableAllFirmware = true;
  zramSwap.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;

  # XServer configuration
  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  # NVIDIA Configuration
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Home-manager configuration
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.sultonov = {
      imports = [
        ../../global/home
      ];

      home.username = "sultonov";
      home.homeDirectory = "/home/sultonov";
    };

    extraSpecialArgs = { inherit inputs; };
  };
}
