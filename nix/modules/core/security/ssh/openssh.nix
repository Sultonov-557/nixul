{ lib, ... }:
{
  metadata = {
    name = "openssh";
    description = "Module for `core.security.ssh.openssh`.";
    purpose = "Configure `core.security.ssh.openssh` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "core"
      "security"
      "ssh"
      "openssh"
    ];
  };

  system =
    { cfg, ... }:
    {
      services.openssh = lib.mkIf cfg.enable {
        enable = true;
        settings = {
          PasswordAuthentication = false;
          KbdInteractiveAuthentication = false;
          PermitRootLogin = "no";
          X11Forwarding = false;
        };

        listenAddresses = [
          {
            addr = "127.0.0.1";
            port = 22;
          }
        ];
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable openssh";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
