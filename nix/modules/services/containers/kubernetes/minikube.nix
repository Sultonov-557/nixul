{ lib, pkgs, ... }:
{
  metadata = {
    name = "minikube";
    description = "Module for `services.containers.kubernetes.minikube`.";
    purpose = "Configure `services.containers.kubernetes.minikube` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "services"
      "containers"
      "kubernetes"
      "minikube"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [
        minikube
      ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable minikube";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
