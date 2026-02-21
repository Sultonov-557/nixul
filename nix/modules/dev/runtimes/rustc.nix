{ lib, pkgs, ... }:
{
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
