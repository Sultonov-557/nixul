{ lib, pkgs, ... }:
{
  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable [
        pkgs.zoxide
      ];
    };

  home =
    { cfg, ... }:
    {
      programs.zoxide = lib.mkIf cfg.enable {
        enable = true;
        enableBashIntegration = true;
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
          description = "Enable zoxide";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
