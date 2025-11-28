{
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../global/system
  ];

  networking.hostName = "laptop";

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.sultonov = {
      imports = [
        ../../global/home
      ];

      home.username = "sultonov";
      home.homeDirectory = "/home/sultonov/";
    };

    extraSpecialArgs = { inherit inputs; };
  };
}
