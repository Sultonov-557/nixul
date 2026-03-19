{
  lib,
  pkgs,
  inputs,
  ...
}:
{
  metadata = {
    name = "nix-index";
    description = "Module for `core.system.nix.nix-index`.";
    purpose = "Configure `core.system.nix.nix-index` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "core"
      "system"
      "nix"
      "nix-index"
    ];
  };

  system =
    { cfg, ... }:
    {
      imports = [
        inputs.nix-index-database.nixosModules.nix-index
      ];

      programs.nix-index = lib.mkIf cfg.enable {
        enable = true;
        enableBashIntegration = true;
        enableZshIntegration = true;
        enableFishIntegration = true;
      };

      programs.nix-index-database = lib.mkIf cfg.enable {
        comma.enable = true;
      };

      environment.systemPackages = lib.mkIf cfg.enable [ pkgs.comma ];

      programs.command-not-found.enable = lib.mkIf cfg.enable false;
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable nix-index";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
