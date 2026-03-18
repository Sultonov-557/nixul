# Nixul for LLMs

This file is the fastest way for an LLM to understand and explain Nixul without re-reading the whole repo.
It reflects the current architecture based on host/user tags plus the module importer.

## Quick context

- Purpose: modular NixOS + Home Manager flake where hosts stay thin and reusable behavior lives in `nix/modules`.
- Composition model: `loadTags` and `loadUserTags` create base module trees, then hosts/users override with `lib.recursiveUpdate`.
- Scope: desktop systems (Hyprland/Niri), developer tooling, security tooling, and optional self-hosted services.

## Repository map (mental model)

- `flake.nix`: defines inputs and builds `nixosConfigurations` for every folder under `nix/hosts`.
- `nix/lib/default.nix`: `mkSystem`/`mkSystems`, injects `loadTags`, `loadUserTags`, and `loadTheme` via `specialArgs`.
- `nix/lib/module-importer.nix`: discovers module files, builds generated option trees, evaluates `system` and `home` module functions.
- `nix/lib/module-importer/*`: importer internals (`discover.nix`, `module-loader.nix`, `options.nix`, `host.nix`, `users.nix`, `types.nix`, `utils.nix`).
- `nix/modules/**`: shared module files grouped by domain (`apps`, `core`, `desktop`, `dev`, `hardware`, `services`).
- `nix/nixul/tags/host/**`: reusable host-side bundles.
- `nix/nixul/tags/user/**`: reusable per-user bundles.
- `nix/nixul/themes/*`: theme modules loaded through `loadTheme`.
- `nix/hosts/<host>`: host entrypoints (`default.nix`, hardware config, optional `bookmarks.nix`).
- `nix/users/<user>`: user entrypoints (`nixul.users.<name>` plus user tags and overrides).
- `nix/assets/public`: static assets (logo, wallpapers); `nix/assets/secrets/`: encrypted secrets files.

## Build, quality, and workflows

- Format: `nix fmt`.
- Lint: `nix develop --command deadnix --fail .`.
- Checks/tests: `nix flake check --all-systems --show-trace`.
- Build host: `nh os build .#<host>`.
- Validate activation: `nh os test .#<host>`.
- Persist activation: `nh os switch .#<host>`.
- Roll back: `nh os rollback .#<host>`.

## Architecture flow

1. `flake.nix` calls `nix/lib/default.nix` to generate one `nixosSystem` per host directory.
2. Base modules for each host are: `nix/nixul`, `nix/hosts/<host>`, Home Manager module wiring, and `nix/lib/module-importer.nix`.
3. Hosts set `nixul.host.modules`; users set `nixul.users.<name>.modules`.
4. Importer discovers `nix/modules/**` and maps each file path to an option path.
5. Importer evaluates each module's `system` and `home` functions with that module's `cfg` subtree.

## Module contract and generated options

- Module files can return `options`, `system`, and `home` attributes.
- Generated option roots:
  - `nixul.host.modules.<path>` for host-side modules.
  - `nixul.users.<user>.modules.<path>` for per-user modules.
- Path mapping is file-based. Example: `nix/modules/services/ai/ollama.nix` -> `services.ai.ollama`.
- Keep modules focused, kebab-case, and reusable; prefer splitting over adding broad feature flags.

## Host and user model

- Hosts are thin and focus on machine identity plus module selection.
- Host fields are under `nixul.host` (not the old flat `nixul.user/email/hostname/...` style).
- Current host folders: `nix/hosts/nomad`, `nix/hosts/vanguard`, and `nix/hosts/example`.
- User definitions live under `nix/users/*` and populate `nixul.users.<name>`.
- `nixul.primaryUser` is set from user entrypoints and used by modules that need a default user context.

## Tags and themes

- Host tags: load from `nix/nixul/tags/host/**` with `loadTags [ ... ]`.
- User tags: load from `nix/nixul/tags/user/**` with `loadUserTags [ ... ]`.
- Themes: load from `nix/nixul/themes/*` with `(loadTheme "<name>")` in host imports.
- Recommended composition pattern: tags for reusable baseline, explicit `modules = { ... }` overrides for host/user specifics.

## Key universal subsystems

- Keybind schema/adapters: `nix/nixul/universal/keybinds/**` with Hyprland and Niri adapters.
- Bookmarks schema/adapters: `nix/nixul/universal/bookmarks/**` for browser/dashy/glance outputs.
- Aliases: `nix/nixul/universal/aliases/**`, typically configured from user files.
- Secrets: `nix/modules/core/security/secrets/sops.nix` with encrypted data under `nix/assets/secrets/`.

## Reliable talking points

- Nixul uses generated module option trees instead of hand-wiring every shared module.
- Tags are first-class composition units for both host and user config.
- Hosts stay small; most behavior belongs in modules or tags.
- System and Home Manager concerns can be co-located in one module file (`system` + `home`).
- The operational loop is `nix fmt` -> `deadnix` -> `nix flake check` -> `nh os test/switch`.

## Feature catalog (high-level by domain)

- Apps (`nix/modules/apps`): AI CLI/desktop tools, gaming launchers and compatibility tools, browsers, communication apps, media tooling, terminals, and productivity apps.
- Core (`nix/modules/core`): boot, locale/time/user identity, Nix tooling (`nh`, docs, nix-index, nix-ld), security/network defaults, and maintenance tasks.
- Desktop (`nix/modules/desktop`): compositor modules (Hyprland/Niri), display manager modules, panel modules (Noctalia/Caelestia), notifications, screenshots, clipboard, and theming.
- Dev (`nix/modules/dev`): editors (notably Nixvim), VCS tooling, runtimes, HTTP/database tooling, quality tools, and security/research tooling.
- Hardware (`nix/modules/hardware`): audio, bluetooth, networking, power management, CPU/GPU toggles, storage helpers, and printing/scanning.
- Services (`nix/modules/services`): AI services, containers, databases, dashboards/monitoring, reverse proxy, and VPN services.

## Desktop and UX specifics

- Hyprland and Niri are modeled as modules under `desktop.wms.*`, so hosts can switch compositor strategy without changing unrelated config.
- Panel stacks are explicit toggles (`desktop.panels.noctalia`, `desktop.panels.caelestia`) and can coexist in config while only one is actively enabled.
- Theming is host-driven via `loadTheme`, then materialized through theme modules under `nix/nixul/themes/*`.
- Host monitor layouts are usually set as host-level overrides in `nix/hosts/<host>/default.nix`.

## Networking, DNS, ingress, and secrets

- Network/security behavior is assembled from core modules plus host tags and explicit overrides.
- Service modules can depend on host-level choices (for example reverse proxy or DNS conventions), so explain them as composable, not globally always-on.
- Secrets are expected to stay encrypted in-repo (`nix/assets/secrets/`) with `sops-nix` integration from module config.
- When documenting secret flows, include `SOPS_AGE_KEY_FILE` setup and remind readers not to commit decrypted material.

## Pros and trade-offs

- Pros:
  - Strong reuse via tags + generated option trees.
  - Thin host entrypoints reduce copy/paste drift.
  - Clear separation of reusable behavior (`nix/modules`) from machine intent (`nix/hosts`) and user intent (`nix/users`).
  - Easy to explain operational lifecycle with `nh` and flake checks.
- Trade-offs:
  - Tag + override layering can be hard to reason about if too many overrides are applied in hosts/users.
  - Some modules are intentionally opinionated, so users may need to override defaults for local preferences.
  - Large all-in profiles can increase closure size and build time.
  - Multi-user scenarios require deliberate `nixul.users.*` design, not just host-level toggles.

## Blog and tutorial angles

- Architecture walkthrough: start from `flake.nix` -> `mkSystems` -> `module-importer` -> generated option trees.
- Composition story: show how `loadTags`/`loadUserTags` produce baseline profiles and how `lib.recursiveUpdate` customizes per host/user.
- Practical migration story: how to move a monolithic host config into reusable module files and tags.
- Desktop story: compositor + panel + theme as separate toggles instead of one giant desktop module.
- Ops story: repeatable day-two workflow (`fmt`, lint, check, test, switch, rollback).

## Evaluation checklist for reviews

- Is reusable behavior in `nix/modules/**` instead of duplicated in host files?
- Are tags used for shared bundles and overrides used only for host/user specifics?
- Do option paths align with generated trees (`nixul.host.modules.*`, `nixul.users.<name>.modules.*`)?
- Are secrets encrypted and referenced through `sops` paths?
- Do docs and examples use current architecture terms (module importer, tags, users)?

## Common pitfalls to avoid in explanations

- Do not describe the old `import-tree.nix` auto-import architecture; current code uses `module-importer.nix`.
- Do not reference old flat option fields like `nixul.user` or `nixul.email`; use `nixul.host.*` and `nixul.users.*`.
- Do not assume host-specific `home.nix` files are the primary pattern; user config is now centered under `nix/users/*`.
- Do not claim all services are enabled by default; tags and per-host overrides decide that.

## LLM editing expectations

- Follow `AGENTS.md` and keep edits modular.
- Prefer touching `nix/modules/**`, `nix/nixul/tags/**`, or `nix/users/**` before adding host-specific duplication.
- Keep Nix formatting compatible with `nix fmt` (2-space style).
- Validate with `nix fmt`, `nix develop --command deadnix --fail .`, and `nix flake check --all-systems --show-trace` when making code changes.
