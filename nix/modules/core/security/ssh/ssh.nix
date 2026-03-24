{ lib, ... }:
{
  metadata = {
    name = "ssh";
    description = "Module for `core.security.ssh.ssh`.";
    purpose = "Configure `core.security.ssh.ssh` features and defaults.";
    scope = "home";
    status = "active";
    tags = [
      "core"
      "security"
      "ssh"
    ];
  };

  home =
    { cfg, ... }:
    {
      programs.ssh = lib.mkIf cfg.enable {
        enable = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable ssh";
        };

        serversSecretFile = lib.mkOption {
          type = lib.types.nullOr lib.types.path;
          default = null;
          description = "SOPS-encrypted JSON file with SSH server definitions";
        };

        strictHostKeyChecking = lib.mkOption {
          type = lib.types.enum [
            "accept-new"
            "yes"
            "no"
          ];
          default = "accept-new";
          description = "StrictHostKeyChecking value used for generated SSH hosts";
        };
      };
    };
    default = {
      enable = false;
      serversSecretFile = null;
      strictHostKeyChecking = "accept-new";
    };
  };
}
