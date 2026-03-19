{ lib, pkgs, ... }:
{
  metadata = {
    name = "user";
    description = "Module for `core.system.identity.user`.";
    purpose = "Configure `core.system.identity.user` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "core"
      "system"
      "identity"
      "user"
    ];
  };

  system =
    { cfg, config, ... }:
    let
      userCfg = config.nixul.users.${config.nixul.primaryUser};
      shellPkg =
        if userCfg.shell == "bash" then
          pkgs.bashInteractive
        else if userCfg.shell == "zsh" then
          pkgs.zsh
        else
          pkgs.fish;
    in
    {
      users.users.${config.nixul.primaryUser} = lib.mkIf cfg.enable {
        isNormalUser = true;
        description = config.nixul.primaryUser;
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
        ignoreShellProgramCheck = true;
        shell = shellPkg;
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
