{ lib, pkgs, ... }:
{
  metadata = {
    name = "zig";
    description = "Module for `dev.runtimes.zig`.";
    purpose = "Configure `dev.runtimes.zig` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "dev"
      "runtimes"
      "zig"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [
        zig
        zls
      ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable zig";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
