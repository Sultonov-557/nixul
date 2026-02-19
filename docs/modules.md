# Modules

## Feature modules

- Feature definitions live under `nix/modules/features/` and export plain attribute sets, not NixOS option declarations.
- Options are generated automatically:
  - Host toggle: `nixul.modules.<path>` defaults to `null`.
  - User toggle: `nixul.users.<name>.modules.<path>` defaults to `null`.
- Scopes:
  - `scope = "user"`: only users may enable the feature.
  - `scope = "host"`: only hosts may enable the feature.
  - `scope = "both"`: either is allowed; system fragment runs once if any side enables.
- A feature may export `system` (runs once when enabled by host or any user) and `home` (runs per enabled user) functions. Both receive `cfg`, the per-feature config value (attribute set or `{}` when enabled without config).
- Example per-user enablement:

```nix
nixul.users.sultonov.modules.apps.ai.codex = {
  instructions = "Keep replies short.";
};
```

## Classic modules

- Existing modules still live under `nix/modules/` by domain: `apps/`, `core/`, `desktop/`, `dev/`, `hardware`, `services/`.
- Everything except folders with their own `default.nix` is imported automatically by `nix/lib/import-tree.nix`.
- Use kebab-case for filenames and directories and keep files focused; split when a module covers multiple concerns.
- Prefer the most specific folder to keep import paths predictable.
