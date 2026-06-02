---
description: Durable info about the nixul NixOS config project
label: project
limit: 5000
read_only: false
---
# Nixul — Sultonov's Personal NixOS Config

## Key Facts
- **Stack:** NixOS + Home Manager + flake-parts + custom module importer (`nix/lib/module-importer.nix`)
- **Hosts:** nomad (laptop), sentinel, vanguard
- **Format:** 2-space indent, kebab-case files/options, conventional commits
- **Commands:** `nix fmt`, `deadnix --fail .`, `nix flake check`, `nh os build/test/switch .#<host>`
- **Themes:** via `loadTheme "<name>"` from `nix/nixul/themes/`
- **Secrets:** sops-nix, encrypted in `nix/assets/secrets/`, `SOPS_AGE_KEY_FILE` env var
- **Module roots:** `nixul.host.modules.<path>` (system), `nixul.users.<name>.modules.<path>` (home)
- **Module cats:** core, apps, desktop, dev, hardware, services
- **WMs:** Hyprland, Niri, GNOME
- **Panels:** Noctalia (feature-rich), Caelestia, Ambxst
- **Editor:** nixvim (heavy), Zed, Cursor
- **Shell:** fish (default), zsh, nushell
- **Terminal:** ghostty primary
- **Obsidian vault** configured for note-taking linked to this project

## Pitfalls
- No old flat `nixul.user`/`nixul.email` — use `nixul.host.*` / `nixul.users.*`
- No host-specific `home.nix` — use module importer
- No `import-tree.nix` — use `module-importer.nix`
