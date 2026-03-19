{ lib, pkgs, ... }:
{
  metadata = {
    name = "bun";
    description = "Module for `dev.runtimes.javascript.bun`.";
    purpose = "Configure `dev.runtimes.javascript.bun` features and defaults.";
    scope = "shared";
    status = "active";
    tags = [
      "dev"
      "runtimes"
      "javascript"
      "bun"
    ];
  };

  home =
    { cfg, ... }:
    {
      programs.bun = lib.mkIf cfg.enable {
        enable = true;
      };
    };

  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [ bun ]);

      programs.nix-ld.libraries = lib.mkIf cfg.enable (with pkgs; [
        bun
      ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable bun";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
