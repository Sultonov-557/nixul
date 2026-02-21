# Hosts

## How host configs work
- Each host lives in `nix/hosts/<hostname>/` with two files:
  - `default.nix` sets `nixul.host.name`, `nixul.host.timezone`, and imports `hardware-configuration.nix`.
  - `hardware-configuration.nix` comes from `nixos-generate-config`.
- User configuration is managed via `nixul.users.<name>.modules.*` options in the host config.
- Hosts are exposed as flake outputs, so you can build or switch via `.#<hostname>`.

## Adding a new machine
1) Copy an existing host folder (e.g., `cp -r nix/hosts/nomad nix/hosts/<new-host>`).
2) Update `nix/hosts/<new-host>/default.nix` with your hostname and timezone.
3) Regenerate hardware config on the new machine:
   ```sh
   nixos-generate-config --root /mnt
   ```
   Replace `nix/hosts/<new-host>/hardware-configuration.nix` with the generated file.
4) Configure user modules via `nixul.users.<name>.modules.*` options.
5) Build and switch on the target machine: `nh os switch .#<new-host>`.

## Hardware configs
- Always regenerate `hardware-configuration.nix` on the actual device; do not reuse another machine's file.
- Keep firmware toggles and kernel modules in `default.nix` if they are logical defaults for the host.
- For exotic storage or boot setups, document them inline in the host folder so future-you remembers the quirks.

## Host-specific overrides
- Add host-only packages or services via `nixul.host.modules.*` options.
- User-level configuration goes in `nixul.users.<name>.modules.*` options.
- If a feature should be shared across hosts, move it into `nix/modules/` instead of repeating it.
