{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../users/sultonov
  ];

  nixul = {
    host = {
      name = "nomad";
      timezone = "Asia/Tashkent";
    };

    apps = {
      ai = {
        codex.enable = true;
      };
    };
  };
}
