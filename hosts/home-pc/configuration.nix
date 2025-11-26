{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ../../global/system
  ];

  networking.hostName = "home-pc";

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # NOTE: For real hardware, generate with: nixos-generate-config
  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/boot";
    fsType = "vfat";
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.nixuser = {
      imports = [
        ../../global/home
      ];

      home.username = "sultonov";
      home.homeDirectory = "/home/sultonov/";
    };

    extraSpecialArgs = { inherit inputs; };
  };
}
