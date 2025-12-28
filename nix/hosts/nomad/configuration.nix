{
  inputs,
  user,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../global/system
  ];

  networking.hostName = "nomad";

  home-manager = {
    users.${user} = {
      imports = [
        ../../global/home
      ];

      home.username = user;
    };

    extraSpecialArgs = { inherit inputs user; };
  };
}
