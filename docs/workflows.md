# Workflows

## Command semantics (`nh`)
- `nh os build .#<host>`: build only, no activation.
- `nh os test .#<host>`: build and activate a temporary generation for validation.
- `nh os switch .#<host>`: build, activate, and persist generation as default.
- `nh os rollback .#<host>`: roll back to the previous persisted generation.

`test` is non-persistent: reboot returns to persisted default unless `switch` was run.

## Daily loop
```bash
nix fmt
nix develop --command deadnix --fail .
nix flake check --all-systems --show-trace
nh os test .#<host>
nh os switch .#<host>
```

## Input updates
```bash
nix flake update
nix flake check --all-systems --show-trace
nh os test .#<host>
```

Review `flake.lock` before switching.

## Debugging
- Full traces: `nix flake check --all-systems --show-trace`.
- Build one host: `nix build .#<host> --show-trace`.
- Refresh fetches: `nix build --refresh .#<host>`.
- Find wrong option/tag usage: `rg "<term>" nix/modules nix/nixul/tags nix/hosts`.

## Rollback and recovery
- Fast rollback: `nh os rollback .#<host>`.
- Bootloader fallback: choose older generation if system fails to boot.
- Garbage collect only after a known-good generation exists: `nix-collect-garbage -d`.

See `docs/installations.md` for first install and `docs/recovery.md` for incident procedures.
