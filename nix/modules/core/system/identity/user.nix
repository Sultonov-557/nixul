{ lib, pkgs, ... }:
{
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
    };}
