{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./keybinds
  ];

  nixul = {
    primaryUser = "sultonov";
    users.sultonov = {
      email = "sultonovzerifboy@gmail.com";
    };
    host = {
      name = "nomad";
      timezone = "Asia/Tashkent";
    };
  };
}
