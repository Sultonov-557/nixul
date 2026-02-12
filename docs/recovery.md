# Recovery

## Booting into older generations
- At boot, pick an older generation from GRUB/systemd-boot. Choose the last known good one.
- From the working system, prune the broken builds once you are stable:
  ```sh
  nix-collect-garbage -d
  ```
- If you are already booted and just need to undo the last switch:
  ```sh
  nh os rollback .#<host>
  ```

## Fixing a broken system
- Roll back first so you are on a stable generation.
- Rebuild in test mode to verify your fix without switching:
  ```sh
  nh os test .#<host>
  ```
- If a service is misbehaving, inspect it before rebuilding:
  ```sh
  systemctl status <unit>
  journalctl -u <unit> -b
  ```
- When a fetch fails, retry with refresh:
  ```sh
  nix build --refresh .#<host>
  ```

## Rebuilding from a live ISO
1) Boot the NixOS ISO and get network access.
2) Mount your root and boot partitions:
   ```sh
   mount /dev/<root-partition> /mnt
   mount /dev/<boot-partition> /mnt/boot
   ```
3) Enter a shell with git and nh:
   ```sh
   nix shell nixpkgs#git nixpkgs#nh
   ```
4) If the repo is missing, clone it:
   ```sh
   git clone <your-repo-url> /mnt/etc/nixos
   ```
5) If hardware changed, regenerate:
   ```sh
   nixos-generate-config --root /mnt
   cp /mnt/etc/nixos/hardware-configuration.nix /mnt/etc/nixos/nix/hosts/<host>/hardware-configuration.nix
   ```
6) Build and install from the ISO:
   ```sh
   nixos-install --flake /mnt/etc/nixos#<host>
   ```
7) Reboot into the recovered system.

## Restoring a system from scratch
- If the disk was wiped, repeat the fresh install steps from `README.md` (partition, format, clone the repo).
- If secrets are required, restore your age keys or other secret material before switching (see `docs/secrets.md`).
- After restoration, prune old generations and rebuild once more to ensure everything is consistent:
  ```sh
  nh os switch .#<host>
  nix-collect-garbage -d
  ```
