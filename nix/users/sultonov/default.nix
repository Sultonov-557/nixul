{ ... }:
{
  imports = [
    ./keybinds
  ];

  nixul = {
    primaryUser = "sultonov";
    users.sultonov = {
      email = "sultonovzerifboy@gmail.com";

    };
  };
}
