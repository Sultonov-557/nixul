# Nixul for LLMs

This file is the fastest way for an LLM to understand and explain Nixul without re-reading the whole repo.
It highlights architecture, workflows, option semantics, and angles for tutorials, reviews, or blog posts.

## Quick context

- Purpose: modular NixOS + Home Manager setup that keeps host folders thin and pushes reusable features into `nix/modules`.
- Style: flake-based, flake-parts driven, declarative and reversible; prefers small, composable modules over monoliths.
- Targets: Wayland desktops (Hyprland by default), curated dev/security toolchains, self-hosted services, and themed user experience via Stylix.

## Repository map (mental model)

- `flake.nix`: inputs (nixpkgs, home-manager, flake-parts, sops-nix, stylix, hyprland/niri, nixvim, panels), outputs per host via flake-parts.
- `nix/lib`: helper functions
  - `default.nix`: `mkSystems` that scans `nix/hosts`, builds `nixosSystem` per host, and wires modules + Home Manager with `inputs` in `specialArgs`.
  - `import-tree.nix`: recursively imports every `.nix` under `nix/modules` (unless a `default.nix` is present).
- `nix/modules`: shared features grouped by domain (apps, core, desktop, dev, hardware, services); auto-imported.
- `nix/nixul`: base options (`nixul.user/email/hostname/timezone/location`) and the cross-WM keybind system.
- `nix/hosts/<host>`: thin host definitions (hardware import, Home Manager import, host-specific keybinds/displays). Current hosts: `nomad`, `vanguard`.
- `nix/assets`: static files (logo, wallpapers) and `assets/secrets/secrets.yaml` for sops.
- `docs`: human docs (architecture, modules, workflows, recovery, secrets, hosts, customization). This file is the LLM-specific overlay.
- Tooling: `package.json` only for commit tooling; `bun.lock`/`node_modules` exist but are not central.

## Build, quality, and workflows

- Formatting: `nix fmt` (nixfmt, 2-space indent).
- Lint: `nix develop --command deadnix --fail .` (or `deadnix -- --fail .` if already installed).
- Checks/tests: `nix flake check --all-systems --show-trace`.
- Rebuilds: `nh os switch .#<host>` (or `nh os test/build/boot`).
- Dev shell: `nix develop` for nixfmt + deadnix.
- Rollback: `nh os rollback .#<host>` or select generation at bootloader.

## Architecture flow

1. `flake.nix` gathers inputs and calls `lib.mkSystems` with `hostsDir` + `modulesDir`.
2. `lib/mkSystems` builds a `nixosSystem` per host, injecting `inputs` into `specialArgs`, and imports `nix/nixul`, the host folder, Home Manager, and the shared module tree.
3. `nix/modules/default.nix` uses `import-tree.nix` to pull every module.
4. Modules are imported directly; each module defines its own options and gating.
5. System and Home Manager configs often live together in one module to keep behavior unified.

## Host model (thin)

- A host folder usually has `default.nix` (sets `nixul.*` and imports), `hardware-configuration.nix`, and optional `home.nix`/keybinds.
- Current hosts
  - `nomad`: Intel GPU, Hyprland, Noctalia panel, rich keybind set in `nix/hosts/nomad/keybinds/*.nix`, Stylix theme `gruvbox-material`.
  - `vanguard`: NVIDIA GPU + Intel, Hyprland, Noctalia, Stylix theme `gruvbox`, dual-monitor layout in `home.nix`.
- Adding a host: copy an existing folder, set `nixul.user/email/hostname/timezone/location`, import hardware config, adjust `home.nix` (monitors, desktop tweaks), set module booleans.

## Module system and options

- Options are defined per module; there is no auto-generated boolean.
- Modules can add their own options/imports and handle conditional logic internally.

## Feature catalog (by domain)

- Apps (`nix/modules/apps`): AI tools (Codex with instructions, OpenCode with provider presets, Gemini/Cursor), gaming stack (Steam, Lutris, Gamescope, Gamemode, Proton/Wine, Minecraft), media (mpv, ffmpeg, GIMP, Aseprite, Lutgen, Yandex Music, Spicetify), terminals (Ghostty, Kitty, Foot), file tools (Nautilus, Yazi, archives, ncdu, baobab), system utilities (GParted, Mission Center), browsers (Chrome, Zen, Tor), comms (Discord, Telegram, Thunderbird), productivity (Obsidian, LibreOffice, Todoist, Khal), qBittorrent.
- Core (`nix/modules/core`): bootloader (GRUB EFI, latest kernel, NTFS support), identity (locale/timezone/user shell), Nix tuning (allowUnfree, substituters including Hyprland/Niri caches, nix-index, nix-ld, nh), desktop basics (dbus, xdg), security (firewall + nftables, Unbound DNS with `home.` zone, systemd-resolved, Avahi, ACME defaults from `nixul.email`, Polkit, OpenSSH + HM ssh config, sysctl), maintenance (auto-upgrade, GC, journald tweaks), terminal tooling (fish/zsh shells, Starship, Atuin, The Fuck, fzf, ripgrep, zoxide, bat, eza, btop, tcpdump, lsof, tty-clock, fastfetch).
- Desktop (`nix/modules/desktop`): Wayland + X fallback toggles, display managers (GDM default; alternatives SDDM, Ly, Lemurs, Cosmic), WMs (Hyprland with defaults + settings + keybind adapter; Niri via upstream home module), panels (Noctalia with extensive settings split; Caelestia shell/launcher), components (Mako + ntfy notifications, polkit agents, cliphist, screenshot scripts with grim/slurp/swappy/wl-clipboard), theming (Stylix base, theme modules: Gruvbox, Gruvbox Material, Tokyo Night; Stylix targets adjust cursors/fonts/opacity).
- Dev (`nix/modules/dev`): editors (Nixvim with rich plugin set + options, Antigravity, Zed), git tooling (git, git-extras, GitHub CLI, LazyGit), multiplexers (Zellij with bundled `config.kdl`), runtimes (Node.js, Bun, Yarn, Prisma, Python, Rust, C++), HTTP clients/servers (xh, Bruno, Hurl, SimpleHTTP, ngrok), DB tools (DBeaver, usql), containers (Lazydocker), quality (Biome, Deadnix), security toolset (Metasploit, Caido, Wireshark, Bettercap, Nmap/Katana/Nuclei, Netcat, Ettercap, Wifite2, Hashcat/Hydra/John, wordlists, inetutils).
- Hardware (`nix/modules/hardware`): audio (PipeWire + WirePlumber, RTKit), Bluetooth (bluetoothd + Blueman), networking (NetworkManager), power (power-profiles-daemon, thermald, upower, brightnessctl helpers), CPUs (Intel/AMD toggles), GPUs (Mesa/OpenGL stack, NVIDIA settings), RAM (zram), storage (Udiskie, usb-automount helpers), inputs (QMK/VIA tools), printing/scanning (CUPS, HPLIP, SANE).
- Services (`nix/modules/services`): AI (Ollama with `glm-5:cloud`, Open WebUI proxied at `ai.home`), containers (Docker, Kubernetes helpers: kubectl/kind/minikube), databases (PostgreSQL, Redis), monitoring/dashboards (Dashy at `dashy.home`, Glance dashboard using `nixul.location` for weather), server (Nginx with `public.home` vhost pointing to `nix/assets/public`), VPN (WireGuard, Tailscale, OpenVPN). DNS entries for services integrate with Unbound when enabled.

## Desktop and UX specifics

- Hyprland module sets sane defaults (layout master, animations, input options, monitors default to `eDP-1`). Hosts can override monitors via Home Manager (see `nix/hosts/vanguard/home.nix`).
- Noctalia panel config is split by feature (`settings/*.nix`) and imports upstream `inputs.noctalia.homeModules.default`. Launcher, control center, widgets, OSD, etc., are all preconfigured; toggled via `nixul.desktop.panels.noctalia`.
- Caelestia panel/launcher uses `inputs.caelestia-shell`; weather location is hard-coded to Paris (TODO in module), so override if using it.
- Stylix is on by default when enabled; theme modules adjust fonts/cursors/colors and can enable matching Nixvim colorschemes.

## Editor stack (Nixvim focus)

- `nix/modules/dev/editor/nixvim` imports upstream Nixvim home module and splits config into `options.nix`, `keymaps.nix`, and `plugins/`.
- Plugins include AI helpers, autopairs, Blink completion, bufferline, Telescope, Treesitter, LSP with many servers (nixd, lua, rust, pyright, gopls, clangd, tailwind, etc.), formatting/linting, Trouble, todo-comments, Snacks UI, markdown helpers, terminal integration.
- Node.js support is on for Nixvim; it is set as default editor and ships manpages.
- Zellij config lives in `nix/modules/dev/multiplexers/zellij/zellij.kdl` and is symlinked via Home Manager.

## Keybind system (shared schema → WM-specific)

- Define semantic keybinds in host files under `nixul.keybinds` (see `nix/hosts/nomad/keybinds/*` for examples).
- Schema: keys (list of combos), action (spawn/focus/resize/workspace/etc.), optional args (direction/amount/workspace/cmd), flags (repeat/mouse), and `raw` escape hatches.
- Adapters translate schema into compositor config:
  - Hyprland: `nix/nixul/keybinds/adapters/hyprland` maps actions to `bind`/`binde`/`bindm` lines.
  - Niri: adapter scaffold exists; enable `nixul.desktop.wms.niri` to use upstream HM module.
- This keeps host keybinds portable across compositors while allowing raw overrides.

## Networking, DNS, and ingress patterns

- Unbound provides a `.home` zone with static records; modules append service records (e.g., `public.home`, `ai.home`, `glance.home`, `dashy.home`) when both the service and Unbound are enabled.
- Nginx is the default ingress; many services add virtual hosts that assume ACME is on for TLS. Static assets for `public.home` live in `nix/assets/public`.
- ACME defaults pull email from `nixul.email`. DNS-01 is not wired; defaults use resolver 1.1.1.1.

## Secrets and sensitive paths

- SOPS support is in `nix/modules/core/security/secrets/sops.nix`, importing `inputs.sops-nix`.
- Defaults: `sops.defaultSopsFile = ../../../assets/secrets/secrets.yaml`, Age key at `/home/${nixul.user}/.config/sops/age/keys.txt`.
- When describing secrets management, remind readers to keep secret files encrypted, set `SOPS_AGE_KEY_FILE`, and avoid committing decrypted content.

## Assets, themes, and branding

- Logo: `nix/assets/public/logo.png`; wallpapers in `nix/assets/public/wallpapers`.
- Static site served by Nginx `public` vhost uses the same directory.
- Stylix themes and fonts are defined in theme modules; cursors typically Bibata, fonts JetBrains Mono/Inter unless overridden.

## Pros, cons, and evaluation angles

- Pros
  - Thin hosts, thick shared modules make reuse and onboarding fast.
  - Modules stay discoverable through the shared tree without auto-generated options.
  - Unified system + Home Manager modules reduce drift between layers.
  - Opinionated desktop stack (Hyprland + Noctalia/Stylix) and dev stack (Nixvim/Zellij/git/security tools) ready out of the box.
  - Built-in ingress + DNS wiring (Nginx + Unbound) for self-hosted services.
- Cons / trade-offs
  - Single-user assumption (`nixul.user`) baked into many modules; multi-user setups need refactoring.
  - Some modules ship hard-coded values (Caelestia weather location, Glance bookmarks, Dashy links) that may need overrides.
  - Enabling many modules can bloat closures or pull heavy security suites; be selective per host.
  - Services expect local DNS/TLS plumbing (Unbound + ACME + Nginx); disabling one may require manual fixes.
  - `system.stateVersion` is set to `25.11`; changing channels may require bumps and compatibility checks.

## Talking points for blogs/docs/tutorials

- Why Nixul: predictable rebuilds with `nh`, unified module tree, quick host cloning, and curated defaults for Wayland power users.
- How it works: flake-parts + import-tree auto-discovery; describe the semantic keybind system as a portability layer.
- Desktop story: Hyprland + Noctalia + Stylix produce a cohesive UX; mention screenshot helpers and notification stack.
- Dev story: Nixvim-centric workflow with LSP/formatting, Git tools, Zellij multiplexer, and language runtimes.
- Services story: self-hosted dashboards (Dashy/Glance), AI stack (Ollama/Open WebUI), ingress and DNS automation.
- Customization: add modules under `nix/modules/<domain>/`, enable via `nixul.*`, adjust hosts for monitors/keybinds/themes.
- Risk mitigation: use `nix flake check`, `nh os test`, and `nix fmt`/`deadnix` before switching; keep secrets encrypted with sops.

## Common pitfalls and tips

- Set `nixul.location` if Glance weather is enabled; otherwise weather widget misbehaves.
- If using Caelestia, change the default weather location and terminal/app mappings in `nix/modules/desktop/panels/caelestia/appearance.nix`.
- DNS records for services rely on Unbound; if you skip Unbound, adjust `/etc/hosts` or Nginx server names.
- AI modules (Codex/OpenCode) ship custom instruction strings; be aware if stacking additional prompt rules.
- Remember to regenerate `hardware-configuration.nix` per device and keep host-specific overrides in `home.nix`/`system.nix`.

## Extending Nixul (for new features)

- Choose the right domain folder (`apps`, `core`, `desktop`, `dev`, `hardware`, `services`); keep folders under ~5 items or split further.
- Create a new module file (kebab-case). Example skeleton:
  ```nix
  { config, pkgs, inputs, ... }:
  {
    environment.systemPackages = [ pkgs.my-tool ];
    home-manager.users.${config.nixul.user}.programs.myTool.enable = true;
  }
  ```
- Declare options and gating inside the module itself when needed.
- Prefer shared modules over host-specific tweaks; keep host folders for hardware, monitors, and overrides.
- Run `nix fmt` + `deadnix` + `nix flake check` before switching.

## Behavioral expectations for LLM edits

- Follow AGENTS rules embedded in `AGENTS.md`: write understandable code, avoid comments unless clarifying complex logic, keep changes modular, and ask when uncertain.
- Use 2-space indentation for Nix, keep ASCII, and lean on `nix fmt`.
- Respect existing changes; avoid destructive git commands.
