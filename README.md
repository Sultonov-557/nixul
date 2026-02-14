# nixul

![Nixul logo](nix/assets/public/logo.png)

Modular NixOS + Home Manager configs that keep hosts thin and the shared module tree rich. Built to be fast, reversible, and calm enough for 3 AM fixes.

## What is this?

Declarative NixOS setups using flake-parts, with shared modules that configure system and user layers together (see `nix/modules/desktop/wms/hyprland`). Hosts carry only hardware, hostname, and small overrides.

## Quick start

1. Install NixOS with flakes enabled; install `nh` (`nix profile install nixpkgs#nh`).
2. Clone this repo to the machine.
3. Copy a host folder under `nix/hosts/`, set `nixul.user`, hostname, and drop in the generated `hardware-configuration.nix`.
4. Optional: adjust `home.nix` for displays and apps.
5. Build and switch: `nh os switch .#<host>`.

## Daily commands

- Rebuild and switch: `nh os switch .#<host>`
- Test without switching: `nh os test .#<host>`
- Boot next reboot only: `nh os boot .#<host>`
- Build only: `nh os build .#<host>`
- Format: `nix fmt`
- Lint: `nix run nixpkgs#deadnix -- --fail .`
- Check everything: `nix flake check --all-systems --show-trace`

## Documentation

- Install, updates, troubleshooting: [docs/workflows.md](docs/workflows.md), [docs/recovery.md](docs/recovery.md)
- Architecture and modules: [docs/architecture.md](docs/architecture.md), [docs/modules.md](docs/modules.md)
- Hosts and new machines: [docs/hosts.md](docs/hosts.md)
- Secrets and customization: [docs/secrets.md](docs/secrets.md), [docs/customization.md](docs/customization.md)
- FAQs: [docs/faq.md](docs/faq.md)

## Philosophy (short)

- Shared modules first, host overrides last.
- Panic-friendly over clever.
- One module can set both system and home when they belong together.

## License / credits

Personal NixOS config; reuse the ideas. Powered by NixOS, flake-parts, Home Manager, Stylix, sops-nix, Hyprland, and friends.
