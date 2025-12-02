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

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.sultonov = {
      imports = [
        ../../global/home
      ];

      home.username = "sultonov";
    };

    extraSpecialArgs = { inherit inputs; };
  };
}
