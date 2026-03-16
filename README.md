# Nixul

Treat every machine like a tagged profile. Nixul is a NixOS + Home Manager stack that keeps hosts thin, pushes shared behavior into reusable modules, and lets you toggle full desktops, services, or per-user perks through tags.

## Highlights
- **Unified tree** – System and user modules share the same structure, so shells, editors, aliases, and keybinds stay aligned everywhere.
- **Tag-driven intent** – Hosts only declare hardware and a short tag list; tags fan out into entire desktops, infra bundles, or user add-ons.
- **Production habits** – Formatting, linting, and `flake check` are first-class, and modules default to sane, audited configurations.
- **Batteries included** – Wayland stacks, Stylix themes, developer shells, observability tools, and AI assistants ship ready to flip on.

## Layout at a glance
| Location | Purpose |
| --- | --- |
| `flake.nix` | Wires inputs, exposes helpers from `nix/lib`, and defines the `nixul` flake outputs. |
| `nix/lib` | Auto-imports modules, loads tags/themes, and offers host utilities. |
| `nix/modules/**` | Feature modules grouped by domain (`apps`, `core`, `desktop`, `dev`, `hardware`, `services`). Each file gates one capability. |
| `nix/hosts/<name>` | Real machines. They import hardware, pick users, and call `loadTags`. |
| `nix/nixul/**` | Shared user options: aliases, keybinds, bookmarks, theme presets, and tag definitions. |
| `docs/*.md` | Operational guides. `docs/LLM.md` exists but is intentionally left untouched during audits. |

## Batteries you actually use
- **Desktops & UX** – Hyprland, Niri, Caelestia/Noctalia panels, stylix-powered themes, curated terminal + launcher stack.
- **Developers** – Nixvim profiles, language runtimes (Node.js, Python, Rust, C++), multiplexers, Git helpers, DB/HTTP clients.
- **Apps & workflows** – Browsers, media suites, messaging, security tooling, aliases, bookmarks, and tag-aware user bundles.
- **Infra** – Ollama + Open WebUI, nginx ingress, VPN profiles, DNS/monitoring, sops-nix secrets, and container helpers.

## Getting started
1. **Prep nix** – Use an existing NixOS host with flakes enabled; install [`nh`](https://github.com/viperML/nh) if you prefer that UX.
2. **Clone** – `git clone <repo> /etc/nixos && cd /etc/nixos`.
3. **Pick a base** – Copy a host from `nix/hosts/*` (e.g., `nomad`, `vanguard`) and rename it.
4. **Wire hardware** – Drop in `hardware-configuration.nix`, set `nixul.host.name`, and enable your preferred tags via `loadTags [ ... ]`.
5. **Switch** – `nh os switch .#<host>` or `sudo nixos-rebuild switch --flake .#<host>`.

See `docs/installations.md` for the full walkthrough, including partitioning notes and remote builds.

## Daily commands
| Action | Command |
| --- | --- |
| Switch host | `nh os switch .#<host>` or `sudo nixos-rebuild switch --flake .#<host>` |
| Dry-run/test | `nh os test .#<host>` |
| Build only | `nh os build .#<host>` |
| Roll back | `nh os rollback .#<host>` |
| Format | `nix fmt` |
| Dead code scan | `nix develop --command deadnix --fail .` |
| Evaluate | `nix flake check --all-systems --show-trace` |

## Learn the system
- `docs/architecture.md` – Import tree, tag loader, host lifecycle.
- `docs/modules.md` – Writing feature modules, defining options, and gating behavior.
- `docs/hosts.md` – Keeping machines thin and cloning them safely.
- `docs/workflows.md` – Day-two ops, debugging, and reproducible maintenance.
- `docs/customization.md`, `docs/secrets.md`, `docs/recovery.md`, `docs/faq.md`, `docs/installations.md` – Specific drill-downs for tuning, secrets, failures, and onboarding.

## Contributing without chaos
- Run `nix fmt`, `nix develop --command deadnix --fail .`, and `nix flake check --all-systems --show-trace` before sending changes.
- Keep modules scoped and composable; prefer new tags over duplicating host config.
- Document new toggles or workflows under `docs/` so the tree stays self-explanatory.
- Share improvements across users/hosts instead of forking behavior per machine.
