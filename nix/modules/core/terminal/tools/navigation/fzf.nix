{ lib, pkgs, ... }:
{
  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable [
        pkgs.fzf
      ];
    };

  home =
    { cfg, ... }:
    {
      programs.fzf = lib.mkIf cfg.enable {
        enable = true;
        enableZshIntegration = true;
        enableFishIntegration = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable fzf";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
