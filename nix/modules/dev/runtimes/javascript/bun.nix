{ lib, pkgs, ... }:
{
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
    };}
