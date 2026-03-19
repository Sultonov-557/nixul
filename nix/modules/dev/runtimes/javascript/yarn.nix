{ lib, pkgs, ... }:
{
  metadata = {
    name = "yarn";
    description = "Module for `dev.runtimes.javascript.yarn`.";
    purpose = "Configure `dev.runtimes.javascript.yarn` features and defaults.";
    scope = "home";
    status = "active";
    tags = [
      "dev"
      "runtimes"
      "javascript"
      "yarn"
    ];
  };

  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable (with pkgs; [ yarn ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable yarn";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
