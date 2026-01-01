{
  lib,
  config,
  ...
}:
let
  cfg = config.modules.system.services.virtualisation.docker;
in
{
  options.modules.system.services.virtualisation.docker = {
    enable = lib.mkEnableOption "docker";
  };

  config = lib.mkIf cfg.enable {
    virtualisation.docker = {
      enable = true;
      enableOnBoot = true;
    };

    users.users.${config.nixul.user}.extraGroups = [ "docker" ];
  };
}
