{ ... }:
{
  imports = [ ./system.nix ];

  nixul = {
    user = "sultonov";
    email = "sultonovzerifboy@gmail.com";
    hostname = "nomad";
    enableAllModules = true;

    apps = {
      ai = {
        codex = true;
        opencode = true;
      };
      gaming = {
        compatibility = {
          wine = true;
        };
        games = {
          minecraft = true;
        };
        platform = {
          gamemode = true;
          gamescope = true;
          lutris = true;
          steam = true;
        };
      };
    };

    core = { };
    desktop = { };
    dev = { };
    hardware = { };
    services = { };

  };
}
