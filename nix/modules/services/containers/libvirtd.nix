{
  lib,
  pkgs,
  ...
}:
{
  system =
    { cfg, nixul, ... }:
    {
      virtualisation.libvirtd = lib.mkIf cfg.enable {
        enable = true;
        qemu = {
          package = pkgs.qemu_kvm;
          runAsRoot = false;
          swtpm.enable = true;
        };
      };

      programs.virt-manager.enable = lib.mkIf cfg.enable true;

      users.users.${nixul.primaryUser}.extraGroups = [ "libvirtd" ];
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable libvirtd";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
