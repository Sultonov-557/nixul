{
  lib,
  config,
  ...
}:
{
  system =
    { cfg, ... }:
    {
      virtualisation.docker = lib.mkIf cfg.enable {
        enable = true;
        enableOnBoot = true;
        rootless = {
          enable = false; # needed for winboat
          setSocketVariable = true;
        };
      };

      users.users.${config.nixul.primaryUser}.extraGroups = lib.mkIf cfg.enable [ "docker" ];
    };}
