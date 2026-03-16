# Modules

## Layout

All shared feature modules live under `nix/modules`. Top-level directories describe domains:

- `apps/` – user applications (browsers, media, gaming, AI tools).
- `core/` – OS defaults, security, networking, identity, Nix settings.
- `desktop/` – display stack, compositors, panels, theming, portals, clipboard, notifications, screenshots.
- `dev/` – editors, runtimes, CLI tooling, security tools.
- `hardware/` – drivers and power/CPU/GPU/storage helpers.
- `services/` – databases, VPNs, dashboards, containers, ingress.

Use kebab-case for file and directory names (for example `core/system/nix/nix.nix`).

## Module shape

A module file returns an attribute set whose keys may include:

- `options` – a NixOS options subtree describing the configuration type.
- `system` – a function that returns NixOS configuration.
- `home` – a function that returns Home Manager configuration.

Both `system` and `home` receive:

```nix
{ cfg, lib, pkgs, config, inputs, ... }:
```

- `cfg` is the resolved value of the modules option.
- `inputs` is the full flake input set.
- `config` is the global NixOS or Home Manager configuration.

## Generated options

For each discovered module, the importer builds two option trees:

- Host side under `nixul.host.modules.<path>`.
- Per-user side under `nixul.users.<name>.modules.<path>`.

The `<path>` corresponds to the modules path relative to `nix/modules` (directories become attribute names).

Examples:

- `nix/modules/core/system/nix/nix.nix` → `core.system.nix.nix`.
- `nix/modules/apps/user/internet/browsers/firefox.nix` → `apps.user.internet.browsers.firefox`.

You can then configure modules like:

```nix
# Host-level
nixul.host.modules.core.system.nix.nix.enable = true;

# Per-user
nixul.users.sultonov.modules.apps.user.internet.browsers.firefox.enable = true;
```

Modules can expose richer options than a simple `enable` flag; those options appear under the same path.

## System and home together

Many modules configure both layers in one place. For example, the Hyprland module:

- adds services and packages to the system in `system`;
- configures `wayland.windowManager.hyprland` for users in `home`.

This avoids divergence between system and home aspects of the same feature.

## Authoring new modules

When adding a module:

1. Choose the directory based on what the module represents (app, service, hardware, etc.).
2. Create a new `.nix` file in that directory with a clear, focused purpose.
3. Define an `options` subtree with at least an `enable` toggle.
4. Implement `system` and/or `home` that read from `cfg` and gate behaviour using `lib.mkIf cfg.enable`.
5. Keep cross-cutting logic minimal; prefer composing smaller modules where possible.

After changing modules, run:

```sh
nix fmt
nix develop --command deadnix --fail .
nix flake check --all-systems --show-trace
```
