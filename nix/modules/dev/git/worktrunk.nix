{
  lib,
  pkgs,
  inputs,
  ...
}:
{
  home =
    { cfg, ... }:
    {
      imports = [ inputs.worktrunk.homeModules.default ];

      programs.worktrunk = lib.mkIf cfg.enable {
        enable = true;
        package = pkgs.worktrunk;
        enableBashIntegration = true;
        enableZshIntegration = true;
        enableFishIntegration = true;
        enableNushellIntegration = true;
      };

      home.packages = lib.mkIf cfg.enable (
        with pkgs;
        [
          worktrunk
        ]
      );
    };

  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ worktrunk ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable worktrunk";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
