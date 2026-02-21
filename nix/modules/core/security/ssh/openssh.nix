{ lib, ... }:
{
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
