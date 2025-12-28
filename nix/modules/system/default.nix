{ ... }:

{
  imports = [
    ./hardware/management/power.nix
    ./hardware/storage/usb-automount.nix
    ./services/desktop/display-manager.nix
    ./services/databases/postgresql.nix
    ./services/databases/redis.nix
    ./services/security/sops.nix
    ./services/virtualisation/docker.nix
  ];
}
