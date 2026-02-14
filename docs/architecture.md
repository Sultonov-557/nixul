# Architecture

## High-level design philosophy

- Keep hosts thin: hardware, hostname, user name, and small per-device tweaks live under `nix/hosts/`.
- Keep everything else shared: reusable modules sit in `nix/modules/` and are pulled into every host.
- Favor declarative switches with `nh` so the same command works for build, test, and boot outputs.
- Minimize surprises: every option should be discoverable from the module tree or the host folder.

## How modules are organized

- Modules live under `nix/modules/` grouped by concern: `apps`, `core`, `desktop`, `dev`, `hardware`, `services`.
- `nix/modules/default.nix` imports the whole tree via `nix/lib/import-tree.nix`. Directories that need ordering or shared defaults can add their own `default.nix`.
- Module naming uses kebab-case files. Keep modules small and composable; if a folder reaches four or five items, split it.

## System vs home modules (blended)

- Shared modules often configure both layers together: system bits plus Home Manager bits under `home-manager.users.${config.nixul.user}` in the same file (see `nix/modules/desktop/wms/hyprland`).
- You can still put host-only user settings in `nix/hosts/<host>/home.nix`, but most shared features live in the module tree with their user configuration attached.
- `nix/hosts/<host>/system.nix` still imports the hardware config and wires Home Manager, so host-local overrides remain easy.

## How options flow through the system

1. `flake.nix` defines inputs and hands `inputs` to the library.
2. `nix/lib/default.nix` exposes `mkSystems`, which:
   - Reads host folders under `nix/hosts/`.
   - Builds `nixosSystem` per host with `inputs` in `specialArgs`.
   - Adds a tiny module defining the required `nixul.user` option.
   - Imports the host folder, Home Manager, and the shared module tree.
3. `nix/modules/default.nix` collects every module file automatically.
4. Host configs can override or extend any shared option because they are imported last in their folder.

## How to reason about the config

- Start at `flake.nix` to see what the flake exposes (packages/checks per host).
- Open `nix/lib/default.nix` to understand how hosts are constructed.
- Browse `nix/modules/` to see the shared feature set; check `nix/modules/README.md` for placement guidance.
- Look at `nix/hosts/<host>/system.nix` for machine-specific system tweaks, then `home.nix` for desktop/user details.
- If something is mysterious, search for the option name in `nix/modules/` first; hosts should only be thin wrappers.
