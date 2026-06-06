{
  lib,
  inputs,
  pkgs,
  ...
}:
{
  system =
    { cfg, config, ... }:
    {
      imports = [
        inputs.hermes-agent.nixosModules.default
      ];

      environment.defaultPackages = [
        inputs.hermes-agent.packages.${pkgs.system}.desktop
        inputs.hermes-agent.packages.${pkgs.system}.tui
        inputs.hermes-agent.packages.${pkgs.system}.web
        inputs.hermes-agent.packages.${pkgs.system}.default
      ];
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkEnableOption "hermes-agent";
      };
    };
    default = {
      enable = false;
    };
  };
}
