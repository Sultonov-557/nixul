{
  lib,
  pkgs,
  inputs,
  ...
}:
{
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
    };}
