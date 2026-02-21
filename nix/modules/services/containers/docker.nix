{ lib, ... }:
{
  system =
    { cfg, config, ... }:
    {
      virtualisation.docker = lib.mkIf cfg.enable {
        enable = true;
        enableOnBoot = true;
      };

      users.users.${config.nixul.primaryUser}.extraGroups = lib.mkIf cfg.enable [ "docker" ];
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable docker";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
