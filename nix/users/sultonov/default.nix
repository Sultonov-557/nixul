{ ... }:
{
  imports = [
    ./keybinds
  ];

  nixul = {
    primaryUser = "sultonov";
    users.sultonov = {
      email = "sultonovzerifboy@gmail.com";

      modules = {
        core.system.nix.nix = {
          enable = true;
        };
      };
    };
  };
}
