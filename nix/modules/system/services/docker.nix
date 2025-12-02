{ ... }:

{
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
  };

  users.users.sultonov.extraGroups = [ "docker" ];
}
