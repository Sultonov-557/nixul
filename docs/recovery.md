# Recovery

## Booting into older generations

- At boot, choose an older generation from GRUB or systemd-boot.
- After booting into a working generation, drop broken ones:
  ```sh
  nix-collect-garbage -d
  ```
- If you are already running and just want to undo the last switch:
  ```sh
  nh os rollback .#<host>
  ```

## Fixing a broken system

1. Roll back first so you are on a stable configuration.
2. Make your fix in the repo.
3. Rebuild in test mode to verify the change without switching:
   ```sh
   nh os test .#<host>
   ```
4. If a service is failing, inspect it:
   ```sh
   systemctl status <unit>
   journalctl -u <unit> -b
   ```
5. For fetch or cache issues, rebuild with refresh:
   ```sh
   nix build --refresh .#<host>
   ```
6. Once you are confident, switch:
   ```sh
   nh os switch .#<host>
   ```

## Rebuilding from a live ISO

1. Boot a NixOS ISO and get network access.
2. Mount your root and boot partitions:
   ```sh
   mount /dev/<root-partition> /mnt
   mount /dev/<boot-partition> /mnt/boot
   ```
3. Enter a shell with Git and `nh`:
   ```sh
   nix shell nixpkgs#git nixpkgs#nh
   ```
4. If the config repo is missing, clone it:
   ```sh
   git clone <your-repo-url> /mnt/etc/nixos
   ```
5. If hardware changed, regenerate:
   ```sh
   nixos-generate-config --root /mnt
   cp /mnt/etc/nixos/hardware-configuration.nix \
      /mnt/etc/nixos/nix/hosts/<host>/hardware-configuration.nix
   ```
6. Build and install from the ISO:
   ```sh
   nixos-install --flake /mnt/etc/nixos#<host>
   ```
7. Reboot into the recovered system.

## Restoring from scratch

- If the disk was wiped, follow the install steps:
  - partition and format;
  - install NixOS with flakes enabled;
  - clone this repo into `/etc/nixos` or your preferred path.
- Restore secret keys (for example Age keys used by sops-nix) before switching:
  ```sh
  export SOPS_AGE_KEY_FILE=/home/<user>/.config/sops/age/keys.txt
  ```
- After restoration, build and switch, then optionally prune old generations:
  ```sh
  nh os switch .#<host>
  nix-collect-garbage -d
  ```
