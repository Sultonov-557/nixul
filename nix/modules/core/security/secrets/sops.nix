{
  lib,
  pkgs,
  inputs,
  ...
}:
{
  system =
    { cfg, config, ... }:
    {
      imports = [
        inputs.sops-nix.nixosModules.sops
      ];

      sops = lib.mkIf cfg.enable {
        defaultSopsFile = ../../../assets/secrets/password.yaml;
        defaultSopsFormat = "yaml";
        age.keyFile = "/home/${config.nixul.primaryUser}/.config/sops/age/keys.txt";
      };

      environment.systemPackages = lib.mkIf cfg.enable [
        pkgs.sops
        pkgs.age
      ];
    };}
