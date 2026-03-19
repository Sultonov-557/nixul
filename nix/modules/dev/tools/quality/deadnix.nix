{ lib, pkgs, ... }:
{
  metadata = {
    name = "deadnix";
    description = "Module for `dev.tools.quality.deadnix`.";
    purpose = "Configure `dev.tools.quality.deadnix` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "dev"
      "tools"
      "quality"
      "deadnix"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [ deadnix ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable deadnix";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
