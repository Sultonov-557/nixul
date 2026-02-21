{ lib, pkgs, ... }:
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
        shell = pkgs.fish;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = true;
          description = "Enable user";
        };
      };
    };
    default = {
      enable = true;
    };
  };
}
