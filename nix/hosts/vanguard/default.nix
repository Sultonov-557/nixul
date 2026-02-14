{ ... }:
{
  imports = [ ./system.nix ];

  nixul = {
    user = "sultonov";
    email = "sultonovzerifboy@gmail.com";
    hostname = "vanguard";

    apps = {
      ai = {
        codex = true;
      };
    };
  };
}
