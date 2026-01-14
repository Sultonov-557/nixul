{ config, ... }: {
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
  };

  users.users.${config.nixul.user}.extraGroups = [ "docker" ];
}
