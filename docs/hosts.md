# Hosts

Hosts are thin entrypoints under `nix/hosts/<host>`.

## Expected host files
- `nix/hosts/<host>/default.nix` - host composition.
- `nix/hosts/<host>/hardware-configuration.nix` - machine hardware config.
- optional `nix/hosts/<host>/bookmarks.nix`.

## Host composition pattern
Current hosts (`nomad`, `vanguard`) follow this structure:
- import hardware config and users from `nix/users/*`
- import a theme via `loadTheme "gruvbox-material"`
- set `nixul.host.name`, `timezone`, `location`, `bookmarks`
- build `nixul.host.modules` from tags + overrides with `lib.recursiveUpdate`

Example tags in active hosts:

```nix
loadTags [
  "base"
  "compositor/hyprland"
  "display-manager/gdm"
  "dev/node"
  "ai/ollama"
]
```

Other available tags include `display-manager/sddm`, `gaming/steam`, and `dev/python`.

## Add a new host
1. Copy `nix/hosts/example` or another host.
2. Generate and save `hardware-configuration.nix` for that machine.
3. Update `nixul.host.*` fields and tags in `default.nix`.
4. Ensure a user import exists (for example `../../users/sultonov`).
5. Run `nh os test .#<host>` then `nh os switch .#<host>`.

## Keep hosts thin
- Prefer tag files for reusable bundles.
- Prefer `nix/modules/**` for new behavior.
- Keep host-level overrides for machine-specific differences only.

See `docs/modules.md` for module paths and `docs/workflows.md` for operations.
