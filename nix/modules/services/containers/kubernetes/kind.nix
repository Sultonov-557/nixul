{ lib, pkgs, ... }:
{
  metadata = {
    name = "kind";
    description = "Module for `services.containers.kubernetes.kind`.";
    purpose = "Configure `services.containers.kubernetes.kind` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "services"
      "containers"
      "kubernetes"
      "kind"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [
        kind
      ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable kind";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
