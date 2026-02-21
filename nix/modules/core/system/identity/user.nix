{ lib, ... }:
{
  system =
    { cfg, config, ... }:
    {
      users.users.${config.nixul.primaryUser} = lib.mkIf cfg.enable {
        isNormalUser = true;
        description = config.nixul.primaryUser;
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
        ignoreShellProgramCheck = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          description = "Enable user";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
