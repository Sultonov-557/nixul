{ ... }:
{
  imports = [ ./system.nix ];

  nixul = {
    user = "sultonov";
    email = "sultonovzerifboy@gmail.com";
    hostname = "nomad";

    apps = {
      ai = {
        codex = true;
      };
    };
  };
}
