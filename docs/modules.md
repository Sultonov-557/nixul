# Modules

Shared features live under `nix/modules` and are auto-discovered by `nix/lib/module-importer/discover.nix`.

## Directory conventions
- Domains: `apps`, `core`, `desktop`, `dev`, `hardware`, `services`.
- Use `kebab-case` file and directory names.
- Keep modules focused; split folders when they grow too large.

## Module file contract
A module file can return:
- `options` - option schema/defaults for `cfg`.
- `system` - function returning NixOS config.
- `home` - function returning Home Manager config.
- `metadata` - optional docs metadata for generated references.

Typical shape:

```nix
{
  metadata = {
    name = "ollama";
    description = "Run local LLM inference service";
    purpose = "Expose and manage the Ollama daemon";
    scope = "system";
    tags = [ "ai" "llm" "inference" ];
  };

  options = {
    enable = lib.mkEnableOption "feature";
  };

  system = { cfg, lib, ... }: lib.mkIf cfg.enable {
    # NixOS config
  };

  home = { cfg, lib, ... }: lib.mkIf cfg.enable {
    # Home Manager config
  };
}
```

If `metadata` is omitted, importer defaults are generated from the module path. Metadata is exposed internally at:
- `nixul._moduleMetadata.<module-path>`
- `nixul._hostModuleMetadata.<module-path>`
- `nixul._userModuleMetadata.<module-path>`

## Generated option paths
- Host side: `nixul.host.modules.<module-path>`.
- User side: `nixul.users.<user>.modules.<module-path>`.

Examples from current tree:
- `nix/modules/core/system/nix/nh.nix` -> `core.system.nix.nh`.
- `nix/modules/desktop/display-manager/gdm.nix` -> `desktop.display-manager.gdm`.
- `nix/modules/services/ai/ollama.nix` -> `services.ai.ollama`.

## Tags and modules
- Tags are attrset bundles that set module options.
- Host tag files are in `nix/nixul/tags/host/**`.
- User tag files are in `nix/nixul/tags/user/**`.
- Keep reusable sets in tags; keep host files thin.

## Validation loop
After module edits:

```bash
nix fmt
nix develop --command deadnix --fail .
nix flake check --all-systems --show-trace
```

See `docs/architecture.md` for importer internals and `docs/hosts.md` for host composition.
