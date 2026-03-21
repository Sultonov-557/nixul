{ lib, pkgs, ... }:
{
  system =
    { cfg, ... }:
    {
      services.printing.drivers = lib.mkIf cfg.enable (with pkgs; [
        hplip
      ]);
    };}
