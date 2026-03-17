# Nixul

Nixul is a modular NixOS + Home Manager flake. Hosts stay small, shared behavior lives in `nix/modules`, and role-based tags in `nix/nixul/tags` compose desktops, services, and per-user tooling.

## Quick start
1. Install on an existing NixOS machine with flakes enabled.
2. Clone this repo into `/etc/nixos`.
3. Copy `nix/hosts/example` or another host directory to your hostname.
4. Update `nix/hosts/<host>/default.nix` and set tags with `loadTags`.
5. Run `nh os test .#<host>` and then `nh os switch .#<host>`.

Full walkthrough: `docs/installations.md`.

## Key paths
- `flake.nix` - inputs, outputs, `nixosConfigurations`, checks/packages.
- `nix/lib/default.nix` - `mkSystem`/`mkSystems`, helper injection.
- `nix/lib/module-importer.nix` and `nix/lib/module-importer/*` - module discovery, option generation, host/home evaluation.
- `nix/modules/**` - shared feature modules.
- `nix/hosts/<name>` - host entrypoints.
- `nix/nixul/tags/host/**` and `nix/nixul/tags/user/**` - host/user tag bundles.
- `docs/README.md` - documentation index.

## Common commands
| Action | Command |
| --- | --- |
| Format | `nix fmt` |
| Lint | `nix develop --command deadnix --fail .` |
| Evaluate checks | `nix flake check --all-systems --show-trace` |
| Build host | `nh os build .#<host>` |
| Test host | `nh os test .#<host>` |
| Switch host | `nh os switch .#<host>` |
| Roll back | `nh os rollback .#<host>` |

`nh os test` activates a temporary generation for validation; it is not set as the boot default.

## Read next
- `docs/architecture.md` - how the importer, tags, and hosts fit together.
- `docs/modules.md` - module contracts and option paths.
- `docs/hosts.md` - host structure and tag usage.
- `docs/workflows.md` - daily operations and troubleshooting.
- `docs/secrets.md` - `sops-nix` workflow.
