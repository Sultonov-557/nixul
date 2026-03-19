{ lib, ... }:
{
  metadata = {
    name = "sysctl";
    description = "Module for `core.security.sysctl`.";
    purpose = "Configure `core.security.sysctl` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "core"
      "security"
      "sysctl"
    ];
  };

  system =
    { cfg, ... }:
    {
      boot.kernel.sysctl = lib.mkIf cfg.enable {
        "vm.swappiness" = 180;

        "net.ipv4.tcp_syncookies" = 1;
        "net.ipv4.icmp_echo_ignore_broadcasts" = 1;
        "net.ipv4.conf.all.accept_redirects" = 0;
        "net.ipv4.conf.default.accept_redirects" = 0;
        "net.ipv4.conf.all.send_redirects" = 0;
        "net.ipv4.conf.default.send_redirects" = 0;
        "fs.protected_hardlinks" = 1;
        "fs.protected_symlinks" = 1;
        "fs.protected_fifos" = 2;
        "fs.protected_regular" = 2;
        "kernel.kptr_restrict" = 2;
        "kernel.dmesg_restrict" = 1;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable sysctl";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
