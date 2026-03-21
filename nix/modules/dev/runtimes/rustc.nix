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
    };}
