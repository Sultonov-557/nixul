# Installation Guide

Use this guide for first-time setup on a machine that already runs NixOS.

## Prerequisites
- Flakes enabled.
- `git` installed.
- Optional: `nh` (`nix profile install nixpkgs#nh`).
- Repo access (fork or upstream clone URL).

## Clone safely
From the target machine:

```bash
sudo mkdir -p /etc/nixos
if [ -d /etc/nixos ] && [ "$(ls -A /etc/nixos 2>/dev/null)" ]; then sudo mv /etc/nixos /etc/nixos.backup.$(date +%s); fi
sudo git clone <repo-or-fork-url> /etc/nixos
cd /etc/nixos
```

This avoids destructive deletion of existing configs.

## Create a host
1. Copy a baseline host:
   ```bash
   cp -r nix/hosts/example nix/hosts/<host>
   ```
2. Generate hardware config on the target machine:
   ```bash
   sudo nixos-generate-config --show-hardware-config > nix/hosts/<host>/hardware-configuration.nix
   ```
3. Edit `nix/hosts/<host>/default.nix`:
   - set `nixul.host.name`, `timezone`, and optional `location`
   - import `../../users/<user>`
   - choose tags with `loadTags [ ... ]`

## Choose tags
Host tags are files under `nix/nixul/tags/host`.

```nix
loadTags [
  "base"
  "compositor/hyprland"
  "display-manager/gdm"
  "dev/node"
]
```

User tags live under `nix/nixul/tags/user` and are loaded with `loadUserTags` where needed.

## Validate and activate
Run from repo root:

```bash
nix fmt
nix develop --command deadnix --fail .
nix flake check --all-systems --show-trace
nh os test .#<host>
nh os switch .#<host>
```

`nh os test` activates a temporary generation for the running session. It is not persisted as the default boot generation.

Alternative without `nh`:

```bash
sudo nixos-rebuild test --flake .#<host>
sudo nixos-rebuild switch --flake .#<host>
```

## After first switch
- Track upstream and rebase regularly.
- Keep host-specific values in `nix/hosts/<host>` and move reusable logic to `nix/modules` plus tags.
- See `docs/workflows.md` for daily operations.
- See `docs/secrets.md` if host requires encrypted material.
