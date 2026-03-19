{ lib, pkgs, ... }:
{
  metadata = {
    name = "kubectl";
    description = "Module for `services.containers.kubernetes.kubectl`.";
    purpose = "Configure `services.containers.kubernetes.kubectl` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "services"
      "containers"
      "kubernetes"
      "kubectl"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [
        kubectl
      ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable kubectl";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
