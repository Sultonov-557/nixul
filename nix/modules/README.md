# nix/modules

Personal NixOS and Home Manager modules live here, grouped by category so the
tree stays deep, clean, and easy to navigate. Modules are discovered automatically
via `nix/lib/module-importer.nix`; only add a `default.nix` when you need ordering or
shared defaults (e.g. /dev/editor/nixvim). Keep folders at roughly five items max—split before they turn
into junk drawers.

## Layout (top level)

- `apps/`: User-facing programs (browsers, media, gaming, AI tools).
- `core/`: Baseline OS, security, users, time, networking defaults.
- `desktop/`: Display stack, compositors, panels, theming, portals, clipboard,
  notifications, screenshots.
- `dev/`: Developer tooling: runtimes, editors, VCS, containers for dev, shell
  helpers.
- `hardware/`: Drivers and device support: audio, power, inputs, storage,
  networking, bluetooth, firmware.
- `services/`: Long-running daemons and infra (dbs, VPN, reverse proxy,
  monitoring, container engines).

## Where does this go? (quick reference)

- OpenSSH hardening (like `services.openssh = { ... };`):
  `services/security/openssh.nix`
- Docker daemon: `services/containers/docker.nix`
- Neovim configuration: `dev/editor/neovim.nix`
- Firefox policies or defaults: `apps/user/internet/browsers/firefox.nix`
- Bluetooth stack tweaks: `hardware/bluetooth/...`
- Wayland compositor config: `desktop/wms/...`

## Deciding the folder

- What is it?
  - Daemon or infra: `services/`
  - User app: `apps/`
  - Device enablement or tuning: `hardware/`
  - Desktop shell/tooling: `desktop/`
  - Developer workflow: `dev/`
  - Baseline OS/security/network defaults: `core/`
- Who consumes it? Place it at the lowest sensible layer so others can reuse
  it (GPU tuning in `hardware/`, not `gaming/`).
- How big is the folder? If it is hitting four items, plan a split (for
  example, `services/networking/` or `apps/media/`).

## New folder vs reuse

- Reuse an existing folder when the domain already matches and it stays under
  five items.
- Create a subfolder when you add multiple related modules or shared helpers
  (e.g., `apps/ai/`, `services/security/`).
- Add a `default.nix` only if ordering or shared options are required; otherwise
  rely on automatic discovery via the module importer.
- For cross-cutting modules, favor the most fundamental layer and expose options
  that higher layers can enable.

## Edge cases

- Mixed concerns: split daemon setup (`services/`) from user experience
  (`apps/` or `desktop/`).
- Experimental stacks: put them in an `experimental/` or `labs/` subfolder with
  an option gate in `default.nix`.
- Home Manager vs NixOS: both live here; keep host-specific overrides under
  `nix/hosts/`.
- Naming: use kebab-case filenames and directories; keep modules small,
  composable attribute-set functions (`{ config, lib, pkgs, ... }:`).
