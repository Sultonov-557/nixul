# Modules

## Feature modules

- Feature definitions live under `nix/modules/` and export plain attribute sets with `system` and/or `home` functions.
- Options are generated automatically:
  - Host toggle: `nixul.host.modules.<path>` defaults to the module's `options.default`.
  - User toggle: `nixul.users.<name>.modules.<path>` defaults to the module's `options.default`.
- A module may export:
  - `system`: NixOS config function, receives `{ cfg, lib, pkgs, config, inputs, ... }`.
  - `home`: Home Manager config function, receives `{ cfg, lib, pkgs, config, inputs, user, ... }`.
  - `options`: NixOS option definition for the module's configuration.
- Both `system` and `home` functions receive `cfg`, the resolved config value from the corresponding option.
- Example per-user enablement:

```nix
nixul.users.sultonov.modules.apps.ai.codex = {
  enable = true;
  instructions = "Keep replies short.";
};
```

## Classic modules

- Modules live under `nix/modules/` by domain: `apps/`, `core/`, `desktop/`, `dev/`, `hardware`, `services/`.
- `nix/lib/module-importer.nix` discovers and loads modules automatically based on their `system` and `home` exports.
- Use kebab-case for filenames and directories and keep files focused; split when a module covers multiple concerns.
- Prefer the most specific folder to keep import paths predictable.
