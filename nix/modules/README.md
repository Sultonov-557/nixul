# `nix/modules`

All reusable NixOS and Home Manager modules live here. The goal is a deep, well-organised tree where each file does one thing.

Modules are discovered automatically via `nix/lib/module-importer.nix`; you normally do not need to wire them manually. Only add a `default.nix` in a directory when you need ordering or shared defaults.

Keep folders at roughly five items before splitting; avoid directories that become junk drawers.

## Layout (top level)

- `apps/` – user-facing programs (browsers, media, gaming, AI tools).
- `core/` – baseline OS, security, users, time, networking defaults.
- `desktop/` – display stack, compositors, panels, theming, portals, clipboard, notifications, screenshots.
- `dev/` – developer tooling: runtimes, editors, VCS, containers, shell helpers.
- `hardware/` – drivers and device support: audio, power, inputs, storage, networking, Bluetooth, firmware.
- `services/` – long-running daemons and infra (databases, VPN, reverse proxy, monitoring, container engines).

## Choosing a location

Ask two questions:

1. What is it?
   - Daemon or infrastructure → `services/`.
   - User application → `apps/`.
   - Device enablement or tuning → `hardware/`.
   - Desktop shell or UX → `desktop/`.
   - Developer workflow tool → `dev/`.
   - Baseline OS/security/network defaults → `core/`.

2. Who consumes it?
   Put the module at the lowest sensible layer so it can be reused. For example, GPU tuning belongs to `hardware/`, not inside a specific game launcher.

If a folder is getting crowded, split it (for example `services/networking/`, `apps/media/`).

## Module semantics

- Each file exports an attribute set that may include `options`, `system`, and `home`.
- The importer uses the file path to generate option trees under:
  - `nixul.host.modules.<path>`.
  - `nixul.users.<name>.modules.<path>`.
- Use kebab-case for filenames and directories.
- Keep modules small and composable; split mixed concerns instead of adding flags.

## New folder vs reuse

- Reuse an existing folder when the domain already matches and it stays under five items.
- Create a subfolder when adding several related modules or helpers (for example `apps/ai/`, `services/security/`).
- Add a `default.nix` only when you need per-folder shared options or imports; otherwise rely on automatic discovery.

## Edge cases

- Mixed concerns: split daemon setup (`services/`) from user experience (`apps/` or `desktop/`).
- Experimental stacks: use an `experimental/` or `labs/` subfolder with an option gate.
- Host-specific overrides: keep them in `nix/hosts/`; use modules here for behaviour you want to reuse.
