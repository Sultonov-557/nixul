# Architecture

## Goals

- Thin host folders that describe hardware and high-level choices.
- A deep shared module tree that holds almost all behaviour.
- A module importer that discovers modules automatically and generates typed options.
- A tags and themes system to enable groups of features quickly.

## Flake and library

- `flake.nix` declares inputs such as `nixpkgs`, `home-manager`, `flake-parts`, `sops-nix`, `stylix`, and various desktop and service flakes.
- The `outputs` call into `nix/lib`:
  - `nix/lib/default.nix` defines `mkSystem` and `mkSystems`.
  - Each host under `nix/hosts` becomes a `nixosSystem` exposed as both a flake `package` and a `check`.
- `mkSystem` injects `inputs` and helpers into `specialArgs` so modules and hosts can use them:
  - `loadTags` / `loadUserTags` – build module trees from tags.
  - `loadTheme` – select theme modules by name.
  - the full `inputs` set for accessing upstream flakes.

## Module importer

- `nix/lib/module-importer.nix` is imported into every system.
- It treats `nix/modules` as the root of the feature tree and:
  - discovers all `.nix` files under that directory;
  - loads each module via `module-loader.nix`;
  - builds option trees for host and user modules;
  - constructs Home Manager config per user.
- Modules are regular Nix modules that return an attribute set which may export:
  - `options` – a subtree describing configuration for the module;
  - `system` – a function that produces NixOS config;
  - `home` – a function that produces Home Manager config.
- For every discovered module, the importer generates options:
  - `nixul.host.modules.<path>` for host-level configuration;
  - `nixul.users.<name>.modules.<path>` for per-user configuration.
  The `<path>` is derived from the modules location under `nix/modules` (for example `core/system/nix/nix`).

## Host model

- Each host lives in `nix/hosts/<hostname>/default.nix`.
- A typical host:
  - imports its `hardware-configuration.nix`;
  - imports one or more users from `nix/users`;
  - picks a theme via `loadTheme`;
  - configures `home-manager.users.<name>` with host-specific bits (monitors, keybinds, etc.);
  - sets `nixul.host` attributes such as `name`, `timezone`, `location`, and `bookmarks`;
  - chooses which features to enable through tags and explicit module overrides.
- Hosts usually merge:
  - a base set of modules loaded from tags;
  - a small inline attribute set of overrides and extra features.

This keeps most logic in shared modules while allowing hosts to tweak details.

## Tags and themes

- Tags live under `nix/nixul/tags` and describe reusable module bundles such as:
  - `base`, `desktop`, `dev/*`, `gaming/*`, `ai/*`, and more.
- Hosts call `loadTags [ "base" "wayland" "desktop" ... ]` to build a module tree for `nixul.host.modules`.
- User-specific tags can be loaded with `loadUserTags` from host or user configs.
- Themes live under `nix/nixul/themes`; `loadTheme "catppuccin-mocha"` (for example) returns a module that configures Stylix and related theming.

## Reasoning about a configuration

When debugging or extending Nixul:

- Start from `flake.nix` to see inputs and flake outputs.
- Read `nix/lib/default.nix` and `nix/lib/module-importer.nix` to understand how hosts and modules are wired.
- Check `nix/hosts/<host>/default.nix` for host-specific imports, tags, and overrides.
- Explore `nix/modules` for the feature you care about; the path usually matches the option path under `nixul.host.modules` or `nixul.users.<name>.modules`.
- If an option seems mysterious, search for it in `nix/modules` first; host folders should remain small wrappers.
