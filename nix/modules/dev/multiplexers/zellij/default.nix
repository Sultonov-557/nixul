{ lib, pkgs, ... }:
{
  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable [
        pkgs.zellij
      ];
    };

  home =
    { cfg, ... }:
    {
      programs.zellij = lib.mkIf cfg.enable {
        enable = true;
      };

      xdg.configFile."zellij/config.kdl".source = ./zellij.kdl;
    };
  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable zellij";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
