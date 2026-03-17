# Architecture

Nixul is built around three layers: host entrypoints, shared modules, and tag bundles.

## Flake wiring
- `flake.nix` creates `nixosConfigurations` from `nix/hosts/*`.
- `nix/lib/default.nix` provides `mkSystem` and `mkSystems` and injects helpers through `specialArgs`.
- Injected helpers are `loadTags`, `loadUserTags`, and `loadTheme`.
- Each host is also exposed as a build in `checks` and `packages`.

## Module importer
- `nix/lib/module-importer.nix` is imported for every host.
- Importer internals live under `nix/lib/module-importer/*`:
  - `discover.nix` scans `nix/modules`.
  - `module-loader.nix` loads module files and metadata.
  - `options.nix` builds generated option trees.
  - `host.nix` evaluates `system` module functions.
  - `users.nix` evaluates `home` module functions per user.
  - `types.nix` and `utils.nix` provide validation and helpers.
- Generated options are mounted under:
  - `nixul.host.modules.<path>`
  - `nixul.users.<user>.modules.<path>`

## Module contract
- Shared modules are files under `nix/modules/**`.
- A module can expose:
  - `options` (defaults/type for `cfg`)
  - `system = { cfg, ... }: { ... }`
  - `home = { cfg, user, ... }: { ... }`
- Option paths match the file path relative to `nix/modules`.

## Host model
- Hosts live at `nix/hosts/<host>/default.nix`.
- A host typically imports:
  - `./hardware-configuration.nix`
  - one or more users from `nix/users/*`
  - a theme via `loadTheme "<theme>"`
- Host intent is declared in `nixul.host.modules` by merging tags with overrides.

## Tags and themes
- Host tags: `nix/nixul/tags/host/**`.
- User tags: `nix/nixul/tags/user/**`.
- Current host tag examples include:
  - `compositor/hyprland`
  - `display-manager/gdm`
  - `dev/node`
- User tag examples include:
  - `cli/base`
  - `dev/neovim`
  - `git/base`
- Themes are in `nix/nixul/themes/*` and loaded with `loadTheme`.

## Follow-up docs
- See `docs/modules.md` for authoring modules.
- See `docs/hosts.md` for host composition patterns.
- See `docs/workflows.md` for operational commands.
