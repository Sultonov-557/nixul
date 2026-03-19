{ lib, pkgs, ... }:
{
  metadata = {
    name = "biome";
    description = "Module for `dev.tools.quality.biome`.";
    purpose = "Configure `dev.tools.quality.biome` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "dev"
      "tools"
      "quality"
      "biome"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ biome ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable biome";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
