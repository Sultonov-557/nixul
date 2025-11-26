{
  config,
  pkgs,
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

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  services.blueman.enable = true;

  # NVIDIA Configuration
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = false;

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
