# Modules

## How modules are structured

- Files live under `nix/modules/` by domain: `apps/`, `core/`, `desktop/`, `dev/`, `hardware/`, `services/`.
- Everything except folders with their own `default.nix` is imported automatically by `nix/lib/import-tree.nix`.
- Modules are plain Nix functions that take an attribute set (`{ config, lib, pkgs, ... }:`) and return options.
- System and Home Manager settings often sit together in one module by writing into `home-manager.users.${config.nixul.user}` alongside system options.

## Naming conventions

- Use kebab-case for filenames and directories: `apps/browser/firefox.nix`.
- Keep modules small and focused; split when a file covers multiple concerns.
- Use the most specific folder possible so imports stay predictable.

## How to create a new module

1. Pick the right folder (e.g., `services/monitoring/` for a daemon, `apps/media/` for a user-facing app).
2. Create `nix/modules/<path>/feature.nix` with a minimal module function.
3. Set system config and, if needed, add user-level configuration under `home-manager.users.${config.nixul.user}` in the same file.
4. Rebuild with `nh os test .#<host>` to validate before switching.

Example combined system + user module:

```nix
{ config, pkgs, inputs, ... }:
{
  environment.systemPackages = [ inputs.hyprland.packages.${pkgs.system}.hyprland ];
  programs.hyprland.enable = true;

  home-manager.users.${config.nixul.user} = {
    wayland.windowManager.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    };
  };
}
```

## Examples

- See `nix/modules/desktop/wms/hyprland/default.nix` for a combined system + user module.
- `nix/modules/services/ntfy.nix` shows a simple enabled-by-default service.
- For folder layout patterns, check `nix/modules/README.md`.
- Host files `nix/hosts/*/home.nix` show how user options are applied per machine.
