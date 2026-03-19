{ lib, pkgs, ... }:
{
  metadata = {
    name = "rustc";
    description = "Module for `dev.runtimes.rustc`.";
    purpose = "Configure `dev.runtimes.rustc` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "dev"
      "runtimes"
      "rustc"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [
        rustc
        cargo
        rustfmt
        pkg-config
        libxkbcommon
        alsa-lib
        libudev-zero
      ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable rustc";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
