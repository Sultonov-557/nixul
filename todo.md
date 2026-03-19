- [x] feat: add hurl http client
- [x] fix(nixvim): move lines with alt+arrow
- [x] refactor(nixul): move timezone to nixul options
- [x] feat: add khal
- [x] feat: some kind of theme switcher
- [x] feat: add gruvbox-material
- [x] feat: add cosmic-greeter
- [x] feat: add dms-greeter
- [x] fix(hyprland): resize and move windows with keybinds
- [x] fix(noctalia): configure noctalia shell
- [x] refactor(niri): split niri into multiple files
- [x] fix(hashcat): make hashcat work
- [x] feat: add lemurs
- [x] feat: add ly
- [x] feat: add sddm
- [x] feat: add lutgen
- [x] feat: add tty clock
- [x] feat: papirus icons
- [x] fix(noctalia): move ocd to bottom
- [x] feat: add caelestia-shell
- [x] feat: add glance
- [x] feat: universal keybindings
- [x] feat(keybinds): hyprland adapter for universal keybindings
- [x] feat(keybinds): niri adapter for universal keybindings
- [x] feat: multi-users system
- [x] feat: better options structure for modules
- [x] fix: add options to all modules
- [x] feat: profiles, host/user tags for module imports
- [x] feat: universal options for bookmarks for dashboards, browsers, etc.
- [x] feat: universal options for aliases and adapters for bash, zsh, fish
- [x] feat: option for unbound domains
- [x] feat: decomple dependency's e.g nginx is dependent on unbound
- [x] feat: add nixul import for all modules
- [x] fix: default options for shell
- [x] fix: integrate themes
- [x] feat: add vicinae
- [x] feat: add mini-ai to nixvim
- [x] feat: add adguardhome
- [x] feat: add devenv
- [x] feat: add nix-init
- [x] feat: add nix-tree
- [x] feat: add winboat
- [x] feat: add worktrunk
- [x] feat: add nix-melt
- [x] feat: add vulnix
- [x] feat: add nushell
- [x] feat: add really really good aliases
- [x] feat(glance): make glance great again!!!
- [x] feat: opencode agent orchestration
- [x] fix: find old modules and convert to new format
- [x] feat: add litellm
- [x] feat: add llm api keys to secrets
- [x] feat: add log viewer module lnav
- [x] feat: add openclaw
- [x] feat: integrate sops
- [x] feat: add sops based ssh servers
- [x] feat: break everything down to tags
- [x] feat: add metadata to modules
- [x] plan(layering): map tag/user/host precedence rules in docs with real examples
- [x] feat: fail2ban module
- [x] feat: language dev modules (go, rust, zig, python)

- [x] test experimental features and merge with main branch

- [-] feat: universal options for many modules
- [-] feat: good, like really really good, documentation

- [ ] fix(zen): fix zen browser after github.com/0xc000022070/zen-browser-flake/issues/237 is resolved
- [ ] fix(litellm): delete workaround after https://github.com/NixOS/nixpkgs/issues/432925 is resolved

- [ ] feat: project templates (node, rust, python)
- [ ] feat: nixul new <template> command

- [ ] feat: nixul cli
- [ ] feat: nixul update
- [ ] feat: nixul doctor
- [ ] feat: nixul rebuild
- [ ] feat: nixul garbage-collect
- [ ] feat: nixul list enabled modules

- [ ] feat: security audit module
- [ ] feat: add vault warden
- [ ] feat: yubikey support
- [ ] feat: disk encryption helpers

- [ ] feat: add config to json extractor
- [ ] feat: self documenting system
- [ ] feat: generate website from config
- [ ] feat: nixul system diagram generator
- [ ] feat: module tree visualizer

- [ ] feat: module integrations

- [ ] feat: multi-host orchestration

- [ ] feat(debug): add `nixul trace` command (or script) to show final merged values for selected option paths
- [ ] feat(validation): add check that warns on conflicting overrides across tags, hosts, and users for the same module subtree
- [ ] refactor(modules): add explicit `enable` + `preset` options for opinionated modules so defaults are easy to keep or override
- [ ] docs(modules): document module default behaviors and override points in a consistent per-module template
- [ ] perf(profiles): split heavy all-in bundles into slim/base/full profiles to reduce closure size and build time
- [ ] perf(metrics): add flake check output for closure-size/build-time deltas to catch profile bloat early
- [ ] feat(multi-user): provide reusable multi-user tags and examples for shared vs per-user module ownership
- [ ] feat(guardrails): add assertions/checks for duplicate primary-user assumptions and unsafe host-only toggles in multi-user setups

- [ ] feat: 100% declarative. no exeptions.

### maybe

- [ ] feat: if somehow litellm runs out of credit, https://github.com/cheahjs/free-llm-api-resources

- [ ] feat: add Authentik
- [ ] feat: try out mineflake
- [ ] feat: add nixarr
- [ ] feat: bloat vicinae with extensions
- [ ] feat: bloat nixvim

### take inspiration from

- [ ] https://github.com/anotherhadi/nixy
- [ ] https://github.com/Frost-Phoenix/nixos-config/blob/main/modules/home/packages/cli.nix
- [ ] https://gitlab.com/Zaney/zaneyos
- [ ] https://github.com/Syndrizzle/hotfiles
- [ ] https://github.com/namishh/crystal
- [ ] https://github.com/Stardust-kyun/calla
- [ ] https://github.com/nix-media-server/nixarr
- [ ] https://github.com/kkkykin/nix-config
