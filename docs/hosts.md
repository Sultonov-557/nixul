# Hosts

## How host configs work
- Each host lives in `nix/hosts/<hostname>/` with four files:
  - `default.nix` sets `nixul.user` and imports `system.nix`.
  - `system.nix` sets hostname, imports `hardware-configuration.nix`, and wires Home Manager.
  - `hardware-configuration.nix` comes from `nixos-generate-config`.
  - `home.nix` holds user-level desktop and program settings, but shared modules may also configure Home Manager (see `nix/modules/desktop/wms/hyprland`).
- Hosts are exposed as flake outputs, so you can build or switch via `.#<hostname>`.

## Adding a new machine
1) Copy an existing host folder (e.g., `cp -r nix/hosts/nomad nix/hosts/<new-host>`).
2) Update `nix/hosts/<new-host>/default.nix` with your username.
3) Set `networking.hostName` and any machine-wide settings in `system.nix`.
4) Regenerate hardware config on the new machine:
   ```sh
   nixos-generate-config --root /mnt
   ```
   Replace `nix/hosts/<new-host>/hardware-configuration.nix` with the generated file.
5) Adjust `home.nix` for displays, desktop shell, and user packages.
6) Build and switch on the target machine: `nh os switch .#<new-host>`.

## Hardware configs
- Always regenerate `hardware-configuration.nix` on the actual device; do not reuse another machine's file.
- Keep firmware toggles and kernel modules in `system.nix` if they are logical defaults for the host.
- For exotic storage or boot setups, document them inline in the host folder so future-you remembers the quirks.

## Host-specific overrides
- Add host-only packages, services, or kernel tweaks in `system.nix`.
- User-level host overrides belong in `home.nix` (display layout, per-host app settings).
- If a feature should be shared across hosts, move it into `nix/modules/` instead of repeating it.
