{ ... }:

{
  imports = [
    ./hardware/management/power.nix
    ./hardware/bluetooth.nix
    ./hardware/storage/usb-automount.nix
    ./services/display-manager/gdm.nix
    ./services/databases/postgresql.nix
    ./services/databases/redis.nix
    ./services/security/sops.nix
    ./services/virtualisation/docker.nix
    ./user.nix
  ];
}
